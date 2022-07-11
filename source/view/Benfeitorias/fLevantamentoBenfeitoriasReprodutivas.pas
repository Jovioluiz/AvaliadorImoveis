unit fLevantamentoBenfeitoriasReprodutivas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fFormGenerico, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.NumberBox, Vcl.Grids, Vcl.DBGrids,
  uManipuladorBenfeitorias, uUtil, uMensagem,
  uManipuladorBenfeitoriasReprodutivas;

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
    edtIdFCProprietario: TEdit;
    edtIdFCBeneficiario: TEdit;
    edtIdade: TNumberBox;
    btnAvTerras: TButton;
    btnCancelar: TButton;
    edtPreco: TNumberBox;
    Label13: TLabel;
    edtTotal: TNumberBox;
    Label14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure gridBenfeitoriasDblClick(Sender: TObject);
    procedure edtIdFCBeneficiarioExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAvTerrasClick(Sender: TObject);
    procedure edtObraChange(Sender: TObject);
    procedure edtCodigoBenfeitoriaChange(Sender: TObject);
    procedure edtCodigoBenfeitoriaExit(Sender: TObject);
    procedure gbCabecalhoExit(Sender: TObject);
    procedure edtIdFCBeneficiarioChange(Sender: TObject);
    procedure edtIdFCProprietarioExit(Sender: TObject);
    procedure edtCentroConsumidorChange(Sender: TObject);
  private
    FManipuladorBenfeitorias: TManipuladorBenfeitoriasReprodutivas;
    procedure Adicionar;
    procedure ValidaCampos;
    procedure CarregaEdicao;
    procedure ValidaCabecalho;
    procedure PreencheCabecalho;
    procedure GravarCabecalho;
    function GetNomeCidade(CodCidade: Integer): string;
  public
    procedure Salvar; override;
    procedure Excluir; override;
    procedure LimparCampos; override;
    property ManipuladorBenfeitorias: TManipuladorBenfeitoriasReprodutivas read FManipuladorBenfeitorias write FManipuladorBenfeitorias;
  end;

var
  frmBenfeitoriasReprodutivas: TfrmBenfeitoriasReprodutivas;

implementation

uses
  fAvaliacaoTerras, uDadosComum;

{$R *.dfm}

procedure TfrmBenfeitoriasReprodutivas.Adicionar;
var
  dados: TDadosBenfeitoria;
begin
  dados := Default(TDadosBenfeitoria);
  dados.cd_benfeitoria := edtCodigoBenfeitoria.Text;
  dados.un_medida := edtUnidade.Text;
  dados.quantidade := edtQuantidade.ValueFloat;
  dados.idade := edtIdade.ValueFloat;
  dados.tp_cultivo := TTipoCultivo(rgTipoCultivo.ItemIndex + 1);
  dados.preco := edtPreco.ValueCurrency;
  FManipuladorBenfeitorias.AdicionarBenfeitoriaReprodutiva(dados);
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

procedure TfrmBenfeitoriasReprodutivas.edtIdFCBeneficiarioChange(Sender: TObject);
begin
  inherited;
  if edtIdFCBeneficiario.Text <> '' then
    edtBeneficiario.Text := FManipuladorBenfeitorias.GetNome(StrToInt64(edtIdFCBeneficiario.Text));
end;

procedure TfrmBenfeitoriasReprodutivas.edtIdFCBeneficiarioExit(Sender: TObject);
var
  param: TParametrosBusca;
begin
  inherited;
  param := Default(TParametrosBusca);
  param.cd_obra := StrToInt(edtObra.Text);
  param.id_fc_proprietario := StrToInt64(edtIdFCProprietario.Text);
  param.id_fc_beneficiario := StrToInt64(edtIdFCBeneficiario.Text);
  param.sequencia := edtSequencia.Text;
  param.localizacao := edtLocalizacao.Text;
  FManipuladorBenfeitorias.CarregaLevantamento(param);
end;

