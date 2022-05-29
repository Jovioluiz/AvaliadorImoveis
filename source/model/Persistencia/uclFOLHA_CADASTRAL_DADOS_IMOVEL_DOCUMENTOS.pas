unit uclFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS;

interface

uses
 FireDac.Stan.Param, Data.DB, uPersistencia, uConsultaSQL;

type TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS = class(TPersistencia) 

  private 
    Farea_reserva_averbada: Currency;
    Farea_total: Currency;
    Fcd_comarca: Integer;
    Fdt_atz: TDateTime;
    Fid_folha_cadastral_dados_imovel: Int64;
    Fid_geral: Int64;
    Fnr_folha: String;
    Fnr_livro: String;
    Fnr_matricula: String;
    Foficio: Integer;
    procedure Setarea_reserva_averbada(const Value: Currency);
    procedure Setarea_total(const Value: Currency);
    procedure Setcd_comarca(const Value: Integer);
    procedure Setdt_atz(const Value: TDateTime);
    procedure Setid_folha_cadastral_dados_imovel(const Value: Int64);
    procedure Setid_geral(const Value: Int64);
    procedure Setnr_folha(const Value: String);
    procedure Setnr_livro(const Value: String);
    procedure Setnr_matricula(const Value: String);
    procedure Setoficio(const Value: Integer);
  public 
   //Metodo Pesquisar pela chave primaria
    function Pesquisar(id_geral: Int64): Boolean; 
    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure Persistir(Novo: Boolean); override;

    property area_reserva_averbada: Currency read Farea_reserva_averbada write Setarea_reserva_averbada;
    property area_total: Currency read Farea_total write Setarea_total;
    property cd_comarca: Integer read Fcd_comarca write Setcd_comarca;
    property dt_atz: TDateTime read Fdt_atz write Setdt_atz;
    property id_folha_cadastral_dados_imovel: Int64 read Fid_folha_cadastral_dados_imovel write Setid_folha_cadastral_dados_imovel;
    property id_geral: Int64 read Fid_geral write Setid_geral;
    property nr_folha: String read Fnr_folha write Setnr_folha;
    property nr_livro: String read Fnr_livro write Setnr_livro;
    property nr_matricula: String read Fnr_matricula write Setnr_matricula;
    property oficio: Integer read Foficio write Setoficio;

end;

implementation

uses
    System.SysUtils, Vcl.Dialogs;

{ TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS }

procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Inserir;
procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Atualizar;
function TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Pesquisar(id_geral: Int64): Boolean;

procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Persistir(Novo: Boolean);

procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Excluir;
procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Setarea_reserva_averbada(const Value: Currency);