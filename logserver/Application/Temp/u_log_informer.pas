unit u_log_informer;
interface


uses
  SysUtils,Classes, blcksock, winsock,DateUtils;

type
  HLRDaemon = class(TThread)
  private
    Sock:TTCPBlockSocket;
  public
    Constructor Create;
    Destructor Destroy; override;
    procedure Execute; override;
  end;

  TTCPEchoThrd = class(TThread)
  private
    Sock  :TTCPBlockSocket;
    CSock : TSocket;
  public
    Constructor Create (hsock:tSocket);
    Destructor Destroy; override;    
    procedure Execute; override;
  end;

var
  SendList : TStringList;
  ClientConnected : boolean;

  procedure WriteLog(Text:string;Id:integer); //Temp Variable

  Procedure AddToBuf(Text:string;PkgType:byte);
  Function  MakePKG(Text:string;PkgID:word;PkgCount:word;PkgType:byte):string;
  
  Function TimeToInteger(Time:TDateTime):integer;
  Function IncTime(Interval:integer):integer;
  Function HexToInt(HexStr : string) : Int64;
implementation

uses
  Unit1;
  
{ TEchoDaemon }

procedure WriteLog(Text:string;Id:integer);
begin
  If Id = 005 then
    Form1.Memo2.Lines.Add(Text)
  else
    Form1.Memo1.Lines.Add(Text);
end;

Constructor HLRDaemon.Create;
begin
  Form1.Memo1.Lines.Add('Start');
  sock:=TTCPBlockSocket.create;
  FreeOnTerminate:=true;
  inherited create(false);
end;

Destructor HLRDaemon.Destroy;
begin
  Form1.Memo1.Lines.Add('Deamon Stop');
  Sock.free;
end;

procedure HLRDaemon.Execute;
var
  ClientSock : TSocket;
begin
  sock.CreateSocket;
  sock.setLinger(true,10);
  sock.bind('192.168.200.18','1020');
  sock.listen;

  while not Terminated do
  begin
    if sock.CanRead(100) then
    begin
    try
      ClientSock := sock.accept;
      Form1.Memo1.Lines.Add('SocketID['+IntToStr(ClientSock)+']');
      TTCPEchoThrd.Create(ClientSock);
      Break;
     except
       On E : Exception do
       begin
         Form1.Memo1.Lines.Add('error['+E.Message+']');
       end;
     end;
    end;
  end;
end;


Constructor TTCPEchoThrd.Create(Hsock:TSocket);
begin
  ClientConnected := True;
  Csock := Hsock;
  FreeOnTerminate:=true;
  inherited create(false);
end;

Destructor TTCPEchoThrd.Destroy;
begin
  WriteLog('[LogSystem] Deamon Stop',003);
  ClientConnected := False;
  SendList.Free;
  Sock.free;
  HLRDaemon.Create;
end;

procedure TTCPEchoThrd.Execute;
var
  BufPointer : Pointer;
  Lis        : integer;
  Buf        : array[1..2048] of char;
  BufCount   : integer;
  x          : integer;
  //Fro Receve messages
  i          : integer;
  Count      : integer;
  PkgLeng    : integer;
  PkgType    : integer;
  PkgId      : integer;
  PkgCount   : integer;
  TempRecev  : string;
  MsgString  : String;
  //Speshel command send
  PingPong   : string;

  //Data Variablers
  MyTime     : TDateTime;
  CurentTime : integer;
  StopTime   : integer;
  PingTime   : integer;
