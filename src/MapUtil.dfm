object frmMaputil: TfrmMaputil
  Left = 192
  Top = 132
  Width = 326
  Height = 357
  Caption = 'Map Search'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 75
      Top = 72
      Width = 64
      Height = 16
      Caption = 'Search Key'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 69
      Top = 40
      Width = 28
      Height = 16
      Caption = 'Map '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 16
      Top = 106
      Width = 27
      Height = 16
      Caption = 'Prior'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 16
      Top = 214
      Width = 25
      Height = 16
      Caption = 'Next'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edt13: TEdit
      Left = 191
      Top = 106
      Width = 38
      Height = 27
      ReadOnly = True
      TabOrder = 5
    end
    object edt12: TEdit
      Left = 132
      Top = 112
      Width = 39
      Height = 27
      ReadOnly = True
      TabOrder = 4
    end
    object edt11: TEdit
      Left = 75
      Top = 106
      Width = 39
      Height = 27
      ReadOnly = True
      TabOrder = 3
    end
    object edtSearch: TEdit
      Left = 142
      Top = 68
      Width = 38
      Height = 27
      TabOrder = 0
    end
    object Button1: TButton
      Left = 124
      Top = 255
      Width = 58
      Height = 19
      Caption = 'Search'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object ckbHex: TCheckBox
      Left = 193
      Top = 75
      Width = 39
      Height = 13
      Caption = 'Hex'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
    object edt21: TEdit
      Left = 75
      Top = 160
      Width = 39
      Height = 27
      ReadOnly = True
      TabOrder = 7
    end
    object edt22: TEdit
      Left = 132
      Top = 160
      Width = 39
      Height = 27
      ReadOnly = True
      TabOrder = 8
    end
    object edt23: TEdit
      Left = 191
      Top = 160
      Width = 38
      Height = 27
      ReadOnly = True
      TabOrder = 9
    end
    object edt31: TEdit
      Left = 75
      Top = 214
      Width = 39
      Height = 27
      ReadOnly = True
      TabOrder = 11
    end
    object edt32: TEdit
      Left = 132
      Top = 214
      Width = 39
      Height = 27
      ReadOnly = True
      TabOrder = 12
    end
    object edt33: TEdit
      Left = 191
      Top = 214
      Width = 38
      Height = 27
      ReadOnly = True
      TabOrder = 13
    end
    object edt24: TEdit
      Left = 249
      Top = 160
      Width = 39
      Height = 27
      ReadOnly = True
      TabOrder = 10
    end
    object edt14: TEdit
      Left = 249
      Top = 106
      Width = 39
      Height = 27
      ReadOnly = True
      TabOrder = 6
    end
    object edt34: TEdit
      Left = 249
      Top = 214
      Width = 39
      Height = 27
      ReadOnly = True
      TabOrder = 14
    end
    object cmbKee: TComboBox
      Left = 136
      Top = 37
      Width = 100
      Height = 27
      ItemHeight = 19
      TabOrder = 15
      Text = 'Select'
      Items.Strings = (
        'UIKee'
        'UDKee')
    end
  end
end
