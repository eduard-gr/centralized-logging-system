unit U_Root;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, U_Thread, ImgList, Menus;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    CloseWindows1: TMenuItem;
    ImageList2: TImageList;
    ListView2: TListView;
    Panel2: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    Edit3: TEdit;
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

Type
  TabControl = Record
  ListView    : TListView;
  ThTerminate : boolean;
  LogId       : string;
  InfoIcon    : string;
  InfoWav     : string;
  Activ       : boolean;
end;



var
  Form1           : TForm1;
  TableList       : array of TabControl;
  TableListCount  : integer;
  NewTabSheet     : TTabSheet;


implementation

{$R *.dfm}



procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  TTCPEchoDaemon.Create(Edit1.text,Edit2.Text,1);
end;



procedure TForm1.Button1Click(Sender: TObject);
begin
  SendStr := Edit3.Text;
  Edit3.Text := '';
end;

end.
