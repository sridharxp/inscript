object frmDawn: TfrmDawn
  Left = 192
  Top = 132
  Width = 300
  Height = 177
  Caption = 'Dawn Tamil  Devanagari'
  Color = clBtnFace
  Constraints.MaxHeight = 200
  Constraints.MaxWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 19
  object lHelp: TLabel
    Left = 29
    Top = 96
    Width = 234
    Height = 14
    Caption = 'Press F1 to Activate; Alt+F1 to DeActivate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 50
    Width = 280
    Height = 31
    TabOrder = 0
    object cmbKbd: TComboBox
      Left = 144
      Top = 5
      Width = 120
      Height = 27
      ItemHeight = 19
      ItemIndex = 0
      TabOrder = 0
      Text = 'Inscript'
      Items.Strings = (
        'Inscript')
    end
    object cmbFont: TComboBox
      Left = 30
      Top = 5
      Width = 100
      Height = 27
      ItemHeight = 19
      TabOrder = 1
      Items.Strings = (
        'Tamil'
        'Devanagari')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 280
    Height = 31
    TabOrder = 1
    object Info: TLabel
      Left = 50
      Top = 9
      Width = 104
      Height = 19
      Caption = 'No Keyboard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object HotKeyMgr: THotKeyManager
    OnHotKeyPressed = HotKeyMgrHotKeyPressed
    Left = 152
    Top = 65512
  end
  object MainMenu1: TMainMenu
    Left = 224
    Top = 40
    object Help1: TMenuItem
      Caption = 'Help'
      object HotKeys1: TMenuItem
        Caption = 'HotKeys'
        OnClick = HotKeys1Click
      end
      object Author1: TMenuItem
        Caption = 'Developer'
        OnClick = Author1Click
      end
    end
    object ool1: TMenuItem
      Caption = 'Tool'
      object Debug1: TMenuItem
        Caption = 'Map'
        OnClick = Debug1Click
      end
      object CodePoint1: TMenuItem
        Caption = 'CodePoint'
        OnClick = CodePoint1Click
      end
    end
  end
end
