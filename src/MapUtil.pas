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
Debug Tool
}
unit MapUtil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  StrUtils, Grids, Menus;

type
  TfrmMaputil = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt13: TEdit;
    edt12: TEdit;
    edt11: TEdit;
    edtSearch: TEdit;
    Button1: TButton;
    ckbHex: TCheckBox;
    edt21: TEdit;
    edt22: TEdit;
    edt23: TEdit;
    edt31: TEdit;
    edt32: TEdit;
    edt33: TEdit;
    edt14: TEdit;
    edt24: TEdit;
    edt34: TEdit;
    cmbKee: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function srh(i: integer): string;
  end;

var
  frmMaputil: TfrmMaputil;

implementation

uses
//    DTMap1, DTMap2, DTMap3, DTMap4, DTMap5, DTMap7, DTMap8, DTMap9, DTMap10;
    DIMap1, DIMap2;
{$R *.dfm}

procedure TfrmMaputil.Button1Click(Sender: TObject);
var
  i: integer;
  k: array of string;
  f: array of integer;
  asize: integer;
  sKee: string;
begin
  if cmbKee.ItemIndex <> -1 then
  begin
  cmbKee.Text := cmbKee.Items[cmbKee.ItemIndex];
  skee := cmbKee.Text;;
  end
  else
  Exit;

  Edt11.Text := '';
  Edt12.Text := '';
  Edt13.Text := '';
  Edt21.Text := '';
  Edt22.Text := '';
  Edt23.Text := '';
  Edt31.Text := '';
  Edt32.Text := '';
  Edt33.Text := '';

