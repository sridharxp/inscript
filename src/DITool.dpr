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
program DITool;

uses
  FastMM4 in '..\..\..\DL\FastMM4_4992\FastMM4.pas',
  FastMM4Messages in '..\..\..\DL\FastMM4_4992\FastMM4Messages.pas',
  Forms,
  Dawn in 'Dawn.pas' {frmDawn},
  MapUtil in 'MapUtil.pas' {frmMaputil},
  CodePoint in '\D7\DT5\pas\CodePoint.pas' {frmCPCalc},
  utf8cp in '\D7\DT5\pas\utf8cp.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDawn, frmDawn);
  Application.CreateForm(TfrmMaputil, frmMaputil);
  Application.CreateForm(TfrmCPCalc, frmCPCalc);
  Application.Run;
end.
