program Project1;

uses
  Forms,
  U_RootWindow in 'U_RootWindow.pas' {Form1},
  Unit1 in 'Unit1.pas' {ChildForm},
  U_Thread in 'U_Thread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TChildForm, ChildForm);
  Application.Run;
end.
