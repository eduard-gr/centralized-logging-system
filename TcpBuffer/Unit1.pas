unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function HexToInt(HexStr : string) : Int64;
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

procedure TForm1.Button1Click(Sender: TObject);
var
  i,x       : integer;
  Buf       : array[1..1024] of Char;

  MsgString : String;
  MsgHex    : string;
  Count : integer;
begin


  {Memo1.lines.add('MsgString Length['+IntToStr(Length(MsgString))+']');
  Memo1.lines.add('MsgHex Length['+IntToStr(Length(MsgHex))+']');
  Memo1.lines.add('MsgHex['+MsgHex+']');
  Memo1.lines.add(StringOfChar('-',100));
  Memo1.lines.add('While Count['+IntToStr(Count)+']');
  Memo1.lines.add(StringOfChar('-',100));
  Memo1.lines.add('bufLength['+IntToStr(Length(buf))+']');
  Memo1.lines.add(StringOfChar('-',100));
  Memo1.lines.add(StringOfChar('-',100));}

//==============================================================================
//                    stastovlenija paketa                                     =
//             FE Proverachnij bait 2 baita dlina astalnoe paket               =
//==============================================================================
  MsgString := #255 + IntToHex(Length(Edit1.text),4)+ Edit1.text;
  MsgHex    := '';


  for x := 1 to Length(MsgString) do MsgHex := MsgHex + IntToHex(Byte(Char(MsgString[x])),2);

  FillChar(buf,1024,#00);

  Count := Length(MsgHex);

  x := 1;
  i := 1;
  while i < Count do
  begin
    Buf[x] := char(byte(HexToInt(Copy(MsgHex,i,2)+'H')));
    inc(i,2);
    inc(x);
  end;


//==============================================================================
//=                        Raskodiruem paket                                   =
//==============================================================================
   MsgString := '';
   for x := 1 to 9 do MsgString := MsgString + buf[x];
   Memo1.lines.add('MsgHex['+MsgString+']');

end;

end.

