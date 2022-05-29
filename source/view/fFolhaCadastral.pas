unit fFolhaCadastral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.WinXPickers, fFormGenerico, Vcl.CheckLst, uManipuladorFolhaCadastral, uUtil, StrUtils;

type
  TfrmFolhaCadastral = class(TfrmGenerico)
    pnlFundo: TPanel;
    pcFundo: TPageControl;
    tbsCabecalho: TTabSheet;
    pnlFundoDadosProp: TPanel;
    TabSheet1: TTabSheet;
    tbsDadosImovel: TTabSheet;
    PageControl1: TPageControl;
    tbsDocRegistrados: TTabSheet;
    tbsDocOcupantes: TTabSheet;
    edtNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCodCidadeNatural: TEdit;
    Label4: TLabel;
    edtNmCidadeNatural: TEdit;
    edtUfNatural: TEdit;
    Label5: TLabel;
    edtProfissao: TEdit;
    Label6: TLabel;
    edtCpfCnpj: TEdit;
    Label7: TLabel;
    edtRgIe: TEdit;
    Label8: TLabel;
    cbTpDocumento: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    edtOrgaoExpedidor: TEdit;
    Label11: TLabel;
    edtNmPai: TEdit;
    Label12: TLabel;
    edtNmMae: TEdit;
    gbEstadoCivil: TGroupBox;
    pnlEstadoCivil: TPanel;
    pnlDadosProprietario: TPanel;
    gbDadosProprietario: TGroupBox;
    edtNumeroCertidao: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    edtFolhas: TEdit;
    edtLivro: TEdit;
    Label15: TLabel;
    edtCartorio: TEdit;
    Label16: TLabel;
    edtNumeroSentenca: TEdit;
    Label17: TLabel;
    edtJuizo: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    chkPactoAntenupcial: TCheckBox;
    Label20: TLabel;
    edtCertidaoPacto: TEdit;
    Label21: TLabel;
    edtFolhasPacto: TEdit;
    edtLivroPacto: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    edtCartorioPacto: TEdit;
    gbPacto: TGroupBox;
    Label24: TLabel;
    pnlObs: TPanel;
    memoObs: TMemo;
    edtLocalidade: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edtResponsavel: TEdit;
    cblistEstadosCivis: TComboBox;
    Label28: TLabel;
    gbConjuge: TGroupBox;
    pnlFundoConjuge: TPanel;
    Label29: TLabel;
    edtNmConjuge: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    edtCdCidadeNaturalidadeConjuge: TEdit;
    edtNmCidadeNaturalidadeConjuge: TEdit;
    Label32: TLabel;
    edtUfNaturalidadeConjuge: TEdit;
    Label33: TLabel;
    edtProfissaoConjuge: TEdit;
    edtOrgaoExpedidorConjuge: TEdit;
    Label34: TLabel;
    edtRgConjuge: TEdit;
    Label35: TLabel;
    cbTipoDocumentoConjuge: TComboBox;
    Label36: TLabel;
    edtCpfCnpjConjuge: TEdit;
    Label37: TLabel;
    edtNmPaiConjuge: TEdit;
    Label38: TLabel;
    Label39: TLabel;
    edtNmMaeConjuge: TEdit;
    chkSabeAssinar: TCheckBox;
    chkSabeAssinarConjuge: TCheckBox;
    pnlRodape: TPanel;
    pnlEndereco: TPanel;
    Label40: TLabel;
    edtLogradouro: TEdit;
    Label41: TLabel;
    edtBairro: TEdit;
    edtNumero: TEdit;
    Label42: TLabel;
    Label43: TLabel;
    edtCidadeEndereco: TEdit;
    edtNmCidade: TEdit;
    Label44: TLabel;
    edtUf: TEdit;
    Label45: TLabel;
    edtTelefones: TEdit;
    GroupBox1: TGroupBox;
    pnlObra: TPanel;
    Label46: TLabel;
    edtObra: TEdit;
    edtSeqObra: TEdit;
    Label47: TLabel;
    Label48: TLabel;
    edtCodMunicipioObra: TEdit;
    edtNmMunicipioObra: TEdit;
    Label49: TLabel;
    edtEmail: TEdit;
    rgTpPessoa: TRadioGroup;
    edtDtNascimento: TDateTimePicker;
    edtData: TDateTimePicker;
    edtDataPacto: TDateTimePicker;
    lblUniaoEstavel: TLabel;
    edtUniaoEstavel: TEdit;
    edtNmObra: TEdit;
    edtDataLocalidade: TDateTimePicker;
    edtDtNascimentoConjuge: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure chkPactoAntenupcialClick(Sender: TObject);
    procedure cblistEstadosCivisChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pnlDadosProprietarioExit(Sender: TObject);
    procedure edtObraExit(Sender: TObject);
    procedure edtSeqObraExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodMunicipioObraChange(Sender: TObject);
    procedure edtCodCidadeNaturalChange(Sender: TObject);
    procedure edtCidadeEnderecoChange(Sender: TObject);
    procedure edtCodMunicipioObraExit(Sender: TObject);
    procedure edtEmailExit(Sender: TObject);
    procedure edtDataExit(Sender: TObject);
  private
    FManipulador: TManipuladorFolhaCadastral;
    procedure PreencheComboTipoDocumento;
    procedure PreencheEstadosCivis;
    procedure HabilitaCamposPacto(Habilita: Boolean);
    procedure HabilitaCamposEstadoCivil(Habilita, SeparadoDivorciado: Boolean);
    procedure PreencheDataSetFolhaCadastral;
    procedure PreencheDataSetFolhaCadastralEstadoCivil;
    procedure PreencheDataSetFolhaCadastralEstadoCivilCertidoes;
    procedure PreencheDataSetFolhaCadastralEndereco;
    procedure PreencheFolhaCadastralConjuge;
    function ValidaCampos: Boolean;
    procedure CarregaDados;
    procedure PreencheCampos;
    procedure PreencheCamposCabecalho;
    procedure PreencheCamposEstadoCivil;
    procedure PreencheCamposEndereco;
  public
    procedure LimparCampos; override;
    procedure Salvar; override;
    procedure Excluir; override;
  end;

