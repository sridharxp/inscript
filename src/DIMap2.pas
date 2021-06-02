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
Devanagari Unicode Standard Font
Inscript Layout
}
unit DIMap2;

interface

uses
  SysUtils;

const
// Devanagari Inscript
UDkee: array [0..94] of ansistring =(
{ Vowels}
'd',  'e',  'f',  'r',  'g',  't',
'+',  '!',  'z',  's',  'w',  '|',  '`',
'a',  'q',  'X',  'x',  '_',
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
UDFee: array [0..379] of integer =(
{ Vowels}
  $905,0,0,0,  $906,0,0,0,  $907,0,0,0,  $908,0,0,0,  $909,0,0,0,  $90A,0,0,0,
  $90B,0,0,0,
// CANDRA E
  $90D,0,0,0,  $90E,0,0,0,  $90F,0,0,0,  $910,0,0,0,
//  CANDRA O
  $911,0,0,0,
  $912,0,0,0,    $913,0,0,0,    $914,0,0,0,
  $901,0,0,0,    $902,0,0,0,    $903,0,0,0,
{ Consonants}
  $915,0,0,0,    $916,0,0,0,    $917,0,0,0,    $918,0,0,0,    $919,0,0,0,
  $91A,0,0,0,    $91B,0,0,0,    $91C,0,0,0,    $91D,0,0,0,    $91E,0,0,0,
  $91F,0,0,0,    $920,0,0,0,    $921,0,0,0,    $922,0,0,0,    $923,0,0,0,
  $924,0,0,0,    $925,0,0,0,    $926,0,0,0,    $927,0,0,0,    $928,0,0,0,
  $92A,0,0,0,    $92B,0,0,0,    $92C,0,0,0,    $92D,0,0,0,    $92E,0,0,0,
  $92F,0,0,0,    $930,0,0,0,    $932,0,0,0,    $935,0,0,0,
  $934,0,0,0,    $933,0,0,0,    $931,0,0,0,    $929,0,0,0,
  $93C,0,0,0,    $945,0,0,0,
{ Deva Nagari}
  $936,0,0,0,    $937,0,0,0,    $938,0,0,0,    $939,0,0,0,
  $94D,$930,0,0,    $91C,$94D,$91E,0,    $930,$94D,0,0,
  $924,$94D,$930,0,    $915,$94D,$937,0,    $936,$94D,$930,0,
  $964,0,0,0,
{ Numerals}
  48,0,0,0,      49,0,0,0,      50,0,0,0,      51,0,0,0,      52,0,0,0,      53,0,0,0,      54,0,0,0,      55,0,0,0,      56,0,0,0,      57,0,0,0,
{ Duplicates}
{ Symbols}
  $2C,0,0,0,  $2E,0,0,0,
  $3F,0,0,0,
  $7E,0,0,0,  $28,0,0,0,      $29,0,0,0,
  45,0,0,0,


  $94D,0,0,0,
  $93E,0,0,0,
  $93F,0,0,0,
  $940,0,0,0,
  $941,0,0,0,
  $942,0,0,0,
//  VOCALIC R
  $943,0,0,0,
//SHORT E
  $946,0,0,0,
  $947,0,0,0,
  $948,0,0,0,
//  CANDRA O
  $949,0,0,0,
  $94A,0,0,0,
  $94B,0,0,0,
  $94C,0,0,0
);



implementation

end.
