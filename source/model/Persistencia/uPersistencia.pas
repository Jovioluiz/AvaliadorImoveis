unit uPersistencia;

interface

uses
  FireDAC.Comp.Client, uObjetoRegra;

type
  TPersistencia = class(TObjetoRegra)
    private
//      FConexaoBanco: TFDConnection;
    public
      constructor Create; overload;
      constructor Create(ConexaoBanco: TFDConnection); overload;
      procedure Inserir; virtual; abstract;
      procedure Atualizar; virtual; abstract;
      procedure Excluir; virtual; abstract;
      procedure Persistir(Novo: Boolean); virtual; abstract;
      function GetIdGeral: Int64;
      destructor Destroy; override;

//      property ConexaoBanco: TFDConnection read FConexaoBanco write FConexaoBanco;
  end;

implementation

{ TPersistencia }

constructor TPersistencia.Create;
begin
  inherited;
end;

constructor TPersistencia.Create(ConexaoBanco: TFDConnection);
begin
  if Assigned(ConexaoBanco) then
    Conexao := ConexaoBanco;
end;

destructor TPersistencia.Destroy;
begin
  inherited;
end;

function TPersistencia.GetIdGeral: Int64;
const
  SQL = 'select ' +
        '* '+
        'from func_id_geral();' ;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  qry.Connection := Conexao;

  try
    qry.Open(SQL);
    Result := qry.FieldByName('func_id_geral').AsLargeInt;
  finally
    qry.Free;
  end;
end;

end.
