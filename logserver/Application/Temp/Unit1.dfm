object Form1: TForm1
  Left = 378
  Top = 107
  Width = 875
  Height = 630
  Caption = 'Log Server'
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
    Top = 89
    Width = 867
    Height = 231
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 867
    Height = 89
    Align = alTop
    Caption = 'GroupBox1'
    TabOrder = 1
    object Button2: TButton
      Left = 8
      Top = 16
      Width = 217
      Height = 25
      Caption = 'Launch Server'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 8
      Top = 48
      Width = 569
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
      OnChange = Edit1Change
    end
    object Button1: TButton
      Left = 592
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Send'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Memo2: TMemo
    Left = 0
    Top = 320
    Width = 867
    Height = 283
    Align = alBottom
    ScrollBars = ssBoth
    TabOrder = 2
  end
end