procedure TfrmBenfeitoriasReprodutivas.edtIdFCProprietarioExit(Sender: TObject);
begin
  inherited;
  if edtIdFCProprietario.Text <> '' then
    edtNmProprietario.Text := FManipuladorBenfeitorias.GetNome(StrToInt64(edtIdFCProprietario.Text));
  if edtIdFCProprietario.Text <> '' then
    edtCentroConsumidor.Text := IntToStr(FManipuladorBenfeitorias.GetCodCidade(StrToInt64(edtIdFCProprietario.Text)));
end;

procedure TfrmBenfeitoriasReprodutivas.edtCentroConsumidorChange(Sender: TObject);
begin
  inherited;
  if edtCentroConsumidor.Text <> '' then
    edtNmCentroConsumidor.Text := GetNomeCidade(StrToInt(edtCentroConsumidor.Text));
end;

procedure TfrmBenfeitoriasReprodutivas.edtCodigoBenfeitoriaChange(Sender: TObject);
begin
  inherited;
  if edtCodigoBenfeitoria.Text <> '' then
    edtNmBenfeitoria.Text := FManipuladorBenfeitorias.GetNomeBenfeitoria(edtCodigoBenfeitoria.Text);
end;

procedure TfrmBenfeitoriasReprodutivas.edtCodigoBenfeitoriaExit(Sender: TObject);
var
  dadosPreco: TInfoPrecoBenfeitoria;
begin
  inherited;
  if (edtCodigoBenfeitoria.Text = '') then
  begin
    edtCodigoBenfeitoria.SetFocus;
    TMensagem.MostrarMensagem('Atenção', 'Informe o código da benfeitoria.', ['Ok']);
    Exit;
  end;
  if edtObra.Text = '' then
  begin
    edtObra.SetFocus;
    TMensagem.MostrarMensagem('Atenção', 'Informe o código da obra.', ['Ok']);
    Exit;
  end;
  
  dadosPreco := FManipuladorBenfeitorias.GetInfoPrecoBenfeitoria(edtCodigoBenfeitoria.Text, StrToInt(edtObra.Text));
  if not dadosPreco.cd_benfeitoria.Equals('') then
  begin
    edtUnidade.Text := dadosPreco.un_medida;
    edtPreco.ValueCurrency := dadosPreco.preco;
  end;
end;

procedure TfrmBenfeitoriasReprodutivas.edtObraChange(Sender: TObject);
var
  dados: TDadosComum;
begin
  inherited;
  if edtObra.IsEmpty then
    Exit;

  dados := TDadosComum.Create;
  try
    edtNmObra.Text := dados.GetObra(StrToInt(edtObra.Text));
  finally
    dados.Free;
  end;
end;

procedure TfrmBenfeitoriasReprodutivas.Excluir;
begin
  inherited;

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

procedure TfrmBenfeitoriasReprodutivas.gbCabecalhoExit(Sender: TObject);
begin
  inherited;
  ValidaCabecalho;
  PreencheCabecalho;
  GravarCabecalho;
end;

function TfrmBenfeitoriasReprodutivas.GetNomeCidade(CodCidade: Integer): string;
var
  cidade: TDadosComum;
begin
  cidade := TDadosComum.Create;

  try
    Result := cidade.GetNomeCidade(CodCidade);
  finally
    cidade.Free;
  end;
end;

procedure TfrmBenfeitoriasReprodutivas.GravarCabecalho;
begin
  FManipuladorBenfeitorias.GravarCabecalho;
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

procedure TfrmBenfeitoriasReprodutivas.PreencheCabecalho;
var
  param: TParametrosLevantamento;
