object LogView: TLogView
  Left = 339
  Top = 108
  Width = 673
  Height = 305
  Caption = 'LogView'
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 483
    Top = 42
    Width = 5
    Height = 236
    Align = alRight
    Color = clGradientActiveCaption
    ParentColor = False
  end
  object ListView1: TListView
    Left = 0
    Top = 42
    Width = 483
    Height = 236
    Align = alClient
    Columns = <>
    Ctl3D = False
    TabOrder = 0
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 665
    Height = 42
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 1
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 8
      Top = 2
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
    object ToolButton3: TToolButton
      Left = 47
      Top = 2
      Width = 34
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 81
      Top = 2
      Caption = 'ToolButton4'
      ImageIndex = 1
    end
    object ToolButton5: TToolButton
      Left = 120
      Top = 2
      Width = 41
      Caption = 'ToolButton5'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 161
      Top = 2
      Caption = 'ToolButton6'
      ImageIndex = 2
    end
  end
  object PageControl1: TPageControl
    Left = 488
    Top = 42
    Width = 177
    Height = 236
    ActivePage = TabSheet1
    Align = alRight
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Search'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 169
        Height = 105
        Align = alTop
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 62
          Height = 13
          Caption = 'Search string'
        end
        object Edit1: TEdit
          Left = 8
          Top = 32
          Width = 153
          Height = 21
          TabOrder = 0
        end
        object Button1: TButton
          Left = 8
          Top = 64
          Width = 75
          Height = 21
          Caption = 'Search'
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
    end
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 168
    Top = 136
  end
end
