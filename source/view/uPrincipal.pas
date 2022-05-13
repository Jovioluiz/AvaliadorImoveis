unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    menuOpcoes: TMainMenu;
    FolhaCadastral1: TMenuItem;
    Cadastrar1: TMenuItem;
    Visualizar1: TMenuItem;
    pnlFundo: TPanel;
    procedure Cadastrar1Click(Sender: TObject);
  private
    procedure AbreFormulario(T: TFormClass; Form: TForm);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  fFolhaCadastral;

{$R *.dfm}

procedure TfrmPrincipal.AbreFormulario(T: TFormClass; Form: TForm);
begin
  try
    Application.CreateForm(T, Form);
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TfrmPrincipal.Cadastrar1Click(Sender: TObject);
begin
  AbreFormulario(TfrmFolhaCadastral, frmFolhaCadastral);
end;

end.