begin
  param := Default(TParametrosLevantamento);
  param.cd_obra := StrToInt(edtObra.Text);
  param.id_folha_cadastral_proprietario := StrToInt64(edtIdFCProprietario.Text);
  param.id_folha_cadastral_beneficiario := StrToInt64(edtIdFCBeneficiario.Text);
  if param.id_folha_cadastral_beneficiario = 0 then
    param.id_folha_cadastral_beneficiario := param.id_folha_cadastral_proprietario;
  param.sequencia := edtSequencia.Text;
  param.localizacao := edtLocalizacao.Text;
  param.nr_laudo := edtNrLaudo.Text;
  param.dt_levantamento := Now();
  case rgAcessibilidade.ItemIndex of
    -1: param.acessibilidade := taNenhum;
    0: param.acessibilidade := taOtima;
    1: param.acessibilidade := taMuitoBoa;
    2: param.acessibilidade := taBoa;
    3: param.acessibilidade := taRegular;
    4: param.acessibilidade := taRuim;
  end;

  if edtCentroConsumidor.Text <> '' then
    param.cd_centro_consumidor := StrToInt(edtCentroConsumidor.Text);

  case rgDistanciaCentro.ItemIndex of
    -1: param.distancia_centro_consumidor := tdNenhum;
    0: param.distancia_centro_consumidor := tdMuitoProximo;
    1: param.distancia_centro_consumidor := tdProximo;
    2: param.distancia_centro_consumidor := tdDistante;
    3: param.distancia_centro_consumidor := tdMuitoDistante;
  end;

  case rgNivelManejo.ItemIndex of
    -1: param.nivel_manejo := tnmNenhum;
    0: param.nivel_manejo := tnmAvancado;
    1: param.nivel_manejo := tnmSemiAvancado;
    2: param.nivel_manejo := tnmTradicional;
    3: param.nivel_manejo := tnmPrimitivo;
    4: param.nivel_manejo := tnmImprodutivo;
  end;

  FManipuladorBenfeitorias.CarregaDataSetCabecalho(param);
end;

procedure TfrmBenfeitoriasReprodutivas.Salvar;
begin
  inherited;
  FManipuladorBenfeitorias.GravarCabecalho;
  FManipuladorBenfeitorias.GravarBenfeitorias;
end;

procedure TfrmBenfeitoriasReprodutivas.ValidaCampos;
begin
  if edtCodigoBenfeitoria.IsEmpty then
  begin
    TMensagem.MostrarMensagem('Atenção', 'Informe o código de uma benfeitoria.', ['Ok']);
    edtCodigoBenfeitoria.SetFocus;
  end;
  if edtUnidade.IsEmpty then
  begin
    TMensagem.MostrarMensagem('Atenção', 'Informe uma unidade de medida para a benfeitoria.', ['Ok']);
    edtUnidade.SetFocus;
  end;
  if edtQuantidade.ValueFloat <= 0 then
  begin
    TMensagem.MostrarMensagem('Atenção', 'Informe uma quantidade maior que zer.', ['Ok']);
    edtQuantidade.SetFocus;
  end;
end;

procedure TfrmBenfeitoriasReprodutivas.ValidaCabecalho;
begin
  if edtObra.IsEmpty then
  begin
    TMensagem.MostrarMensagem('Atenção', 'Informe o código da obra.', ['Ok']);
    edtObra.SetFocus;
  end;
  if edtIdFCProprietario.IsEmpty then
  begin
    TMensagem.MostrarMensagem('Atenção', 'Informe o código do proprietário.', ['Ok']);
    edtIdFCProprietario.SetFocus;
  end;
  if edtIdFCBeneficiario.IsEmpty then
  begin
    TMensagem.MostrarMensagem('Atenção', 'Informe o código do beneficiário.', ['Ok']);
    edtIdFCBeneficiario.SetFocus;
  end;
  if edtSequencia.IsEmpty then
  begin
    TMensagem.MostrarMensagem('Atenção', 'Informe o número sequencial.', ['Ok']);
    edtSequencia.SetFocus;
  end;
  if edtLocalizacao.IsEmpty then
  begin  
    TMensagem.MostrarMensagem('Atenção', 'Informe a localização.', ['Ok']);
    edtLocalizacao.SetFocus;
  end;
end;
end.
