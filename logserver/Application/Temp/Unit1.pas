unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,u_log_informer;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Button2: TButton;
    Edit1: TEdit;
    Button1: TButton;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
    AddToBuf(Edit1.text,2);
  except
   On E : Exception do
   begin
     Memo1.Lines.Add('Error['+E.Message+']');
   end;
 end;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  HLRDaemon.Create;
  Memo1.lines.add('Started');
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  Form1.Caption := 'EditLength['+IntTOStr(Length(Edit1.Text))+']'
end;

end.