begin

  sock := TTCPBlockSocket.create;
  SendList := TStringList.Create;
  Sock.socket := CSock;
  sock.GetSins;

  AddToBuf('LogSystem V0,1 ServiceNmae[LogServer]',1);

  StopTime   := IncTime(2);
  PingTime   := IncTime(1);

  while not Terminated do
  begin
    if sock.LastError <> 0 then
    begin
      WriteLog('[LogSystem] Socket Error['+IntToStr(Sock.LastError)+']',000);
      Break;
    end;

    if sock.CanRead(1000) then
    begin
      BufPointer := @Buf;
      sock.RecvBuffer(BufPointer,1);
      
      if sock.LastError <> 0 then
      begin
        WriteLog('[LogSystem] Socket Error['+IntToStr(Sock.LastError)+']',000);
        Break;
      end;

      if Buf[1] = #254 then
      begin
        TempRecev := '';
        BufPointer := @Buf;
        sock.RecvBuffer(BufPointer,4);
        for x := 1 to 4 do
        begin
          TempRecev := TempRecev + Buf[x];
        end;
        PkgLeng := HexToInt(TempRecev) * 2;

        TempRecev := '';
        BufPointer := @Buf;
        sock.RecvBuffer(BufPointer,2);
        for x := 1 to 2 do
        begin
          TempRecev := TempRecev + Buf[x];
        end;
        PkgType := HexToInt(TempRecev);


        TempRecev := '';
        BufPointer := @Buf;
        sock.RecvBuffer(BufPointer,4);
        for x := 1 to 4 do
        begin
          TempRecev := TempRecev + Buf[x];
        end;
        PkgId := HexToInt(TempRecev);


        TempRecev := '';
        BufPointer := @Buf;
        sock.RecvBuffer(BufPointer,4);
        for x := 1 to 4 do
        begin
          TempRecev := TempRecev + Buf[x];
        end;
        PkgCount := HexToInt(TempRecev);

        TempRecev := '';
        BufPointer := @Buf;
        sock.RecvBuffer(BufPointer,PkgLeng);
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
        
        if MsgString = 'pong' then
        begin
          StopTime   := IncTime(2);
        end;
      end;
    end;


    MyTime := now();
    CurentTime := TimeToInteger(MyTime);
    if PingTime <= CurentTime then
    begin
      PingPong := MakePKG('ping',0,0,0);
      FillChar(buf,1024,#00);
      BufCount := 0;
      for x := 1 to Length(PingPong) do
      begin
        Buf[x] := PingPong[x];
        BufCount := x;
      end;

      BufPointer := @Buf;
      if sock.CanWrite(1000) then
      begin
        sock.SendBuffer(BufPointer,BufCount);
        if sock.LastError <> 0 then
        begin
          WriteLog('[LogSystem] Socket Error['+IntToStr(Sock.LastError)+']',000);
          Break;
        end;
      end;
      PingTime   := IncTime(1);
    end
    else if SendList.Count > 0 then
    begin
      for Lis := 0 to SendList.Count -1 do
      begin
        FillChar(buf,1024,#00);
        BufCount := 0;
        for x := 1 to Length(SendList[0]) do
        begin
          Buf[x] := SendList[0][x];
          BufCount := x;
        end;

        BufPointer := @Buf;
        if sock.CanWrite(1000) then
        begin
          sock.SendBuffer(BufPointer,BufCount);
          SendList.Delete(0);
          if sock.LastError <> 0 then
          begin
            WriteLog('[LogSystem] Socket Error['+IntToStr(Sock.LastError)+']',000);
            Break;
          end;
        end;
        Sleep(2);
      end;
    end;

    MyTime := now();
    CurentTime := TimeToInteger(MyTime);
    if StopTime <= CurentTime then
    begin
      WriteLog('[LogSystem] Ping Time out',000);
      Break;
    end;

    if sock.LastError <> 0 then
    begin
      WriteLog('[LogSystem] Socket Error['+IntToStr(Sock.LastError)+']',000);
      Break;
    end;
  end;
end;


Procedure AddToBuf(Text:string;PkgType:byte);
var
  PkgCount : integer;
  Temp     : Integer;
  X        : integer;
  TextTemp : string;
begin
  if Length(Text) > 1000 then
  begin
    PkgCount := Length(Text) div 1000;
    Temp := PkgCount * 1000;
    if Length(Text) <> Temp then Inc(PkgCount);
    for x := 0 to PkgCount -1do
    begin
      TextTemp := MakePKG(Copy(Text,x*1000,1000),x,PkgCount-1,PkgType);
      SendList.Add(TextTemp);
    end;
  end
  else
  begin
    SendList.Add(MakePKG(Text,0,0,PkgType));
  end;
end;

Function  MakePKG(Text:string;PkgID:word;PkgCount:word;PkgType:byte):string;
var
  PkgLenght : string[4]; //1 byte
  PkType    : string[2]; //1 byte
  MsgHex    : string;
  x         : integer;
begin
  MsgHex:= '';
  for x := 1 to Length(Text) do MsgHex := MsgHex + IntToHex(Byte(Char(Text[x])),2);
  PkgLenght := IntToHex(Length(Text),4);
  PkType   := IntToHex(PkgType,2);
  MakePKG := #254 + PkgLenght + PkType + IntToHex(PkgID,4) + IntToHex(PkgCount,4) + MsgHex;
end;


Function TimeToInteger(Time:TDateTime):integer;
begin
  TimeToInteger := StrToInt(FormatDateTime('hhmmss',Time));
end;

Function IncTime(Interval:integer):integer;
var
  myDate : TDateTime;
begin
  myDate := now();
  IncTime := TimeToInteger(IncMinute(myDate, Interval));//60000 = 1 minuta
end;

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


end.


