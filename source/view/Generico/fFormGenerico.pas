unit fFormGenerico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmGenerico = class(TForm)
    Panel1: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure LimparCampos; virtual; abstract;
    procedure Salvar; virtual; abstract;
    procedure Excluir; virtual; abstract;
  end;

var
  frmGenerico: TfrmGenerico;

implementation

{$R *.dfm}

procedure TfrmGenerico.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then //F3
    LimparCampos
  else if Key = VK_F2 then  //F2
    Salvar
  else if Key = VK_F4 then    //F4
    Excluir
  else if Key = VK_ESCAPE then //ESC
    if (Application.MessageBox('Deseja Fechar?','Atenção', MB_YESNO) = IDYES) then
      Close;
end;

procedure TfrmGenerico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0)
  end;
end;

end.
