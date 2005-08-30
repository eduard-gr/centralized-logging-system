unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button4: TButton;
    Button5: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    Procedure AddToBuf(Text:string);
    Function  MakePKG(Text:string;PkgID:integer;PkgCount:integer):string;
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
//    function StringtoHex(Data: string): string;
    function HexToInt(HexStr : string) : Int64;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SendBuff : TStringList;
implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  SendBuff := TStringList.Create;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  AddToBuf(Edit1.text);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit1.text := StringOfChar(Edit2.Text[1],StrToInt(Edit3.text));
end;


Procedure TForm1.AddToBuf(Text:string);
var
  PkgCount : integer;
  Temp     : Integer;
  X        : integer;
begin
  if Length(Text) > 1000 then
  begin
    PkgCount := Length(Text) div 1000;
    Temp := PkgCount * 1000;
    if Length(Text) <> Temp then Inc(PkgCount);
    Temp := 0;
    for x := 0 to PkgCount -1do
      SendBuff.Add(MakePKG(Copy(Text,x*1000,1000),x,PkgCount-1));
  end
  else
  begin
    SendBuff.Add(MakePKG(Text,0,0));
  end;
end;

Function  TForm1.MakePKG(Text:string;PkgID:integer;PkgCount:integer):string;
var
  PkgLenght : string[4]; //1 byte
  PkgType   : string[2]; //1 byte
  Pid       : string[2]; //1 byte //id poketa
  PCount    : string[2]; //1 byte //obschee kolichestvo poketov
  MsgHex    : string;
  x         : integer;
begin
  MsgHex:= '';
  for x := 1 to Length(Text) do MsgHex := MsgHex + IntToHex(Byte(Char(Text[x])),2);
  PkgLenght := IntToHex(Length(MsgHex),4);
  PkgType   := IntToHex(01,2);
  MakePKG := #254 + PkgLenght + PkgType + IntToHex(PkgID,2) + IntToHex(PkgCount,2) + MsgHex;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  X  : integer;
begin
  for x := 0 to SendBuff.Count - 1 do
  begin
    Memo1.lines.add(SendBuff[0]);

    Memo1.lines.add(StringOfChar('-',Length(SendBuff[0])));
    SendBuff.Delete(0);
  end;
end;

Function TForm1.HexToInt(HexStr : string) : Int64;
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


procedure TForm1.Button5Click(Sender: TObject);
var
  Buf       : array[1..1024] of Char;
  Count     : integer;
  X,I       : integer;
  MsgHex    : string;
  MsgString : string;
begin

  MsgString := Edit1.text;

  FillChar(buf,1024,#00);

  MsgHex:= '';
  for x := 1 to Length(MsgString) do MsgHex := MsgHex + IntToHex(Byte(Char(MsgString[x])),2);

  Count := Length(MsgHex);
  x := 1;
  i := 1;

  Memo1.Lines.Add('Count='+IntToStr(Count)); 

  MsgString := '';
  while i <= Count do
  begin
//    Buf[x] := char(byte(HexToInt(Copy(MsgHex,i,2)+'H')));
    MsgString := MsgString + char(byte(HexToInt(Copy(MsgHex,i,2)+'H')));
    inc(i,2);
    inc(x);
  end;
  Memo1.lines.add('MsgHex['+MsgString+']');

 { MsgString := '';
  for x := 1 to 5 do MsgString := MsgString + buf[x];
  Memo1.lines.add('MsgHex['+MsgString+']');
  }

end;



end.
