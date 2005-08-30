object Form1: TForm1
  Left = 394
  Top = 107
  Width = 870
  Height = 640
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 145
    Width = 862
    Height = 468
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnChange = PageControl1Change
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 145
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 249
      Height = 25
      Caption = 'Create'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 40
      Width = 249
      Height = 25
      Caption = 'Insert'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 8
      Top = 68
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 8
      Top = 92
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 8
      Top = 116
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 224
      Top = 68
      Width = 33
      Height = 21
      TabOrder = 5
      Text = 'Edit4'
    end
    object Button3: TButton
      Left = 264
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 6
      OnClick = Button3Click
    end
    object Memo1: TMemo
      Left = 408
      Top = 16
      Width = 185
      Height = 89
      Lines.Strings = (
        'Memo1')
      TabOrder = 7
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 288
    object Close1: TMenuItem
      Caption = 'Close'
      OnClick = Close1Click
    end
  end
  object SQLConnection1: TSQLConnection
    Left = 248
    Top = 208
  end
end