{
  if skee = 'BTKee' then
  begin
    asize := 1;
    SetLength(K, Length(BTKee));
    CopyMemory(@K[0], @BTKee[0], Length(BTKee) * SizeOf(string));
    SetLength(F, Length(BTFee));
    CopyMemory(@F[0], @BTFee[0], Length(BTFee) * SizeOf(integer));
  end;
  if skee = 'VTKee' then
  begin
    asize := 1;
    SetLength(K, Length(VTKee));
    CopyMemory(@K[0], @VTKee[0], Length(VTKee) * SizeOf(string));
    SetLength(F, Length(VTFee));
    CopyMemory(@F[0], @VTFee[0], Length(VTFee) * SizeOf(integer));
  end;
{
  if skee = 'ATKee' then
  begin
    asize := 1;
    SetLength(K, Length(ATKee));
    CopyMemory(@K[0], @ATKee[0], Length(ATKee) * SizeOf(string));
    SetLength(F, Length(ATFee));
    CopyMemory(@F[0], @ATFee[0], Length(ATFee) * SizeOf(integer));
  end;
  if skee = 'UTKee' then
  begin
    asize := 4;
    SetLength(K, Length(UTKee));
    CopyMemory(@K[0], @UTKee[0], Length(UTKee) * SizeOf(string));
    SetLength(F, Length(UTFee));
    CopyMemory(@F[0], @UTFee[0], Length(UTFee) * SizeOf(integer));
  end;
  if skee = 'STKee' then
  begin
    asize := 1;
    SetLength(K, Length(STKee));
    CopyMemory(@K[0], @STKee[0], Length(STKee) * SizeOf(string));
    SetLength(F, Length(STFee));
    CopyMemory(@F[0], @STFee[0], Length(STFee) * SizeOf(integer));
  end;
  if skee = 'AIKee' then
  begin
    asize := 3;
    SetLength(K, Length(AIKee));
    CopyMemory(@K[0], @AIKee[0], Length(AIKee) * SizeOf(string));
    SetLength(F, Length(AIFee));
    CopyMemory(@F[0], @AIFee[0], Length(AIFee) * SizeOf(integer));
  end;
  if skee = 'SIKee' then
  begin
    asize := 3;
    SetLength(K, Length(SIKee));
    CopyMemory(@K[0], @SIKee[0], Length(SIKee) * SizeOf(string));
    SetLength(F, Length(SIFee));
    CopyMemory(@F[0], @SIFee[0], Length(SIFee) * SizeOf(integer));
  end;
  if skee = 'BIKee' then
  begin
    asize := 3;
    SetLength(K, Length(BIKee));
    CopyMemory(@K[0], @BIKee[0], Length(BIKee) * SizeOf(string));
    SetLength(F, Length(BIFee));
    CopyMemory(@F[0], @BIFee[0], Length(BIFee) * SizeOf(integer));
  end;
}
  if skee = 'UIKee' then
  begin
    asize := 4;
    SetLength(K, Length(UIKee));
    CopyMemory(@K[0], @UIKee[0], Length(UIKee) * SizeOf(string));
    SetLength(F, Length(UIFee));
    CopyMemory(@F[0], @UIFee[0], Length(UIFee) * SizeOf(integer));
  end;
  if skee = 'UDKee' then
  begin
    asize := 4;
    SetLength(K, Length(UDKee));
    CopyMemory(@K[0], @UDKee[0], Length(UDKee) * SizeOf(string));
    SetLength(F, Length(UDFee));
    CopyMemory(@F[0], @UDFee[0], Length(UDFee) * SizeOf(integer));
  end;
  for i:= 0 to high(k) do
  if k[i] = EdtSearch.Text then
  begin
    if asize = 1  then
    begin
      Edt11.Text := srh(F[i*asize-1]);
      Edt21.Text := srh(F[i*asize]);
      Edt31.Text := srh(F[i*asize+1]);
    end;
    if asize = 2  then
    begin
      Edt21.Text := srh(F[i*asize]);
      Edt22.Text := srh(F[i*asize+1]);
      if i <> 0 then
      begin
        Edt11.Text := srh(F[(i-1)*asize]);
        Edt12.Text := srh(F[(i-1)*asize+1]);
      end;
      if i <> High(k) then
      begin
        Edt31.Text := srh(F[(i+1)*asize]);
        Edt32.Text := srh(F[(i+1)*asize+1]);
      end;
    end;
    if asize = 3  then
    begin
      Edt21.Text := srh(F[i*asize]);
      Edt22.Text := srh(F[i*asize+1]);
      Edt23.Text := srh(F[i*asize+2]);
      if i <> 0 then
      begin
        Edt11.Text := srh(F[(i-1)*asize]);
        Edt12.Text := srh(F[(i-1)*asize+1]);
        Edt13.Text := srh(F[(i-1)*asize+2]);
      end;
      if i <> High(k) then
      begin
        Edt31.Text := srh(F[(i+1)*asize]);
        Edt32.Text := srh(F[(i+1)*asize+1]);
        Edt33.Text := srh(F[(i+1)*asize+2]);
      end;
    end;
    if asize = 4 then
    begin
      Edt21.Text := srh(F[i*asize]);
      Edt22.Text := srh(F[i*asize+1]);
      Edt23.Text := srh(F[i*asize+2]);
      Edt24.Text := srh(F[i*asize+3]);
      if i <> 0 then
      begin
        Edt11.Text := srh(F[(i-1)*asize]);
        Edt12.Text := srh(F[(i-1)*asize+1]);
        Edt13.Text := srh(F[(i-1)*asize+2]);
        Edt14.Text := srh(F[(i-1)*asize+3]);
      end;
      if i <> High(k) then
      begin
        Edt31.Text := srh(F[(i+1)*asize]);
        Edt32.Text := srh(F[(i+1)*asize+1]);
        Edt33.Text := srh(F[(i+1)*asize+2]);
        Edt34.Text := srh(F[(i+1)*asize+3]);
      end;
    end;
  end;
  exit;
end;

function TfrmMaputil.srh(i: integer): string;
begin
  if not ckbHex.Checked then
    Result := IntToStr(i)
 else
    Result := IntToHex(i,4);
 while LeftStr(Result, 1) = '0' do
   Result := copy(Result, 2, Length(Result));
end;

end.