var
  frmFolhaCadastral: TfrmFolhaCadastral;

implementation

uses
  uTypeFolhaCadastral;

{$R *.dfm}

{ TfrmFolhaCadastral }

procedure TfrmFolhaCadastral.CarregaDados;
begin
  if FManipulador.CarregaFolhaCadastral(StrToInt(edtObra.Text), edtSeqObra.Text) then
    PreencheCampos;
end;

procedure TfrmFolhaCadastral.cblistEstadosCivisChange(Sender: TObject);
begin
  inherited;
  case cblistEstadosCivis.ItemIndex + 1 of
    Integer(tSolteiro), Integer(tCasadoComUniversalBens),
    Integer(tCasadoComParcialBens), Integer(tCasadoRegSeparacaoBens),
    Integer(tUniaoEstavel), Integer(tViuvo): HabilitaCamposEstadoCivil(True, False);
    Integer(tSeparadoJudicialmente), Integer(tDivorciado): HabilitaCamposEstadoCivil(True, True);
  end;
end;

procedure TfrmFolhaCadastral.chkPactoAntenupcialClick(Sender: TObject);
begin
  inherited;
  HabilitaCamposPacto(chkPactoAntenupcial.Checked);
end;

procedure TfrmFolhaCadastral.edtCidadeEnderecoChange(Sender: TObject);
begin
  inherited;
  if edtCidadeEndereco.Text <> '' then
  begin
    edtNmCidade.Text := FManipulador.GetNomeCidade(StrToInt(edtCidadeEndereco.Text));
    edtUf.Text := FManipulador.GetUF(StrToInt(edtCidadeEndereco.Text));
  end
  else
  begin
    edtNmCidade.Clear;
    edtUf.Clear;
  end;
end;

