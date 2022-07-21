unit uObjetoRegra;

interface

uses
  FireDAC.Comp.Client, uDMConexao, uObjetoRegraInterface;

type
  TObjetoRegra = class(TInterfacedObject, IObjetoRegraInterface)
    private
      FConexao: TFDConnection;
      FDMConexao: TdmConexao;
    public
      constructor Create(ConexaoBanco: TFDConnection); virtual;
      destructor Destroy; override;
      function GetConexao: TFDConnection;
      property Conexao: TFDConnection read GetConexao write FConexao;
  end;

implementation

{ TObJetoRegra }

constructor TObjetoRegra.Create(ConexaoBanco: TFDConnection);
begin
  FConexao := ConexaoBanco;

  if not Assigned(FDMConexao) then
  begin
    FDMConexao := TdmConexao.Create(nil);
    FConexao := FDMConexao.GetConexao;
  end;
//  FConexao.StartTransaction;
//  FConexao.TxOptions.AutoCommit := False;
end;

destructor TObjetoRegra.Destroy;
begin
  inherited;
  FConexao.Rollback;
end;

function TObjetoRegra.GetConexao: TFDConnection;
begin
  if Assigned(FConexao) then
    Exit(FConexao);

  if not Assigned(FDMConexao) then
    FDMConexao := TdmConexao.Create(nil);
  try
    if not Assigned(FConexao) then
      FConexao := FDMConexao.GetConexao;
    Result := FConexao;
  finally
//    FDMConexao.Free;
  end;
end;

end.
