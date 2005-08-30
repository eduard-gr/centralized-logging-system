object Form1: TForm1
  Left = 320
  Top = 183
  Width = 870
  Height = 640
  Caption = 'Remout Log View v 1.0.1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 619
    Top = 49
    Width = 5
    Height = 564
    Align = alRight
    Color = clGradientActiveCaption
    ParentColor = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 862
    Height = 49
    ButtonHeight = 39
    ButtonWidth = 39
    Caption = 'ToolBar1'
    Color = clActiveBorder
    Images = ImageList1
    ParentColor = False
    TabOrder = 0
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Width = 17
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 17
      Top = 2
      Hint = 'Add New Connection'
      Caption = 'ToolButton1'
      ImageIndex = 0
      OnClick = ToolButton1Click
    end
    object ToolButton3: TToolButton
      Left = 56
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 64
      Top = 2
      Caption = 'ToolButton4'
      ImageIndex = 1
    end
    object ToolButton5: TToolButton
      Left = 103
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 111
      Top = 2
      Caption = 'ToolButton6'
      ImageIndex = 2
    end
    object ToolButton7: TToolButton
      Left = 150
      Top = 2
      Width = 35
      Caption = 'ToolButton7'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 185
      Top = 2
      Caption = 'ToolButton8'
      DropdownMenu = PopupMenu2
      ImageIndex = 3
      Style = tbsDropDown
    end
    object ToolButton9: TToolButton
      Left = 237
      Top = 2
      Width = 12
      Caption = 'ToolButton9'
      ImageIndex = 4
      Style = tbsSeparator
    end
  end
  object ListView1: TListView
    Left = 624
    Top = 49
    Width = 238
    Height = 564
    Align = alRight
    Color = clMoneyGreen
    Columns = <
      item
        Caption = 'ServiceName'
        Width = 100
      end
      item
        Caption = 'Service IP'
        Width = 100
      end
      item
        Caption = 'Service Port'
        Width = 70
      end
      item
        Caption = 'WinID'
      end>
    TabOrder = 1
    ViewStyle = vsReport
  end
  object MainMenu1: TMainMenu
    Left = 448
    Top = 16
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 352
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 736
    Top = 200
  end
  object PopupMenu2: TPopupMenu
    Left = 288
    Top = 8
  end
end
