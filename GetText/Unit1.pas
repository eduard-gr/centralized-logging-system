unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function GetText(TextSurce:string;TextPost:string;StartChar:char;StopChar:char):string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
//Date[10.10.2005 00:03:02] LogID[0] Text{[MSCThread] Create Thread}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit2.text:= GetText(Edit1.text,Edit3.text,Edit4.text[1],Edit5.text[1]);
end;

function TForm1.GetText(TextSurce:string;TextPost:string;StartChar:char;StopChar:char):string;
var
  X      : integer;
  First  : boolean;
  Res    : string;
begin
  Res := '';
  First := False;

  for X := Pos(TextPost,TextSurce) to Length(TextSurce) do
  begin

    if (TextSurce[x] = StartChar) and (First = False) then
      First := True
    else if (TextSurce[x] = StopChar) and (First = True) then
      First := False;

    if (First = True) and (TextSurce[x] <> StartChar) then
      Res := Res + TextSurce[x];

    if (First = False) and (TextSurce[x] = StopChar) then
       break;
  end;

   GetText := res;
end;


end.
