object ChildForm: TChildForm
  Left = 394
  Top = 107
  Width = 728
  Height = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 720
    Height = 472
    Align = alClient
    Columns = <>
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object ListView2: TListView
    Left = 0
    Top = 472
    Width = 720
    Height = 32
    Align = alBottom
    Columns = <
      item
        AutoSize = True
      end>
    RowSelect = True
    TabOrder = 1
  end
  object PopupMenu1: TPopupMenu
    Left = 176
    Top = 152
    object Clear1: TMenuItem
      Caption = 'Save To File'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Clear2: TMenuItem
      Caption = 'Clear'
      OnClick = Clear2Click
    end
  end
  object ImageList1: TImageList
    Left = 280
    Top = 288
  end
  object ImageList2: TImageList
    Left = 256
    Top = 472
  end
end
