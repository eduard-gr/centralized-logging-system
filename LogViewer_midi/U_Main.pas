unit U_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, ToolWin, ImgList, U_Log_View;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ListView1: TListView;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    ToolButton9: TToolButton;
    Splitter1: TSplitter;
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  if not LogWindow[1].Created then
  begin
    LogWindow[1].Windows := TLogView.Create(Application);
    LogWindow[1].Connected := False;
    LogWindow[1].Disconect := False;
    LogWindow[1].RemoutIP  := '';
    LogWindow[1].RemoutPort := '';
    LogWindow[1].RemoutServName := '';
    LogWindow[1].IdInList := 0;
  end;

end;

end.
