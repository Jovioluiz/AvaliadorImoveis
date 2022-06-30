unit fAvaliacaoTerras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fFormGenerico, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uManipuladorAvaliacaoTerras,
  Vcl.NumberBox, System.StrUtils;

type
  TfrmAvaliacaoTerras = class(TfrmGenerico)
    Label1: TLabel;
    edtObjLaudo: TEdit;
    Label2: TLabel;
    edtAtribuido: TEdit;
    Label3: TLabel;
    edtNrLaudo: TEdit;
    gbfh: TGroupBox;
    pnlBaixo: TPanel;
    pnlTop: TPanel;
    Label4: TLabel;
    edtNumProcesso: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    grid: TDBGrid;
    Label8: TLabel;
    Label9: TLabel;
    btnAdicionar: TButton;
    cbClasse: TComboBox;
    edtAreaClasse: TNumberBox;
    edtFatorHomogeinizacao: TNumberBox;
    edtFD: TNumberBox;
    Label10: TLabel;
    edtFM: TNumberBox;
    Label11: TLabel;
    edtFA: TNumberBox;
    Label12: TLabel;
    Label13: TLabel;
    edtAreaTotal: TNumberBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtFAChange(Sender: TObject);
    procedure edtFMChange(Sender: TObject);
    procedure edtFDChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
  private
    FManipulador: TManipuladorAvaliacaoTerras;
    procedure Adicionar;
    function CalculaFatorHomogeinizacao: Double;
    procedure ValidaCampos;
    procedure CarregaEdicao;
  public
    procedure LimparCampos; override;
    procedure Salvar; override;
    procedure Excluir; override;
    property Manipulador: TManipuladorAvaliacaoTerras read FManipulador write FManipulador;
  end;

var
  frmAvaliacaoTerras: TfrmAvaliacaoTerras;

implementation

{$R *.dfm}

procedure TfrmAvaliacaoTerras.Adicionar;
begin
  if FManipulador.Dados.cdsClasseTerra.Locate('classe', cbClasse.Items[cbClasse.ItemIndex], []) then
    FManipulador.Dados.cdsClasseTerra.Edit
  else
    FManipulador.Dados.cdsClasseTerra.Append;
  FManipulador.Dados.cdsClasseTerra.FieldByName('fa').AsFloat := edtFA.ValueFloat;
  FManipulador.Dados.cdsClasseTerra.FieldByName('fm').AsFloat := edtFM.ValueFloat;
  FManipulador.Dados.cdsClasseTerra.FieldByName('fd').AsFloat := edtFD.ValueFloat;
  FManipulador.Dados.cdsClasseTerra.FieldByName('classe').AsString := cbClasse.Items[cbClasse.ItemIndex];
  FManipulador.Dados.cdsClasseTerra.FieldByName('fator').AsFloat := edtFatorHomogeinizacao.ValueFloat;
  FManipulador.Dados.cdsClasseTerra.FieldByName('area_ha').AsFloat := edtAreaClasse.ValueFloat;
  FManipulador.Dados.cdsClasseTerra.FieldByName('area_total').AsFloat := edtAreaTotal.ValueFloat;
  FManipulador.Dados.cdsClasseTerra.Post;
end;

procedure TfrmAvaliacaoTerras.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  ValidaCampos;
  Adicionar;
  LimparCampos;
end;

function TfrmAvaliacaoTerras.CalculaFatorHomogeinizacao: Double;
begin
  Result := edtFA.ValueFloat * edtFD.ValueFloat * edtFM.ValueFloat;
end;

procedure TfrmAvaliacaoTerras.CarregaEdicao;
begin
  edtFA.ValueFloat := FManipulador.Dados.cdsClasseTerra.FieldByName('fa').AsFloat;
  edtFM.ValueFloat := FManipulador.Dados.cdsClasseTerra.FieldByName('fm').AsFloat;
  edtFD.ValueFloat := FManipulador.Dados.cdsClasseTerra.FieldByName('fd').AsFloat;
  edtFatorHomogeinizacao.ValueFloat := FManipulador.Dados.cdsClasseTerra.FieldByName('fator').AsFloat;
  edtAreaTotal.ValueFloat := FManipulador.Dados.cdsClasseTerra.FieldByName('area_total').AsFloat;
  edtAreaClasse.ValueFloat := FManipulador.Dados.cdsClasseTerra.FieldByName('area_ha').AsFloat;
  cbClasse.ItemIndex := AnsiIndexStr(FManipulador.Dados.cdsClasseTerra.FieldByName('classe').AsString,
                                     ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII']);
end;

procedure TfrmAvaliacaoTerras.edtFAChange(Sender: TObject);
begin
  inherited;
  edtFatorHomogeinizacao.ValueFloat := CalculaFatorHomogeinizacao;
end;

procedure TfrmAvaliacaoTerras.edtFDChange(Sender: TObject);
begin
  inherited;
  edtFatorHomogeinizacao.ValueFloat := CalculaFatorHomogeinizacao;
end;

procedure TfrmAvaliacaoTerras.edtFMChange(Sender: TObject);
begin
  inherited;
  edtFatorHomogeinizacao.ValueFloat := CalculaFatorHomogeinizacao;
end;

procedure TfrmAvaliacaoTerras.Excluir;
begin
  inherited;

end;

procedure TfrmAvaliacaoTerras.FormCreate(Sender: TObject);
begin
  inherited;
  FManipulador := TManipuladorAvaliacaoTerras.Create;
  grid.DataSource := FManipulador.Dados.dsClasseTerra;
end;

procedure TfrmAvaliacaoTerras.FormDestroy(Sender: TObject);
begin
  inherited;
  FManipulador.Free;
end;

procedure TfrmAvaliacaoTerras.FormShow(Sender: TObject);
begin
  inherited;
  edtNumProcesso.SetFocus;
end;

procedure TfrmAvaliacaoTerras.gridDblClick(Sender: TObject);
begin
  inherited;
  CarregaEdicao;
end;

procedure TfrmAvaliacaoTerras.LimparCampos;
begin
  inherited;
  edtFA.Clear;
  edtFM.Clear;
  edtFD.Clear;
  edtFatorHomogeinizacao.Clear;
  edtAreaTotal.Clear;
  edtAreaClasse.Clear;
  cbClasse.ItemIndex := -1;
end;

procedure TfrmAvaliacaoTerras.Salvar;
begin
  inherited;

end;

procedure TfrmAvaliacaoTerras.ValidaCampos;
begin
  if edtAreaClasse.ValueFloat = 0 then
  begin
    edtAreaClasse.SetFocus;
    raise Exception.Create('Informe a área da classe.');
  end;
  if cbClasse.ItemIndex < 0 then
  begin
    cbClasse.SetFocus;
    raise Exception.Create('Informe uma classe.');
  end;
  if edtFatorHomogeinizacao.ValueFloat = 0 then
  begin
    edtFatorHomogeinizacao.SetFocus;
    raise Exception.Create('Informe um fator de homogeinização.');
  end;
end;

end.