procedure TfrmFolhaCadastral.edtCodCidadeNaturalChange(Sender: TObject);
begin
  inherited;
  if edtCodCidadeNatural.Text <> '' then
  begin
    edtNmCidadeNatural.Text := FManipulador.GetNomeCidade(StrToInt(edtCodCidadeNatural.Text));
    edtUfNatural.Text :=  FManipulador.GetUF(StrToInt(edtCodCidadeNatural.Text));
  end
  else
  begin
    edtNmCidadeNatural.Clear;
    edtUfNatural.Clear;
  end;
end;

procedure TfrmFolhaCadastral.edtCodMunicipioObraChange(Sender: TObject);
begin
  inherited;
  if edtCodMunicipioObra.Text <> '' then
    edtNmMunicipioObra.Text := FManipulador.GetNomeCidade(StrToInt(edtCodMunicipioObra.Text))
  else
    edtNmMunicipioObra.Clear;
end;

procedure TfrmFolhaCadastral.edtCodMunicipioObraExit(Sender: TObject);
begin
  inherited;
  rgTpPessoa.SetFocus;
end;

procedure TfrmFolhaCadastral.edtDataExit(Sender: TObject);
begin
  inherited;
  gbPacto.SetFocus;
end;

procedure TfrmFolhaCadastral.edtEmailExit(Sender: TObject);
begin
  inherited;
  pnlEstadoCivil.SetFocus;
end;

procedure TfrmFolhaCadastral.edtObraExit(Sender: TObject);
begin
  inherited;
  if not edtObra.IsEmpty then
    edtNmObra.Text := FManipulador.GetObra(StrToInt(edtObra.Text));
end;

procedure TfrmFolhaCadastral.edtSeqObraExit(Sender: TObject);
begin
  inherited;
  CarregaDados;
end;

procedure TfrmFolhaCadastral.Excluir;
begin
  inherited;

end;

procedure TfrmFolhaCadastral.PreencheCamposEndereco;
begin
  if FManipulador.Dados.cdsFolhaCadastralEndereco.RecordCount > 0 then
  begin
    edtLogradouro.Text := FManipulador.Dados.cdsFolhaCadastralEndereco.FieldByName('logradouro').AsString;
    edtNumero.Text := FManipulador.Dados.cdsFolhaCadastralEndereco.FieldByName('numero').AsString;
    edtBairro.Text := FManipulador.Dados.cdsFolhaCadastralEndereco.FieldByName('bairro').AsString;
    edtCidadeEndereco.Text := FManipulador.Dados.cdsFolhaCadastralEndereco.FieldByName('cd_cidade').AsInteger.ToString;
  end;
end;

procedure TfrmFolhaCadastral.PreencheCamposEstadoCivil;
begin
  case FManipulador.Dados.cdsFolhaCadEstadoCivil.FieldByName('cd_estado_civil').AsInteger of
    1: cblistEstadosCivis.ItemIndex := Ord(tSolteiro);
    2: cblistEstadosCivis.ItemIndex := Ord(tCasadoComUniversalBens);
    3: cblistEstadosCivis.ItemIndex := Ord(tCasadoComParcialBens);
    4: cblistEstadosCivis.ItemIndex := Ord(tCasadoRegSeparacaoBens);
    5: cblistEstadosCivis.ItemIndex := Ord(tSeparadoJudicialmente);
    6: cblistEstadosCivis.ItemIndex := Ord(tDivorciado);
    7: cblistEstadosCivis.ItemIndex := Ord(tUniaoEstavel);
    8: cblistEstadosCivis.ItemIndex := Ord(tViuvo);
  end;

  if FManipulador.Dados.cdsFolhaCadEstadoCivilCert.Locate('possui_pacto_antenupcial', False, []) then
  begin
    edtNumeroCertidao.Text := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('nr_certidao').AsString;
    edtFolhas.Text := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('folhas').AsString;
    edtLivro.Text := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('livro').AsString;
    edtData.Date := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('data').AsDateTime;
    edtCartorio.Text := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('cartorio').AsString;
    edtNumeroSentenca.Text := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('nr_sentenca_autos').AsString;
    edtJuizo.Text := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('juizo').AsString;
    edtUniaoEstavel.Text := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('uniao_estavel_desde').AsString;
  end;

  if FManipulador.Dados.cdsFolhaCadEstadoCivilCert.Locate('possui_pacto_antenupcial', True, []) then
  begin
    chkPactoAntenupcial.Checked := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('possui_pacto_antenupcial').AsBoolean;
    edtCertidaoPacto.Text := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('nr_certidao').AsString;
    edtFolhasPacto.Text := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('folhas').AsString;
    edtLivroPacto.Text := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('livro').AsString;
    edtDataPacto.Date := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('data').AsDateTime;
    edtCartorioPacto.Text := FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('cartorio').AsString;
  end;
