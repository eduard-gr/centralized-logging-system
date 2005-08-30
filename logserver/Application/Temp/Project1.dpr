program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  u_log_informer in 'u_log_informer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
