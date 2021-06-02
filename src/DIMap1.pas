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
Tamil Unicode Standard Font
Inscript Layout
}
unit DIMap1;

interface

uses
  SysUtils;

const
// TAU Inscript
UIkee: array [0..94] of ansistring =(
{ Vowels}
'd',  'e',  'f',  'r',  'g',  't',
'+',  '!',  'z', 's',  'w',  '|',  '`',
'a',  'q', 'X',  'x',  '_',
{ Consonants}
'k', 'K', 'i', 'I', 'U',
';', ':', 'p', 'P', '}',
'''','"', '[', '{', 'C',
'l', 'L', 'o', 'O', 'v',
'h', 'H', 'y', 'Y', 'c',
'/', 'j', 'n', 'b',
'B', 'N', 'J', 'V',
']', '@',
{ Deva Nagari}
'M', '<', 'm', 'u',
'#', '%', '$', '^', '&', '*',
 '>',
{ Numerals}
'0',      '1',      '2',      '3',     '4',       '5',      '6',      '7',      '8',      '9',
{ Duplicates}
{ Symbols}
',',     '.',       '?',
'~',
'(',      ')',      '-',

'kd',
'ke',
'kf',
'kr',
// U and UU
'kg',
'kt',
'k=',
//SHORT E
'kz',
'ks',
'kw',

'k\',
'k`',
'ka',
'kq'
);

//UTFee: array [0..159] of integer =(
UIFee: array [0..379] of integer =(
{ Vowels}
  $B85,0,0,0,    $B86,0,0,0,    $B87,0,0,0,    $B88,0,0,0,    $B89,0,0,0,    $B8A,0,0,0,
  $B8B,0,0,0,
// CANDRA E
  $B8D,0,0,0,  $B8E,0,0,0,  $B8F,0,0,0,  $B90,0,0,0,
//  CANDRA O
  $B91,0,0,0,
  $B92,0,0,0,    $B93,0,0,0,    $0B94,0,0,0,
  $B81,0,0,0,    $B82,0,0,0,    $B83,0,0,0,
{ Consonants}
  $B95,0,0,0,    $B95,0,0,0,    $B95,0,0,0,    $B95,0,0,0,    $B99,0,0,0,
  $B9A,0,0,0,    $B9A,0,0,0,    $B9C,0,0,0,    $B9C,0,0,0,    $B9E,0,0,0,
  $B9F,0,0,0,    $B9F,0,0,0,    $B9F,0,0,0,    $B9F,0,0,0,    $BA3,0,0,0,
  $BA4,0,0,0,    $BA4,0,0,0,    $BA4,0,0,0,    $BA4,0,0,0,    $BA8,0,0,0,
  $BAA,0,0,0,    $BAA,0,0,0,    $BAA,0,0,0,    $BAA,0,0,0,    $BAE,0,0,0,

  $BAF,0,0,0,    $BB0,0,0,0,    $BB2,0,0,0,    $BB5,0,0,0,    $BB4,0,0,0,    $BB3,0,0,0,    $BB1,0,0,0,    $BA9,0,0,0,
  $BBC,0,0,0,    $BC5,0,0,0,
{ Deva Nagari}
  $BB6,0,0,0,    $BB7,0,0,0,    $BB8,0,0,0,    $BB9,0,0,0,
  $BCD,$BB0,0,0,    $B9C,$BCD,$B9E,0,    $BB0,$BCD,0,0,
  $BA4,$BCD,$BB0,0,    $B95,$BCD,$BB7,0,    $BB6,$BCD,$BB0,0,
  $BB8,$BCD,$BB0,$BC0,
{ Numerals}
  48,0,0,0,      49,0,0,0,      50,0,0,0,      51,0,0,0,      52,0,0,0,      53,0,0,0,      54,0,0,0,      55,0,0,0,      56,0,0,0,      57,0,0,0,
{ Duplicates}
{ Symbols}
  $2C,0,0,0,  $2E,0,0,0,
  $3F,0,0,0,
  $7E,0,0,0,  $28,0,0,0,      $29,0,0,0,
  45,0,0,0,

  $BCD,0,0,0,
  $BBE,0,0,0,
  $BBF,0,0,0,
  $BC0,0,0,0,
  $BC1,0,0,0,
  $BC2,0,0,0,
//  VOCALIC R
  $BCD,$BB0,$BC1,0,
//SHORT E
  $BC6,0,0,0,
  $BC7,0,0,0,
  $BC8,0,0,0,
//  CANDRA O
  $BC9,0,0,0,
  $BCA,0,0,0,
  $BCB,0,0,0,
  $BCC,0,0,0
);



implementation

end.
