(*
Copyright (C) 2020, Sridharan S

This file is part of Inscript Keyboard.

Inscript Keyboard is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Inscript Keyboard is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License version 3
along with Inscript Keyboard.  If not, see <http://www.gnu.org/licenses/>.
*)
{
Library to hangle Map logic
}
unit DIHookUtil;

interface
uses
  Classes,
  Windows,
  Dialogs,
  Messages,
  SysUtils,
  StrUtils,
  BSearch3,
  EZDSLHsh;

{
Key is added at the rightmost position
So while searching n characters from right have significance
}
{
SCIM_n    Set of Codepoints to send for a layout
SCIMLen  No of Codepoints to send for a layout
BufStr  Previous Keys cache
SCIMUndo Previous Code Points' Cache
}
type
  TSCIM_4 = array [0..3] of integer;
  pSCIM_4 = ^TSCIM_4;
  TSCIM_3 = array [0..2] of integer;
  pSCIM_3 = ^TSCIM_3;
  TSCIM_2 = array [0..1] of integer;
  pSCIM_2 = ^TSCIM_2;
  TSCIM_1 = array [0..0] of integer;
  pSCIM_1 = ^TSCIM_1;

{Define a record for recording and passing information process wide}
type
  PHookRec = ^THookRec;
  THookRec = packed record
    TheHookHandle: HHOOK;
    KeyboardName: string;
//    TheAppWinHandle: HWND;
    current_vkCode: DWORD;
    shiftkey_pressed: bool;
    capslock_pressed: bool;
    altkey_pressed: bool;
    controlkey_pressed: bool;
//    spacebar_pressed: bool;
    backspace_pressed: bool;
    NUMLOCK_pressed: BOOL;
    SCROLLLOCK_pressed: BOOL;
    KeyChanged: bool;
//    previous_1_character: integer;
//    previous_2_character: integer;
    character_pressed: WORD;
(*Hinstance of the calling exe *)
//    callapp_hInst: HWND;
    Keyboard_Enabled: bool;
    NextKeboardName: string;
    SCIMLen: integer;
    IsUnicode: Boolean;
    IsBS_scancode: boolean;
  end;

  tagKBDLLHOOKSTRUCT = record
    vkCode: DWORD;
    scanCode: DWORD;
    flags: DWORD;
    time: DWORD;
    dwExtraInfo: cardinal;
  end;
  KBDLLHOOKSTRUCT = tagKBDLLHOOKSTRUCT;
  PKBDLLHOOKSTRUCT = ^tagKBDLLHOOKSTRUCT;
  LPKBDLLHOOKSTRUCT = ^tagKBDLLHOOKSTRUCT;
