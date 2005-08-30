unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,U_Thread,blcksock, winsock, ExtCtrls, ImgList, ComCtrls;

  {

  }

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    ImageList1: TImageList;
    Image1: TImage;
    PageControl1: TPageControl;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NewTabSheet : TTabSheet;
  

    Function CreateWindows(Caption:string) : integer;
    Procedure InsertText(Text:string;TabID:integer);
  end;

var
  Form1       : TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  TTCPEchoDaemon.Create;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ImageList1.GetBitmap(1,Image1.Picture.Bitmap);
end;

Function TForm1.CreateWindows(Caption:string) : integer;
var
  TIndex : integer;
begin
  TIndex                        := Form1.PageControl1.PageCount;
  NewTabSheet                   := TTabSheet.Create (Form1.PageControl1);
  NewTabSheet.Visible           := True;
  NewTabSheet.Caption           := Caption;
  NewTabSheet.PageControl       := PageControl1;
  Form1.PageControl1.ActivePage := NewTabSheet;
  Inc(TIndex);
  CreateWindows                 := TIndex;
end;

Procedure TForm1.InsertText(Text:string;TabID:integer);
begin
//

end;


end.
