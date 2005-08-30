unit U_Thread;


interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, blcksock, winsock;


type
  TTCPEchoDaemon = class(TThread)
  private
    LogServerIp  : string;
    LogServerPor : string;
    Sock:TTCPBlockSocket;
    Function HexToInt(HexStr : string) : Int64;
    Function  MakePKG(Text:string;PkgID:integer;PkgCount:integer):string;
    Function GetText(TextSurce:string;TextPost:string;StartChar:char;StopChar:char):string;    
  public
    Constructor Create(RIP:String;RPort:string);
    Destructor Destroy; override;
    procedure Execute; override;

  end;


implementation
uses
  Unit1;

Function TTCPEchoDaemon.HexToInt(HexStr : string) : Int64;
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


Function  TTCPEchoDaemon.MakePKG(Text:string;PkgID:integer;PkgCount:integer):string;
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

function TTCPEchoDaemon.GetText(TextSurce:string;TextPost:string;StartChar:char;StopChar:char):string;
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


Constructor TTCPEchoDaemon.Create(RIP:String;RPort:string);
begin

  LogServerIp  := RIP;
  LogServerPor := RPort;
  sock:=TTCPBlockSocket.create;
  FreeOnTerminate:= True;
  inherited create(false);
end;

Destructor TTCPEchoDaemon.Destroy;
begin
  with ChildForm.ListView2.Items.Add do
  begin
    Caption := 'Disconnected';
    ImageIndex := 1
  end;

  Sock.free;
end;

procedure TTCPEchoDaemon.Execute;
var
  Buf         : array[1..2048] of char;
  BufP        : Pointer;
  x,i         : integer;
  //Count       : integer;
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

  sock.Connect(LogServerIp,LogServerPor);

  if Sock.LastError <> 0 then
  begin
    with ChildForm.ListView2.Items.Add do
    begin
      Caption := 'LastError[' + IntToStr(sock.lastError) + '] LogServerIp['+LogServerIp+'] LogServerPor['+LogServerPor+']';
//      ImageIndex := 1
    end;
    Break;
  end;

  while not terminated do
  begin
    if sock.lastError <> 0 then Break;

    if sock.CanRead(100) then
    begin
      BufP := @Buf;
      sock.RecvBuffer(BufP,1);
      if sock.lastError <> 0 then
      begin
        with ChildForm.ListView2.Items.Add do
        begin
          Caption := 'LastError[' + IntToStr(sock.lastError) + ']';
//          ImageIndex := 1;
        end;
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

        TempRecev := '';
        BufP := @Buf;
        sock.RecvBuffer(BufP,2);
        for x := 1 to 2 do
        begin
          TempRecev := TempRecev + Buf[x];
        end;
        PkgType := HexToInt(TempRecev);

        TempRecev := '';
        BufP := @Buf;
        sock.RecvBuffer(BufP,4);
        for x := 1 to 4 do
        begin
          TempRecev := TempRecev + Buf[x];
        end;
        PkgId := HexToInt(TempRecev);

        TempRecev := '';
        BufP := @Buf;
        sock.RecvBuffer(BufP,4);
        for x := 1 to 4 do
        begin
          TempRecev := TempRecev + Buf[x];
        end;
        PkgCount := HexToInt(TempRecev);

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
        //vazmozna sleduet pomenjat PkgType ispolzavat k primer 0 kak sluzebnij !!!!
        if MsgString = 'ping' then
          SendStr := 'pong'
        else
        begin
          with ChildForm.ListView1.Items.Add do
          begin
            Caption := GetText(MsgString,'Date','[',']');
            SubItems.Insert(0,GetText(MsgString,'LogID','[',']'));
            SubItems.Insert(1,GetText(MsgString,'Text','"','"'));
          end;
        end;
        //Memo.Lines.Add('PkgText[' + MsgString + ']');
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
      BufP := @Buf;
      if sock.CanWrite(1000) then
      begin
        sock.SendBuffer(BufP,BufCount);
        if sock.LastError <> 0 then
        begin
          with ChildForm.ListView2.Items.Add do
          begin
            Caption := 'LastError[' + IntToStr(sock.lastError) + ']';
//            ImageIndex := 1
          end;
          Break;
        end;
      end;
      SendStr := '';
    end;
  end;//while not Terminated
end;

end.