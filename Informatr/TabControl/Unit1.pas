unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Menus, DBXpress, DB, SqlExpr;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    Button3: TButton;
    Memo1: TMemo;
    SQLConnection1: TSQLConnection;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Type
  TabControl = class(TForm)
  ListView     : TListView;
  NewTabSheet  : TTabSheet;
  Shape        : TShape;
private
  ID           : integer;

end;

var
  Form1: TForm1;
//  TabControl : TForm2;

  TableList       : array[0..100] of TabControl;
  TableListCount  : integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

begin
 TableListCount[0].
  //SetLength(TableList,TableListCount);
 {
  with TableList[TableListCount] do
  begin
    Shape        := TShape.Create(Form1.Panel1);
    Shape.Width  := 49;
    Shape.Height := 33;

    Shape.Left   := 400;
    Shape.Top    := 8;
    }
{
    NewTabSheet := TTabSheet.Create (Form1.PageControl1);
    NewTabSheet.Visible := True;
    NewTabSheet.Caption := 'PageCaption'+IntTOStr(TableListCount);
    NewTabSheet.PageControl := Form1.PageControl1;
    NewTabSheet.ImageIndex := 0;
    Form1.PageControl1.ActivePage := NewTabSheet;

    //NewTabSheet
    ListView  := TListView.Create(nil);
    ListView.Parent := NewTabSheet;
    ListView.Align  := alClient;
    ListView.ViewStyle := vsReport;
    ListView.RowSelect := True;

    ListView.Columns.Add.Caption := 'Date';
    ListView.Columns.Add.Caption := 'LogID';
    ListView.Columns.Add.Caption := 'Text';
    ID := TableListCount-1;
    ListView.Columns.Items[0].Width := 120;
    ListView.Columns.Items[1].Width := 100;
    ListView.Columns.Items[2].AutoSize := True;

  end;
  //TableListCount-1 //Rezult
  inc(TableListCount);}
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  x : integer;
begin
{  for x := 0 to TableListCount -1 do
  begin
    TableList[x].ListView.Clear;
    TableList[x].ListView.Free;
  end;}
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
{   with TableList[1].ListView.Items.Add do
   begin
     Caption := 'Caption';
     SubItems.Insert(0,'Test0');
     SubItems.Insert(1,'Test1');
   end;}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  TableListCount := 0;
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
//  TableList[1].ListView.Free;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin

  Form1.Caption := 'ActivTAb['+IntToStr(PageControl1.TabIndex)+'] ID['+IntToStr(TableList[PageControl1.TabIndex].ID)+']';

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  TabID : integer;
  X     : integer;
  FreID : integer;
begin
  TabID := PageControl1.TabIndex;

  FreID := TableList[TabID].ID;

  Memo1.Lines.Add('['+IntToStr(TabID)+']<->['+IntToStr(FreID)+']<->['+IntToStr(PageControl1.ControlCount)+']');

//  if TabID <> PageControl1.ControlCount + 1 then
//  begin
  TableList[FreID].ListView.Free;
  TableList[FreID].NewTabSheet.Free;

    for x := TabID to PageControl1.ControlCount do
    begin
      TableList[X].ID := TableList[X].ID + 1;
    end;
//  end;
   Memo1.Lines.Add('['+IntToStr(TabID)+']<->['+IntToStr(FreID)+']<->['+IntToStr(PageControl1.ControlCount)+']');

end;

end.
