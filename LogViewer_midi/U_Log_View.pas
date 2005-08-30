unit U_Log_View;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ImgList, ToolWin, StdCtrls;

type
  TLogView = class(TForm)
    ListView1: TListView;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  LogSchem = Record
  Created        : boolean;
  Windows        : TLogView;
  Connected      : boolean;
  Disconect      : boolean;
  RemoutIP       : string;
  RemoutPort     : string;
  RemoutServName : string;
  IdInList       : integer;
end;

var
  LogWindow          : array of LogSchem;
  CreatedLogWinCount : integer;

implementation

{$R *.dfm}

end.
