program Project1;

uses
  Forms,
  U_Root in 'U_Root.pas' {Form1},
  U_Thread in 'U_Thread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
