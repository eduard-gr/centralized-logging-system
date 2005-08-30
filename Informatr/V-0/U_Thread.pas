unit U_Thread;


interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, blcksock, winsock;


type
  TTCPEchoDaemon = class(TThread)
  private
    Sock:TTCPBlockSocket;
  public
    Constructor Create;
    Destructor Destroy; override;
    procedure Execute; override;
  end;
var
  Sock:TTCPBlockSocket;
  CSock: TSocket;
  SendInfo : string;
  
  Function HexToInt(HexStr : string) : Int64;
  Function  MakePKG(Text:string;PkgID:integer;PkgCount:integer):string;

implementation
uses
  Unit1;

Function HexToInt(HexStr : string) : Int64;
var RetVar : Int64;
    i : byte;
begin
  HexStr := UpperCase(HexStr);
  if HexStr[length(HexStr)] = 'H' then
     Delete(HexStr,length(HexStr),1);
  RetVar := 0;
  for i := 1 to length(HexStr) do begin
      RetVar := RetVar shl 4;
      if HexStr[i] in ['0'..'9'] then
         RetVar := RetVar + (byte(HexStr[i]) - 48)
      else
         if HexStr[i] in ['A'..'F'] then
            RetVar := RetVar + (byte(HexStr[i]) - 55)
         else begin
            Retvar := 0;
            break;
         end;
  end;
  Result := RetVar;
end;


Function  MakePKG(Text:string;PkgID:integer;PkgCount:integer):string;
var
  PkgLenght : string[4]; //1 byte
  PkgType   : string[2]; //1 byte
  MsgHex    : string;
  x         : integer;
begin
  MsgHex:= '';
  for x := 1 to Length(Text) do MsgHex := MsgHex + IntToHex(Byte(Char(Text[x])),2);
  PkgLenght := IntToHex(Length(Text),4);
  PkgType   := IntToHex(01,2);
  MakePKG := #254 + PkgLenght + PkgType + IntToHex(PkgID,4) + IntToHex(PkgCount,4) + MsgHex;
end;



Constructor TTCPEchoDaemon.Create;
begin
  sock:=TTCPBlockSocket.create;
  FreeOnTerminate:=true;
  //Morda

  Form1.ImageList1.GetBitmap(0,Form1.Image1.Picture.Bitmap);
  Form1.Image1.Picture.Bitmap.Modified := True;
  
  inherited create(false);
end;

Destructor TTCPEchoDaemon.Destroy;
begin
  Form1.ImageList1.GetBitmap(1,Form1.Image1.Picture.Bitmap);
  Form1.Image1.Picture.Bitmap.Modified := True;
  Sock.free;
end;

procedure TTCPEchoDaemon.Execute;
var
  Buf         : array[1..2048] of char;
  BufP        : Pointer;
  x,i         : integer;
  PkgLeng     : integer;
  PkgType     : integer;
  PkgId       : integer;
  PkgCount    : integer;
  TempRecev   : string;
  MsgString   : String;
  SendStr     : string;
  PingPong    : string;
  BufCount    : integer;
begin

  sock.Connect('192.168.200.18','1020');
  Form1.Memo1.Lines.Add('PkgType[Connected]');

  while not terminated do
  begin
    if sock.lastError <> 0 then Break;
 
    if sock.CanRead(100) then
    begin
      BufP := @Buf;
      sock.RecvBuffer(BufP,1);
      if sock.lastError <> 0 then
      begin
        Form1.Memo1.Lines.Add('lastError[' + IntToStr(sock.lastError) + ']');
        Break;
      end;

      if Buf[1] = #254 then
      begin
        TempRecev := '';
        BufP := @Buf;
        sock.RecvBuffer(BufP,4);
        for x := 1 to 4 do
        begin
          TempRecev := TempRecev + Buf[x];
        end;
        PkgLeng := HexToInt(TempRecev) * 2;
        Form1.Memo1.Lines.Add('PkgLeng[' + IntToStr(PkgLeng) + ']');

        TempRecev := '';
        BufP := @Buf;
        sock.RecvBuffer(BufP,2);
        for x := 1 to 2 do
        begin
          TempRecev := TempRecev + Buf[x];
        end;
        PkgType := HexToInt(TempRecev);
        Form1.Memo1.Lines.Add('PkgType[' + IntToStr(PkgType) + ']');


        TempRecev := '';
        BufP := @Buf;
        sock.RecvBuffer(BufP,4);
        for x := 1 to 4 do
        begin
          TempRecev := TempRecev + Buf[x];
        end;
        PkgId := HexToInt(TempRecev);
        Form1.Memo1.Lines.Add('PkgId[' + IntToStr(PkgId) + ']');


        TempRecev := '';
        BufP := @Buf;
        sock.RecvBuffer(BufP,4);
        for x := 1 to 4 do
        begin
          TempRecev := TempRecev + Buf[x];
        end;
        PkgCount := HexToInt(TempRecev);
        Form1.Memo1.Lines.Add('PkgCount[' + IntToStr(PkgCount) + ']');

        TempRecev := '';
        BufP := @Buf;
        sock.RecvBuffer(BufP,PkgLeng);
        for x := 1 to PkgLeng do
        begin
          TempRecev := TempRecev + Buf[x];
        end;

        MsgString := '';
        i:=1;
        while i <= PkgLeng do
        begin
          MsgString := MsgString + char(byte(HexToInt(Copy(TempRecev,i,2)+'H')));
          inc(i,2);
        end;

        if MsgString = 'ping' then
          SendStr := 'pong';
        Form1.Memo1.Lines.Add('PkgText[' + MsgString + ']');

      end;
    end;

    if SendStr <> '' then
    begin
      PingPong := MakePKG(SendStr,0,0);
      FillChar(buf,1024,#00);
      BufCount := 0;
      for x := 1 to Length(PingPong) do
      begin
        Buf[x] := PingPong[x];
        BufCount := x;
      end;
      Form1.Memo1.Lines.Add('Pong');
      BufP := @Buf;
      if sock.CanWrite(1000) then
      begin
        sock.SendBuffer(BufP,BufCount);
        if sock.LastError <> 0 then
        begin
          Form1.Memo1.Lines.Add('lastError[' + IntToStr(sock.lastError) + ']');
          Break;
        end;
      end;
      SendStr := '';
    end;
  end;//while not Terminated
end;

end.