//type
//  TIntArray = array of Integer;
Const
  BufLen = 5;
{  UndoLen = 12; }
  UndoLen = 1024;
  valid_keys: array [1..63] of DWord = (
{ Backspace, enter keys }
   $08, $0D,
{ Special characters ESC }
  $1B,
{ space key }
  $20,
{ numbers - 10 }
  $30, $31, $32, $33, $34, $35, $36, $37, $38, $39,
{ alphabets - 26 }
  $41, $42, $43, $44, $45, $46, $47, $48,
  $49, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51,
  $52, $53, $54, $55, $56, $57, $58, $59, $5A,
{ alphabets - 26 }
//  $61, $62, $63, $64, $65, $66, $67, $68,
//  $49, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51,
//  $52, $53, $54, $55, $56, $57, $58, $59, $5A,
{ funcion keys F1 to F12 }
  $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $7A, $7B,
{ special characters ; - , + / . }
// ; + , - . /
  $BA, $BB, $BC, $BD, $BE, $BF,
{ special characters ~ [ \ ] ' }
// ` [ \ ] '
  $C0, $DB, $DC, $DD, $DE
  );

(*define visible keystrokes array other than alphabets & also the backspace and spacebar keys*)
(*` [ ] ; ' \  , . / - + 0 1 2 3 4 5 6 7 8 9*)
//visiblekeys: array [0..21] of DWORD = ($C0,$DB,$DD,$DE,$BA,$DC,$DE,$BC,$BE,$BF,$BD,$BB,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39);
//visiblekeys: array [1..21] of integer = ($30,$31,$32,$33,$34,$35,$36,$37,$38,$39, $BA, $BB, $BC, $BD, $BE, $BF, $C0, $DB, $DC, $DD, $DE);
visiblekeys: array [1..47] of DWord = (
  $30, $31, $32, $33, $34, $35, $36, $37, $38, $39,
  $41, $42, $43, $44, $45, $46, $47, $48,
  $49, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51,
  $52, $53, $54, $55, $56, $57, $58, $59, $5A,
  $BA, $BB, $BC, $BD, $BE, $BF, $C0, $DB, $DC, $DD, $DE);

Uir: array [1..13] of DWord = (
$5F, $60, $61, $64, $65, $66, $67, $71, $72, $73, $74, $77,
$7A
);

Mei: array [1..40] of DWord = (
//$22, $26, $27, $2F, $3A, $3B, $3C,
{"   &    '    *    /    :    ;    <}
$22, $26, $27, $2A, $2F, $3A, $3B, $3C,
{    C    H    I    J    K    B    M    N     O}
$42, $43, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F,
{P    U   V    Y    [    ^}
$50, $55, $56, $59, $5B, $5E,
//$5D,
{b   c    h    i    j    k    l    m    n    o}
$62, $63, $68, $69, $6A, $6B, $6C, $6D, $6E, $6F,
{p   u    v    y    {     }
$70, $75, $76, $79, $7B,  $7D
);

threadvar
  hObjHandle: THandle; {Variable for the file mapping object}
  lpHookRec: PHookRec; {Pointer to our hook record}
  keyboardmap: THashTable;
//  BufStr: array [1..BufLen] of AnsiChar = '     ';
  BufStr: array [1..BufLen] of AnsiChar;
//  prev_ucchar_length: integer = 0;
  prev_ucchar_length: integer;
  SCIMUndo: array [1..UndoLen]of byte;

  procedure GetKbdMap;
  procedure LoadKbdMap(const Kee: array of Ansistring; fee: array of integer);
  function DoKeyboard: boolean;
  procedure GenLangCode(const iChars: array of integer);
  function ApplySCIM(const KeyLen: integer): boolean;
  procedure ErrorDlg(const Msg: string);
  procedure GenKey(const vk: integer;  const bUnicode: bool);

  procedure MapFileMemory(dwAllocSize: DWORD);
  procedure UnMapFileMemory;

implementation
uses
//  DTMap1, DTMap2, DTMap3, DTMap4, DTMap5, DTMap7, DTMap8, DTMap9, DTMap10,
//  DTMap12;
  DIMap1, DIMap2;

procedure GetKbdMap;
var
  Count: Integer;
begin
  if (lpHookRec^.KeyboardName <> lpHookRec^.NextKeboardName) then
  begin
    lpHookRec^.KeyboardName := lpHookRec^.NextKeboardName;
    KeyBoardMap.Empty;
    lpHookRec^.IsUnicode := False;
  end;
{
  if lpHookRec^.NextKeboardName = 'ISCII Typewriter' then
  begin
    lpHookRec^.SCIMLen := 1;
    KeyBoardMap.TableSize := 350;
    LoadKbdMap(BTKee, BTFee);
  end;
  if lpHookRec^.NextKeboardName = 'Tam Typewriter' then
  begin
    lpHookRec^.SCIMLen := 1;
    KeyBoardMap.TableSize := 350;
    LoadKbdMap(ATKee, ATFee);
  end;
  if lpHookRec^.NextKeboardName = 'Tam Inscript' then
  begin
    lpHookRec^.SCIMLen := 3;
    KeyBoardMap.TableSize := 600;
    LoadKbdMap(AIKee, AIFee);
  end;
  if lpHookRec^.NextKeboardName = 'ISCII Inscript' then
  begin
    lpHookRec^.SCIMLen := 3;
    KeyBoardMap.TableSize := 600;
    LoadKbdMap(BIKee, BIFee);
  end;

  if lpHookRec^.NextKeboardName = 'Tau Typewriter' then
  begin
    lpHookRec^.SCIMLen := 4;
    KeyBoardMap.TableSize := 600;
    LoadKbdMap(UTKee, UTFee);
    lpHookRec^.IsUnicode := True;
  end;
}
  if lpHookRec^.NextKeboardName = 'Tamil Inscript' then
  begin
    lpHookRec^.SCIMLen := 4;
    KeyBoardMap.TableSize := 300;
    LoadKbdMap(UIKee, UIFee);
    lpHookRec^.IsUnicode := True;
  end;
  if lpHookRec^.NextKeboardName = 'Devanagari Inscript' then
  begin
    lpHookRec^.SCIMLen := 4;
    KeyBoardMap.TableSize := 300;
    LoadKbdMap(UDKee, UDFee);
    lpHookRec^.IsUnicode := True;
  end;
{
  if lpHookRec^.NextKeboardName = 'Tau Phonetic' then
  begin
    lpHookRec^.SCIMLen := 4;
    KeyBoardMap.TableSize := 600;
    LoadKbdMap(UPKee, UPFee);
    lpHookRec^.IsUnicode := True;
  end;
  if lpHookRec^.NextKeboardName = 'Vanavil Typewriter' then
  begin
    lpHookRec^.SCIMLen := 1;
    KeyBoardMap.TableSize := 350;
    LoadKbdMap(VTKee, VTFee);
  end;
  if lpHookRec^.NextKeboardName = 'Anu Typewriter' then
  begin
    lpHookRec^.SCIMLen := 1;
    KeyBoardMap.TableSize := 350;
    LoadKbdMap(STKee, STFee);
  end;
  if lpHookRec^.NextKeboardName = 'Anu Inscript' then
  begin
    lpHookRec^.SCIMLen := 3;
    KeyBoardMap.TableSize := 600;
    LoadKbdMap(SIKee, SIFee);
  end;
}
{ Cleanup Key Cache }
//  Bufstr := '     ';
  for Count :=  1 to BufLen do
    Bufstr[Count] := ' ';
{ Cleanup Codepoint Cache }
  for Count :=  1 to UndoLen do
    SCIMUndo[Count] := 0;
  prev_ucchar_length := 0;
end;

procedure LoadKbdMap(const Kee: array of Ansistring; Fee: array of integer);
var
i, j: integer;
ti: pointer;
rsize: integer;
begin
  if KeyboardMap.Count > 0 then
    exit;
  rsize := lpHookRec^.SCIMLen;
  case rsize of
  1:
  begin
    for i := 0 to Length(Kee)-1 do
    begin
      GetMem(ti, sizeof(TSCIM_1));
      for j := 0 to rsize-1 do
        pSCIM_1(ti)^[j]  := Fee[i*rsize];
      KeyboardMap.Insert(kee[i], ti);
    end;
  end;
  2:
  begin
    for i := 0 to Length(Kee)-1 do
    begin
      GetMem(ti, sizeof(TSCIM_2));
      for j := 0 to rsize-1 do
        pSCIM_2(ti)^[j]  := Fee[(i*rsize)+j];
      KeyboardMap.Insert(kee[i], ti);
    end;
  end;
  3:
  begin
    for i := 0 to Length(Kee)-1 do
    begin
      GetMem(ti, sizeof(TSCIM_3));
      for j := 0 to rsize-1 do
        pSCIM_3(ti)^[j]  := Fee[(i*rsize)+j];
  try
      KeyboardMap.Insert(kee[i], ti);
  except
    ErrorDlg(Kee[i] + ' ' + InttoStr(i));
  end;
    end;
  end;
  4:
  begin
    for i := 0 to Length(Kee)-1 do
    begin
      GetMem(ti, sizeof(TSCIM_4));
      for j := 0 to rsize-1 do
        pSCIM_4(ti)^[j]  := Fee[(i*rsize)+j];
  try
      KeyboardMap.Insert(kee[i], ti);
  except
    ErrorDlg(Kee[i] + ' ' + InttoStr(i));
  end;
    end;
  end;
  end;
end;

function DoKeyboard: boolean;
var
  Count: integer;
  Cancelled: Integer;
//  lastbyte: DWord;
begin
  Result := False;

  if not lpHookRec^.Keyboard_Enabled then
  begin
    Exit;
  end;

{ Filter BS0 which was a show stopper for Phonetic layout }
  if  lpHookRec^.IsUnicode then
  begin
    if lpHookRec^.IsBS_scancode then
    begin
      lpHookRec^.IsBS_scancode := False;
      Cancelled := 0;
      for count := UndoLen downto 1 do
        if  SCIMUndo[Count] > 0 then
        begin
          Cancelled := SCIMUndo[Count];
          SCIMUndo[Count] := 0;
          break;
        end;
      for Count := 1 to Cancelled - 1 do
        Genkey(8, False);
    end;
  end;

  if not BinarySearch(Valid_Keys, lpHookRec^.current_vkCode, 63) then
    Exit;

  if  Cancelled > 1 then
  if  lpHookRec^.current_vkCode = $08 then
    Exit;
{ character_pressed contains the english alphabet pressed, its obtained from the hookdll }
  for Count :=  1 to BufLen -1 do
    Bufstr[Count] := Bufstr[Count+1];
  Bufstr[BufLen] := Char(lpHookRec^.character_pressed);
  for Count :=  1 to UndoLen -1 do
      SCIMUndo[Count] := SCIMUndo[Count+1];
  SCIMUndo[UndoLen] := 0;

  if (lpHookRec^.character_pressed in [$0D, $20]) then
    SCIMUndo[UndoLen] := 1;
  for Count := BufLen downto 1 do
  if ApplySCIM(Count) then
  begin
    if BinarySearch(Mei, lpHookRec^.character_pressed, 40) then
      BufStr[BufLen] := 'k';
    Result := True;
    break;
  end;
end;

function ApplySCIM(const KeyLen: integer): boolean;
var
  kstr: string;
  wstr: pointer;
  Count: Integer;
begin
  kstr := AnsiRightStr(Bufstr, KeyLen);
//  kstr := copy(Bufstr, BufLen-KeyLen+1, Keylen);
//  Showmessage(kstr+' '+inttostr(keylen)+Bufstr);
  if not keyboardmap.Search(kstr, wstr) then
  begin
      Result := False;
      Exit;
  end;

  prev_ucchar_length := -0;
  for Count :=  BufLen - KeyLen + 1 to BufLen - 1  do
  begin
    prev_ucchar_length := prev_ucchar_length + SCIMUndo[UndoLen-BufLen+Count];
    SCIMUndo[UndoLen-BufLen+Count] := 0;
  end;
  Case lpHookRec^.SCIMLen of
  4:
    GenLangCode(pSCIM_4(wstr)^);
  3:
    GenLangCode(pSCIM_3(wstr)^);
  2:
    GenLangCode(pSCIM_2(wstr)^);
  1:
    GenLangCode(pSCIM_1(wstr)^);
  end;
  Result := True;
end;

procedure GenLangCode(const iChars: array of integer);
var
  current_ucchar_length: integer;
  i: integer;
  j: integer;
begin
{ store the length of the characters globally }
  current_ucchar_length := Length(ichars); (*Delete the previous unicode characters if both previous and current characters are present*)
  if (prev_ucchar_length > 0) and (current_ucchar_length > 0)
  then
  begin
    i := 0;
    while i < prev_ucchar_length do
    begin
{ Coreldraw, Wordpad etc do not like unicode backspace }
{      Genkey(8, False); }
      inc(i);
    end;
    SCIMUndo[UndoLen] :=  prev_ucchar_length;
  end;
{ generate the unicode characters if the matching character is found in the keyboard file }
  if current_ucchar_length > 0 then
  begin
    j := 0;
    while j < current_ucchar_length do
    begin
      if ichars[j] > 0 then
      begin
        Genkey(ichars[j], True);
        SCIMUndo[UndoLen] :=  SCIMUndo[UndoLen] + 1;
      end
      else
        break;
      inc(j);
    end;
  end;
end;

procedure GenKey(const vk: integer;  const bUnicode: bool);
var
  kb: TKEYBDINPUT;
  Input: TINPUT;
begin
  {keydown}
//  lpHookRec^.previous_2_character:= lpHookRec^.previous_1_character;
//  lpHookRec^.previous_1_character:= vk; {update previous characters}

{  ZeroMemory(@kb,sizeof(kb));}
{  ZeroMemory(@input,sizeof(input));}

  {keydown}
  if bUnicode then
  begin
    kb.wVk:= 0;
    kb.wScan:= vk; ;
    kb.dwFlags:= $4;
    { KEYEVENTF_UNICODE=4}
  end
  else
  begin
    kb.wVk:= vk;
    kb.wScan:= 0; ;
    kb.dwFlags:= 0;
    {enter unicode here}
  end;
  Input.itype:= INPUT_KEYBOARD;
  Input.ki:= kb;

  SendInput(1, Input,sizeof(Input));

  {keyup}
  if bUnicode then
  begin
    kb.wVk:= 0;
    kb.wScan:= vk ;
    kb.dwFlags:= $4 or KEYEVENTF_KEYUP;
    {KEYEVENTF_UNICODE=4}
  end
  else
  begin
    kb.wVk:= vk;
    kb.wScan:= 0;
    kb.dwFlags:= KEYEVENTF_KEYUP;
  end;
  Input.itype:= INPUT_KEYBOARD;
  Input.ki:= kb;

  SendInput(1,Input,sizeof(Input));
end;


procedure ErrorDlg(Const Msg: string);
begin
  MessageDlg(Msg, mtError, [mbOK], 0);
end;

procedure MapFileMemory(dwAllocSize: DWORD);
begin
  {Create a process wide memory mapped variable}
  hObjHandle := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, dwAllocSize,
    'HookRecMemBlock');
  if (hObjHandle = 0) then
  begin
    MessageBox(0, 'Hook DLL', 'Could not create file Map object', MB_OK);
    exit;
  end;
  {Get a pointer to our process wide memory mapped variable}
  lpHookRec := MapViewOfFile(hObjHandle, FILE_MAP_WRITE, 0, 0, dwAllocSize);
  if (lpHookRec = nil) then
  begin
    CloseHandle(hObjHandle);
    MessageBox(0, 'Hook DLL', 'Could not Map file', MB_OK);
    exit;
  end;
  lpHookRec^.TheHookHandle := 0;
end;

procedure UnMapFileMemory;
begin
  {Delete our process wide memory mapped variable}
  if (lpHookRec <> nil) then
  begin
    UnMapViewOfFile(lpHookRec);
    lpHookRec := nil;
  end;
  if (hObjHandle > 0) then
  begin
    CloseHandle(hObjHandle);
    hObjHandle := 0;
  end;
end;

initialization

finalization
  if ModuleIsLib then
  begin
        {If we are getting unmapped from a process then, remove the pointer to
                                our process wide memory mapped variable}
        UnMapFileMemory;
        if Assigned(KeyboardMap) then
          begin
            KeyboardMap.Empty;
            KeyboardMap.Free;
        end;
  end;

end.



