unit uUtil;

interface

uses
  Vcl.StdCtrls, Data.DB, System.SysUtils;

type TEditDocumento = class helper for TEdit
  function IsEmpty: Boolean;

end;

type
  TDataSetHelper = class helper for TDataSet
    public
      procedure LoopSimples(Procedimento: TProc);
      procedure LoopCompleto(Procedimento: TProc);
      procedure Loop(Procedimento: TProc);
  end;

implementation

{ TEditDocumento }

function TEditDocumento.IsEmpty: Boolean;
begin
  Result := Trim(Self.Text) = EmptyStr;
end;

{ TDataSetHelper }

procedure TDataSetHelper.Loop(Procedimento: TProc);
begin
  if Self.IsEmpty then
    Exit;
  Self.First;
  while not Self.Eof do
  begin
    Procedimento;
    Self.Next;
  end;
  Self.First;
end;

procedure TDataSetHelper.LoopCompleto(Procedimento: TProc);
var
  book: TBookMark;
begin
  if Self.IsEmpty then
    Exit;
  Self.DisableControls;
  book := Self.GetBookmark;
  try
    Self.Loop(Procedimento);
  finally
    if Self.BookmarkValid(book) then
      Self.GotoBookmark(book);
    Self.FreeBookmark(book);
    Self.EnableControls;
  end;
end;

procedure TDataSetHelper.LoopSimples(Procedimento: TProc);
begin
  if Self.IsEmpty then
    Exit;
  Self.DisableControls;
  try
    Self.First;
    while not Self.Eof do
    begin
      Procedimento;
      Self.Next;
    end;
    Self.First;
  finally
    Self.EnableControls;
  end;
end;

end.
