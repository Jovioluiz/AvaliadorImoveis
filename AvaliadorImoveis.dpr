program AvaliadorImoveis;

uses
  Vcl.Forms,
  uPrincipal in 'source\view\uPrincipal.pas' {frmPrincipal},
  fFolhaCadastral in 'source\view\fFolhaCadastral.pas' {frmFolhaCadastral},
  fFormGenerico in 'source\view\Generico\fFormGenerico.pas' {frmGenerico},
  uTypeFolhaCadastral in 'source\controller\types\uTypeFolhaCadastral.pas',
  uObjetoRegra in 'source\controller\ObjetoRegra\uObjetoRegra.pas',
  uDMConexao in 'source\model\Conexao\uDMConexao.pas' {dmConexao: TDataModule},
  uclFOLHA_CADASTRAL in 'source\model\Persistencia\uclFOLHA_CADASTRAL.pas',
  uManipuladorFolhaCadastral in 'source\controller\Manipuladores\uManipuladorFolhaCadastral.pas',
  uRegra in 'source\controller\ObjetoRegra\uRegra.pas',
  uDmFolhaCadastral in 'source\model\ControleDados\uDmFolhaCadastral.pas' {DmFolhaCadastral: TDataModule},
  uConsultaSQL in 'source\Consulta\uConsultaSQL.pas',
  uObjetoRegraInterface in 'source\controller\ObjetoRegra\uObjetoRegraInterface.pas',
  uUtil in 'source\uteis\uUtil.pas',
  uclFOLHA_CADASTRAL_ESTADO_CIVIL in 'source\model\Persistencia\uclFOLHA_CADASTRAL_ESTADO_CIVIL.pas',
  uPersistencia in 'source\model\Persistencia\uPersistencia.pas',
  uclFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES in 'source\model\Persistencia\uclFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.pas',
  uclFOLHA_CADASTRAL_ENDERECO in 'source\model\Persistencia\uclFOLHA_CADASTRAL_ENDERECO.pas',
  uclFOLHA_CADASTRAL_CONJUGE in 'source\model\Persistencia\uclFOLHA_CADASTRAL_CONJUGE.pas',
  uclFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS in 'source\model\Persistencia\uclFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.pas',
  fLevantamentoBenfeitoriasReprodutivas in 'source\view\Benfeitorias\fLevantamentoBenfeitoriasReprodutivas.pas' {frmBenfeitoriasReprodutivas},
  uDmBenfeitorias in 'source\model\Benfeitorias\Dados\uDmBenfeitorias.pas' {dtmBenfeitorias: TDataModule},
  uManipuladorBenfeitoriasReprodutivas in 'source\model\Benfeitorias\manipulador\uManipuladorBenfeitoriasReprodutivas.pas',
  uManipuladorBenfeitorias in 'source\model\Benfeitorias\manipulador\uManipuladorBenfeitorias.pas',
  fAvaliacaoTerras in 'source\view\Benfeitorias\fAvaliacaoTerras.pas' {frmAvaliacaoTerras},
  uManipuladorAvaliacaoTerras in 'source\model\Benfeitorias\manipulador\uManipuladorAvaliacaoTerras.pas',
  uDadosComum in 'source\model\Comum\uDadosComum.pas';

{$R *.res}

begin
  Application.Initialize;
//  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmBenfeitoriasReprodutivas, frmBenfeitoriasReprodutivas);
  Application.CreateForm(TdtmBenfeitorias, dtmBenfeitorias);
  Application.CreateForm(TfrmAvaliacaoTerras, frmAvaliacaoTerras);
  Application.Run;
end.
