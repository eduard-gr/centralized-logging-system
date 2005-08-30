object Form1: TForm1
  Left = 401
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
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 97
    Width = 862
    Height = 516
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 862
    Height = 97
    Align = alTop
    Caption = 'GroupBox1'
    TabOrder = 1
    object Label1: TLabel
      Left = 96
      Top = 40
      Width = 31
      Height = 13
      Caption = 'Fild By'
    end
    object Label2: TLabel
      Left = 144
      Top = 40
      Width = 47
      Height = 13
      Caption = 'Fild Count'
    end
    object Edit1: TEdit
      Left = 16
      Top = 16
      Width = 177
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 208
      Top = 56
      Width = 65
      Height = 25
      Caption = 'MakePKG'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 208
      Top = 16
      Width = 193
      Height = 25
      Caption = 'CreateTStringList'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Fild Edit'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Edit2: TEdit
      Left = 96
      Top = 56
      Width = 33
      Height = 21
      TabOrder = 4
      Text = '@'
    end
    object Edit3: TEdit
      Left = 144
      Top = 56
      Width = 49
      Height = 21
      TabOrder = 5
      Text = '92560'
    end
    object Button4: TButton
      Left = 272
      Top = 56
      Width = 57
      Height = 25
      Caption = 'GetList'
      TabOrder = 6
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 328
      Top = 56
      Width = 73
      Height = 25
      Caption = 'StringToHex'
      TabOrder = 7
      OnClick = Button5Click
    end
  end
end
