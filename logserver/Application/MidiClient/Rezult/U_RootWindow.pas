unit U_RootWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Unit1, ToolWin, ComCtrls, StdActns, ActnList,
  Menus, ImgList, Buttons;

type
  TForm1 = class(TForm)
    Panel2: TPanel;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    FileNew1: TAction;
    FileOpen1: TAction;
    FileClose1: TWindowClose;
    FileSave1: TAction;
    FileSaveAs1: TAction;
    FileExit1: TAction;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrangeAll1: TWindowArrange;
    HelpAbout1: TAction;
    ToolBar2: TToolBar;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ActionList2: TActionList;
    Action1: TAction;
    Action2: TAction;
    WindowClose1: TWindowClose;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    EditCut2: TEditCut;
    EditCopy2: TEditCopy;
    EditPaste2: TEditPaste;
    WindowCascade2: TWindowCascade;
    WindowTileHorizontal2: TWindowTileHorizontal;
    WindowTileVertical2: TWindowTileVertical;
    WindowMinimizeAll2: TWindowMinimizeAll;
    WindowArrange1: TWindowArrange;
    Action6: TAction;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileCloseItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    Window1: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowTileItem2: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    Help1: TMenuItem;
    HelpAboutItem: TMenuItem;
    OpenDialog: TOpenDialog;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  Child: TChildForm;
begin
   if Edit2.Text = '' then Exit;
   if Edit3.Text = '' then Exit;
   Child := TChildForm.Create(Application);
   Child.SetParams(Edit2.Text,Edit3.Text);
   Edit2.Text := '';
   Edit3.Text := '';
end;

end.
