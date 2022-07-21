unit uPersistencia;

interface

uses
  FireDAC.Comp.Client, uObjetoRegra;

type
  TPersistencia = class(TObjetoRegra)
    private
//      FConexaoBanco: TFDConnection;
    public
      constructor Create(ConexaoBanco: TFDConnection); override;
      procedure Inserir; virtual; abstract;
      procedure Atualizar; virtual; abstract;
      procedure Excluir; virtual; abstract;
      procedure Persistir(Novo: Boolean); virtual; abstract;
      function GetIdGeral: Int64;
      destructor Destroy; override;

//      property ConexaoBanco: TFDConnection read FConexaoBanco write FConexaoBanco;
  end;

implementation

uses
  uConsultaSQL;

{ TPersistencia }

constructor TPersistencia.Create(ConexaoBanco: TFDConnection);
begin
  inherited Create(ConexaoBanco);
//  if Assigned(ConexaoBanco) then
//    Conexao := ConexaoBanco;
end;

destructor TPersistencia.Destroy;
begin
  inherited;
end;

function TPersistencia.GetIdGeral: Int64;
const
  SQL = 'select ' +
        '* '+
        'from func_id_geral()';
var
  qry: TConsultaSQL;
begin
  qry := TConsultaSQL.Create(Conexao, SQL);

  try
    qry.Open();
    Result := qry.FieldByName('func_id_geral').AsLargeInt;
  finally
    qry.Free;
  end;
end;

end.
