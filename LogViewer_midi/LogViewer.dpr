program LogViewer;

uses
  Forms,Dialogs,
  U_Main in 'U_Main.pas' {Form1},
  U_Log_View in 'U_Log_View.pas' {LogView};

{$R *.res}
//var
  const WinCount = 200;
begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  SetLength(LogWindow,WinCount);
  Application.Run;
end.
