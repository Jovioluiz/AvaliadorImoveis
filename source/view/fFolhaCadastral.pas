unit fFolhaCadastral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.WinXPickers, fFormGenerico, Vcl.CheckLst;

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
    edtDtNascimento: TDatePicker;
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
    edtData: TDatePicker;
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
    edtDataPacto: TDatePicker;
    pnlObs: TPanel;
    memoObs: TMemo;
    edtLocalidade: TEdit;
    Label25: TLabel;
    edtDataLocalidade: TDatePicker;
    Label26: TLabel;
    Label27: TLabel;
    edtResponsável: TEdit;
    cblistEstadosCivis: TComboBox;
    Label28: TLabel;
    gbConjuge: TGroupBox;
    pnlFundoConjuge: TPanel;
    Label29: TLabel;
    edtNmConjuge: TEdit;
    Label30: TLabel;
    edtDtNascimentoConjuge: TDatePicker;
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
    procedure FormCreate(Sender: TObject);
    procedure chkPactoAntenupcialClick(Sender: TObject);
    procedure cblistEstadosCivisChange(Sender: TObject);
  private
    procedure PreencheComboTipoDocumento;
    procedure PreencheEstadosCivis;
    procedure HabilitaCamposPacto(Habilita: Boolean);
    procedure HabilitaCamposEstadoCivil(Habilita, SeparadoDivorciado: Boolean);
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

procedure TfrmFolhaCadastral.Excluir;
begin
  inherited;

end;

procedure TfrmFolhaCadastral.FormCreate(Sender: TObject);
begin
  PreencheComboTipoDocumento;
  PreencheEstadosCivis;
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

end;

procedure TfrmFolhaCadastral.PreencheComboTipoDocumento;
begin
  cbTpDocumento.Items.Clear;
  cbTpDocumento.Items.Add('Carteira Identidade');
  cbTpDocumento.Items.Add('CTPS');
  cbTpDocumento.Items.Add('Carteira Profissional');
  cbTpDocumento.Items.Add('Inscrição Estadual');
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

procedure TfrmFolhaCadastral.Salvar;
begin

end;

end.
