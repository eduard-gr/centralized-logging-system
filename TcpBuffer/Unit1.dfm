object Form1: TForm1
  Left = 431
  Top = 129
  Width = 540
  Height = 366
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 79
    Width = 532
    Height = 260
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Str To Char'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 16
    Width = 497
    Height = 21
    TabOrder = 2
    Text = 'test'
  end
  object Button2: TButton
    Left = 120
    Top = 48
    Width = 105
    Height = 25
    Caption = 'Char ToStr'
    TabOrder = 3
  end
end
