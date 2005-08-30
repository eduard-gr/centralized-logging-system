program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  U_NewWindow in 'U_NewWindow.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
