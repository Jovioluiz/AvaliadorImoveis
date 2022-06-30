unit fLevantamentoBenfeitoriasReprodutivas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fFormGenerico, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.NumberBox, Vcl.Grids, Vcl.DBGrids,
  uManipuladorBenfeitorias, uUtil;

type
  TfrmBenfeitoriasReprodutivas = class(TfrmGenerico)
    edtObra: TEdit;
    edtSequencia: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNmObra: TEdit;
    gbCabecalho: TGroupBox;
    edtNmProprietario: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtBeneficiario: TEdit;
    Label5: TLabel;
    edtLocalizacao: TEdit;
    Label6: TLabel;
    edtNrLaudo: TEdit;
    grBenfeitorias: TGroupBox;
    Label7: TLabel;
    edtCodigoBenfeitoria: TEdit;
    edtNmBenfeitoria: TEdit;
    edtUnidade: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    rgTipoCultivo: TRadioGroup;
    gridBenfeitorias: TDBGrid;
    gbGrid: TGroupBox;
    Label11: TLabel;
    edtQuantidade: TNumberBox;
    btnAdicionar: TButton;
    gbFatores: TGroupBox;
    rgAcessibilidade: TRadioGroup;
    Label12: TLabel;
    gbDistancia: TGroupBox;
    edtCentroConsumidor: TEdit;
    edtNmCentroConsumidor: TEdit;
    GroupBox1: TGroupBox;
    rgNivelManejo: TRadioGroup;
    rgDistanciaCentro: TRadioGroup;
    edtCodProprietario: TEdit;
    edtCodBeneficiario: TEdit;
    edtIdade: TNumberBox;
    btnAvTerras: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure gridBenfeitoriasDblClick(Sender: TObject);
    procedure edtCodBeneficiarioExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAvTerrasClick(Sender: TObject);
    procedure edtObraChange(Sender: TObject);
  private
    FManipuladorBenfeitorias: TManipuladorBenfeitorias;
    procedure Adicionar;
    procedure ValidaCampos;
    procedure CarregaEdicao;

  public
    procedure LimparCampos; override;
    property ManipuladorBenfeitorias: TManipuladorBenfeitorias read FManipuladorBenfeitorias write FManipuladorBenfeitorias;
  end;

var
  frmBenfeitoriasReprodutivas: TfrmBenfeitoriasReprodutivas;

implementation

uses
  uManipuladorBenfeitoriasReprodutivas, fAvaliacaoTerras, uDadosComum;

{$R *.dfm}

procedure TfrmBenfeitoriasReprodutivas.Adicionar;
var
  dados: TDadosBenfeitoria;
begin
  dados := Default(TDadosBenfeitoria);
  dados.cd_benfeitoria := StrToInt(edtCodigoBenfeitoria.Text);
  dados.un_medida := edtUnidade.Text;
  dados.quantidade := edtQuantidade.ValueFloat;
  dados.idade := edtIdade.ValueFloat;
  dados.tp_cultivo := TTipoCultivo(rgTipoCultivo.ItemIndex + 1);
  TManipuladorBenfeitoriasReprodutivas(FManipuladorBenfeitorias).AdicionarBenfeitoriaReprodutiva(dados);
end;

procedure TfrmBenfeitoriasReprodutivas.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  ValidaCampos;
  Adicionar;
end;

procedure TfrmBenfeitoriasReprodutivas.btnAvTerrasClick(Sender: TObject);
var
  avaliacao: TfrmAvaliacaoTerras;
begin
  inherited;
  avaliacao := TfrmAvaliacaoTerras.Create(Self);

  try
    avaliacao.ShowModal;
  finally
    avaliacao.Free;
  end;
end;

procedure TfrmBenfeitoriasReprodutivas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FManipuladorBenfeitorias.Dados.cdsLFBenfeitoriaReprodutiva.EmptyDataSet;
  Close;
end;

procedure TfrmBenfeitoriasReprodutivas.CarregaEdicao;
begin
  edtCodigoBenfeitoria.Text := FManipuladorBenfeitorias.Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('cd_benfeitoria').AsInteger.ToString;
  edtUnidade.Text := FManipuladorBenfeitorias.Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('un_medida').AsString;
  edtQuantidade.ValueFloat := FManipuladorBenfeitorias.Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('quantidade').AsFloat;
  edtIdade.ValueFloat := FManipuladorBenfeitorias.Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('idade').AsFloat;
  rgTipoCultivo.ItemIndex := FManipuladorBenfeitorias.Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('tp_cultivo').AsInteger;
end;

procedure TfrmBenfeitoriasReprodutivas.edtCodBeneficiarioExit(Sender: TObject);
var
  param: TParametrosLevantamento;
begin
  inherited;
  param := Default(TParametrosLevantamento);
  param.cd_obra := StrToInt(edtObra.Text);
  param.cd_proprietario := StrToInt(edtCodProprietario.Text);
  param.cd_beneficiario := StrToInt(edtCodBeneficiario.Text);
  param.sequencia := edtSequencia.Text;
  param.localizacao := edtLocalizacao.Text;
  FManipuladorBenfeitorias.CarregaLevantamento(param);
end;

procedure TfrmBenfeitoriasReprodutivas.edtObraChange(Sender: TObject);
var
  dados: TDadosComum;
begin
  inherited;
  dados := TDadosComum.Create;

  try
    edtNmObra.Text := dados.GetObra(StrToInt(edtObra.Text));
  finally
    dados.Free;
  end;
end;

procedure TfrmBenfeitoriasReprodutivas.FormCreate(Sender: TObject);
begin
  inherited;
  FManipuladorBenfeitorias := TManipuladorBenfeitoriasReprodutivas.Create;
  gridBenfeitorias.DataSource := FManipuladorBenfeitorias.Dados.dsLFBenfeitoriaReprodutiva;
end;

procedure TfrmBenfeitoriasReprodutivas.FormDestroy(Sender: TObject);
begin
  inherited;
  FManipuladorBenfeitorias.Free;
end;

procedure TfrmBenfeitoriasReprodutivas.gridBenfeitoriasDblClick(Sender: TObject);
begin
  inherited;
  CarregaEdicao;
end;

procedure TfrmBenfeitoriasReprodutivas.LimparCampos;
begin
  edtCodigoBenfeitoria.Clear;
  edtUnidade.Clear;
  edtQuantidade.ValueFloat := 0;
  edtIdade.ValueFloat := 0;
  rgTipoCultivo.ItemIndex := 0;
  edtCodigoBenfeitoria.SetFocus;
end;

procedure TfrmBenfeitoriasReprodutivas.ValidaCampos;
begin
  if edtCodigoBenfeitoria.IsEmpty then
    raise Exception.Create('Informe o código de uma benfeitoria.');
  if edtUnidade.IsEmpty then
    raise Exception.Create('Informe uma unidade de medida para a benfeitoria.');
  if edtQuantidade.ValueFloat <= 0 then
    raise Exception.Create('Informe uma quantidade maior que zero.');
end;

end.