end;

procedure TfrmFolhaCadastral.PreencheCamposCabecalho;
begin
  edtCodMunicipioObra.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('cd_municipio').AsInteger.ToString;
  case AnsiIndexStr(UpperCase(FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_pessoa').AsString), ['F', 'J']) of
    0:
      rgTpPessoa.ItemIndex := 0;
    1:
      rgTpPessoa.ItemIndex := 1;
  end;
  edtNome.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('nome').AsString;
  edtDtNascimento.Date := FManipulador.Dados.cdsFolhaCadastral.FieldByName('dt_nascimento').AsDateTime;
  edtCodCidadeNatural.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('cd_cidade_naturalidade').AsInteger.ToString;
  edtProfissao.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('profissao').AsString;
  edtCpfCnpj.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('cpf_cnpj').AsString;
  case AnsiIndexStr(UpperCase(FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_documento').AsString), ['CI', 'CTPS', 'CP', 'IE']) of
    0:
      cbTpDocumento.ItemIndex := 0;
    1:
      cbTpDocumento.ItemIndex := 1;
    2:
      cbTpDocumento.ItemIndex := 2;
    3:
      cbTpDocumento.ItemIndex := 3;
  end;
  edtRgIe.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('ie_rg').AsString;
  chkSabeAssinar.Checked := FManipulador.Dados.cdsFolhaCadastral.FieldByName('sabe_assinar').AsBoolean;
  edtNmPai.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('nome_pai').AsString;
  edtNmMae.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('nome_mae').AsString;
  edtEmail.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('email').AsString;
  memoObs.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('obs').AsString;
  edtLocalidade.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('localidade').AsString;
  edtResponsavel.Text := FManipulador.Dados.cdsFolhaCadastral.FieldByName('nm_cadastrador').AsString;
end;

procedure TfrmFolhaCadastral.FormCreate(Sender: TObject);
begin
  FManipulador := TManipuladorFolhaCadastral.Create;
  PreencheComboTipoDocumento;
  PreencheEstadosCivis;
end;

procedure TfrmFolhaCadastral.FormDestroy(Sender: TObject);
begin
  inherited;
  FManipulador.Free;
end;

procedure TfrmFolhaCadastral.FormShow(Sender: TObject);
begin
  inherited;
  edtObra.SetFocus;
end;

procedure TfrmFolhaCadastral.HabilitaCamposEstadoCivil(Habilita, SeparadoDivorciado: Boolean);
begin
  edtNumeroCertidao.Enabled := Habilita;
  edtFolhas.Enabled := Habilita;
  edtLivro.Enabled := Habilita;
  edtCartorio.Enabled := Habilita;
  edtNumeroSentenca.Enabled := Habilita and SeparadoDivorciado;
  edtJuizo.Enabled := Habilita and SeparadoDivorciado;
  edtData.Enabled := Habilita;
  edtUniaoEstavel.Visible := Habilita;
  lblUniaoEstavel.Visible := Habilita;
end;

procedure TfrmFolhaCadastral.HabilitaCamposPacto(Habilita: Boolean);
begin
  edtCertidaoPacto.Enabled := Habilita;
  edtLivroPacto.Enabled := Habilita;
  edtFolhasPacto.Enabled := Habilita;
  edtCartorioPacto.Enabled := Habilita;
  edtDataPacto.Enabled := Habilita;
end;

procedure TfrmFolhaCadastral.LimparCampos;
begin
  inherited;
  edtObra.Clear;
  edtSeqObra.Clear;
  edtCodMunicipioObra.Clear;
  rgTpPessoa.ItemIndex := 1;
  edtNome.Clear;
  edtCodCidadeNatural.Clear;
  edtProfissao.Clear;
  edtCpfCnpj.Clear;
  cbTpDocumento.ItemIndex := -1;
  edtRgIe.Clear;
  edtOrgaoExpedidor.Clear;
  edtNmPai.Clear;
  edtNmMae.Clear;
  chkSabeAssinar.Checked := False;
  edtEmail.Clear;
  cblistEstadosCivis.ItemIndex := -1;
  edtNumeroCertidao.Clear;
  edtFolhas.Clear;
  edtLivro.Clear;
  edtCartorio.Clear;
  edtUniaoEstavel.Clear;
  edtNumeroSentenca.Clear;
  edtJuizo.Clear;
  chkPactoAntenupcial.Checked := False;
  edtCertidaoPacto.Clear;
  edtFolhasPacto.Clear;
  edtLivroPacto.Clear;
  edtCartorioPacto.Clear;
  edtLogradouro.Clear;
  edtNumero.Clear;
  edtBairro.Clear;
  edtCidadeEndereco.Clear;
  edtTelefones.Clear;
  memoObs.Clear;
  edtLocalidade.Clear;
  edtResponsavel.Clear;
end;

procedure TfrmFolhaCadastral.pnlDadosProprietarioExit(Sender: TObject);
begin
  inherited;
//  PreencheDataSetFolhaCadastral;
end;

procedure TfrmFolhaCadastral.PreencheCampos;
begin
  PreencheCamposCabecalho;
  PreencheCamposEstadoCivil;
  PreencheCamposEndereco;
end;

procedure TfrmFolhaCadastral.PreencheComboTipoDocumento;
begin
  cbTpDocumento.Items.Clear;
  cbTpDocumento.Items.Add('Carteira Identidade');
  cbTpDocumento.Items.Add('CTPS');
  cbTpDocumento.Items.Add('Carteira Profissional');
  cbTpDocumento.Items.Add('Inscrição Estadual');
end;

procedure TfrmFolhaCadastral.PreencheDataSetFolhaCadastral;
begin
  if FManipulador.Dados.cdsFolhaCadastral.Locate('cd_obra;sequencia;folha_proprietario', VarArrayOf([StrToInt(edtObra.Text), edtSeqObra.Text, True]), []) then
    FManipulador.Dados.cdsFolhaCadastral.Edit
  else
    FManipulador.Dados.cdsFolhaCadastral.Append;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('cd_obra').AsInteger := StrToInt(edtObra.Text);
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('sequencia').AsString := edtSeqObra.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('cd_municipio').AsInteger := StrToInt(edtCodMunicipioObra.Text);
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('nome').AsString := edtNome.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('dt_nascimento').AsDateTime := edtDtNascimento.Date;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('cd_cidade_naturalidade').AsInteger := StrToInt(edtCodCidadeNatural.Text);
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('profissao').AsString := edtProfissao.Text;
  case rgTpPessoa.ItemIndex of
    0: FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_pessoa').AsString := 'F';
    1: FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_pessoa').AsString := 'J';
  end;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('cpf_cnpj').AsString := edtCpfCnpj.Text;
  case cbTpDocumento.ItemIndex of
    0: FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_documento').AsString := 'CI';
    1: FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_documento').AsString := 'CTPS';
    2: FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_documento').AsString := 'CP';
    3: FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_documento').AsString := 'IE';
  end;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('ie_rg').AsString := edtRgIe.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('orgao_expedidor').AsString := edtOrgaoExpedidor.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('folha_proprietario').AsBoolean := True;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('sabe_assinar').AsBoolean := chkSabeAssinar.Checked;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('nome_pai').AsString := edtNmPai.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('nome_mae').AsString := edtNmMae.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('email').AsString := edtEmail.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('dt_cadastro').AsDateTime := Now;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('obs').AsString := memoObs.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('localidade').AsString := edtLocalidade.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('nm_cadastrador').AsString := edtResponsavel.Text;
  FManipulador.Dados.cdsFolhaCadastral.Post;

  PreencheDataSetFolhaCadastralEstadoCivil;
  PreencheDataSetFolhaCadastralEndereco;

  if edtNmConjuge.Text <> '' then
    PreencheFolhaCadastralConjuge;
end;

procedure TfrmFolhaCadastral.PreencheDataSetFolhaCadastralEndereco;
begin
  if FManipulador.Dados.cdsFolhaCadastralEndereco.FieldByName('id_geral').AsLargeInt > 0 then
     FManipulador.Dados.cdsFolhaCadastralEndereco.Edit
  else
    FManipulador.Dados.cdsFolhaCadastralEndereco.Append;
  FManipulador.Dados.cdsFolhaCadastralEndereco.FieldByName('logradouro').AsString := edtLogradouro.Text;
  FManipulador.Dados.cdsFolhaCadastralEndereco.FieldByName('numero').AsString := edtNumero.Text;
  FManipulador.Dados.cdsFolhaCadastralEndereco.FieldByName('bairro').AsString := edtBairro.Text;
  FManipulador.Dados.cdsFolhaCadastralEndereco.FieldByName('cd_cidade').AsInteger := StrToInt(edtCidadeEndereco.Text);
  FManipulador.Dados.cdsFolhaCadastralEndereco.Post;
end;

procedure TfrmFolhaCadastral.PreencheDataSetFolhaCadastralEstadoCivil;
begin
  if FManipulador.Dados.cdsFolhaCadEstadoCivil.FieldByName('id_geral').AsLargeInt > 0 then
    FManipulador.Dados.cdsFolhaCadEstadoCivil.Edit
  else
    FManipulador.Dados.cdsFolhaCadEstadoCivil.Append;
  FManipulador.Dados.cdsFolhaCadEstadoCivil.FieldByName('cd_estado_civil').AsInteger := Ord(tEstadosCivis(cblistEstadosCivis.ItemIndex + 1));
  FManipulador.Dados.cdsFolhaCadEstadoCivil.Post;

  PreencheDataSetFolhaCadastralEstadoCivilCertidoes;
end;

procedure TfrmFolhaCadastral.PreencheDataSetFolhaCadastralEstadoCivilCertidoes;
begin
  if FManipulador.Dados.cdsFolhaCadEstadoCivilCert.Locate('nr_certidao;folhas;livro;possui_pacto_antenupcial',
                                                          VarArrayOf([edtNumeroCertidao.Text, edtFolhas.Text, edtLivro.Text, False]), []) then
    FManipulador.Dados.cdsFolhaCadEstadoCivilCert.Edit
  else
    FManipulador.Dados.cdsFolhaCadEstadoCivilCert.Append;
  FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('nr_certidao').AsString := edtNumeroCertidao.Text;
  FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('folhas').AsString := edtFolhas.Text;
  FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('livro').AsString := edtLivro.Text;
  FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('data').AsDateTime := edtData.Date;
  FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('cartorio').AsString := edtCartorio.Text;
  FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('nr_sentenca_autos').AsString := edtNumeroSentenca.Text;
  FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('juizo').AsString := edtJuizo.Text;
  FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('uniao_estavel_desde').AsString := edtUniaoEstavel.Text;
  FManipulador.Dados.cdsFolhaCadEstadoCivilCert.Post;

  if chkPactoAntenupcial.Checked then
  begin
    if FManipulador.Dados.cdsFolhaCadEstadoCivilCert.Locate('nr_certidao;folhas;livro;possui_pacto_antenupcial',
                                                            VarArrayOf([edtCertidaoPacto.Text, edtFolhasPacto.Text, edtLivroPacto.Text, True]), []) then
      FManipulador.Dados.cdsFolhaCadEstadoCivilCert.Edit
    else
      FManipulador.Dados.cdsFolhaCadEstadoCivilCert.Append;
    FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('possui_pacto_antenupcial').AsBoolean := chkPactoAntenupcial.Checked;
    FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('nr_certidao').AsString := edtCertidaoPacto.Text;
    FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('folhas').AsString := edtFolhasPacto.Text;
    FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('livro').AsString := edtLivroPacto.Text;
    FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('data').AsDateTime := edtDataPacto.Date;
    FManipulador.Dados.cdsFolhaCadEstadoCivilCert.FieldByName('cartorio').AsString := edtCartorioPacto.Text;
    FManipulador.Dados.cdsFolhaCadEstadoCivilCert.Post;
  end;
end;

procedure TfrmFolhaCadastral.PreencheEstadosCivis;
begin
  cblistEstadosCivis.Items.Clear;
  cblistEstadosCivis.Items.Add('Solteiro');
  cblistEstadosCivis.Items.Add('Casado Regime Comunhão Universal de Bens');
  cblistEstadosCivis.Items.Add('Casado Regime Comunhão Parcial de Bens');
  cblistEstadosCivis.Items.Add('Casado Regime Separação de Bens');
  cblistEstadosCivis.Items.Add('Separado Judicialmente');
  cblistEstadosCivis.Items.Add('Divorciado');
  cblistEstadosCivis.Items.Add('União Estável');
  cblistEstadosCivis.Items.Add('Viúvo');
end;

procedure TfrmFolhaCadastral.PreencheFolhaCadastralConjuge;
begin
  if FManipulador.Dados.cdsFolhaCadastral.Locate('cd_obra;sequencia;folha_proprietario', VarArrayOf([StrToInt(edtObra.Text), edtSeqObra.Text, False]), []) then
    FManipulador.Dados.cdsFolhaCadastral.Edit
  else
    FManipulador.Dados.cdsFolhaCadastral.Append;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('cd_obra').AsInteger := StrToInt(edtObra.Text);
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('sequencia').AsString := edtSeqObra.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('cd_municipio').AsInteger := StrToInt(edtCodMunicipioObra.Text);
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('nome').AsString := edtNmConjuge.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('dt_nascimento').AsDateTime := edtDtNascimentoConjuge.Date;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('cd_cidade_naturalidade').AsInteger := StrToInt(edtCdCidadeNaturalidadeConjuge.Text);
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('profissao').AsString := edtProfissaoConjuge.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_pessoa').AsString := 'F';
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('cpf_cnpj').AsString := edtCpfCnpj.Text;
  case cbTipoDocumentoConjuge.ItemIndex of
    0: FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_documento').AsString := 'CI';
    1: FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_documento').AsString := 'CTPS';
    2: FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_documento').AsString := 'CP';
    3: FManipulador.Dados.cdsFolhaCadastral.FieldByName('tp_documento').AsString := 'IE';
  end;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('ie_rg').AsString := edtRgConjuge.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('orgao_expedidor').AsString := edtOrgaoExpedidorConjuge.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('folha_proprietario').AsBoolean := False;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('sabe_assinar').AsBoolean := chkSabeAssinarConjuge.Checked;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('nome_pai').AsString := edtNmPaiConjuge.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('nome_mae').AsString := edtNmMaeConjuge.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('dt_cadastro').AsDateTime := Now;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('localidade').AsString := edtLocalidade.Text;
  FManipulador.Dados.cdsFolhaCadastral.FieldByName('nm_cadastrador').AsString := edtResponsavel.Text;
  FManipulador.Dados.cdsFolhaCadastral.Post;
end;

procedure TfrmFolhaCadastral.Salvar;
begin
  PreencheDataSetFolhaCadastral;
  FManipulador.Dados.cdsFolhaCadastral.IndexFieldNames := 'folha_proprietario';
  FManipulador.Dados.cdsFolhaCadastral.Loop(
  procedure
  begin
    FManipulador.GravaFolhaCadastral;
  end
  );
end;

function TfrmFolhaCadastral.ValidaCampos: Boolean;
begin
  Result := True;

  if edtObra.IsEmpty then
    Exit(False);
  if edtSeqObra.IsEmpty then
    Exit(False);
  if edtCodMunicipioObra.IsEmpty then
    Exit(False);
end;

end.
