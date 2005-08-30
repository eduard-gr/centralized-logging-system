program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  U_Thread in 'U_Thread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TChildForm, ChildForm);
  Application.Run;
end.
