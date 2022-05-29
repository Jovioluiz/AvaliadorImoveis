unit uclCIDADE;

interface

uses
 FireDac.Stan.Param, Data.DB, uPersistencia, uConsultaSQL;

type TCIDADE = class(TPersistencia) 

  private 
    Fcd_cidade: Integer;
    Fcd_ibge: Integer;
    Fcd_pais: Integer;
    Fcep: String;
    Fdt_atz: TDateTime;
    Fnm_cidade: String;
    Fuf: String;
    procedure Setcd_cidade(const Value: Integer);
    procedure Setcd_ibge(const Value: Integer);
    procedure Setcd_pais(const Value: Integer);
    procedure Setcep(const Value: String);
    procedure Setdt_atz(const Value: TDateTime);
    procedure Setnm_cidade(const Value: String);
    procedure Setuf(const Value: String);
  public 
   //Metodo Pesquisar pela chave primaria
    function Pesquisar(cd_cidade: Integer): Boolean; 
    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure Persistir(Novo: Boolean); override;

    property cd_cidade: Integer read Fcd_cidade write Setcd_cidade;
    property cd_ibge: Integer read Fcd_ibge write Setcd_ibge;
    property cd_pais: Integer read Fcd_pais write Setcd_pais;
    property cep: String read Fcep write Setcep;
    property dt_atz: TDateTime read Fdt_atz write Setdt_atz;
    property nm_cidade: String read Fnm_cidade write Setnm_cidade;
    property uf: String read Fuf write Setuf;

end;

implementation

uses
    System.SysUtils, Vcl.Dialogs;

{ TCIDADE }

procedure TCIDADE.Inserir;
procedure TCIDADE.Atualizar;
function TCIDADE.Pesquisar(cd_cidade: Integer): Boolean;

procedure TCIDADE.Excluir;
procedure TCIDADE.Setcd_cidade(const Value: Integer);