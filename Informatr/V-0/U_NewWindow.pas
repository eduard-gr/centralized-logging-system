unit U_NewWindow;

interface


implementation
uses
  Unit1;


procedure CreatenePage(PageCaption:string);
{var
  }
begin

{

  if (PageType = '') or (PageID = '') then
  begin
    PageType := 'new';
    PageID   := 'new';
    TextType := 'new';
  end;

  //!!!!
  if MemoText = '' then MemoText := '' ;


  NewTabSheet := TTabSheet.Create (Form1.PageControl2);
  NewTabSheet.Visible := True;
  NewTabSheet.Caption := PageCaption;
  NewTabSheet.PageControl := Form1.PageControl2;
//  NewTabSheet.ImageIndex := 0;
  Form1.PageControl2.ActivePage := NewTabSheet;
  Inc(TableParamsListCount);
  SetLength(TableParamsList,TableParamsListCount);
  with TableParamsList[TableParamsListCount-1] do
  begin
    Memo := TAdvMemo.Create(Application);
    Memo.Parent    := NewTabSheet;
    Memo.Align     := alClient;
    Memo.Font.Size := 10;
    Memo.ScrollBars := ssBoth;
    Memo.Lines.Text := MemoText;

    Memo.PopupMenu := Form1.EditPopup;
    ID          := PageID;
    //Neabhadima sminit imena shtob ani bili raznie !!! inache PageType neukazivaeca !   [done]
    PType    := PageType;
  end;}
end;

end.
