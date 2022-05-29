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
      constructor Create;
      destructor Destroy; override;
      function GetConexao: TFDConnection;
      property Conexao: TFDConnection read GetConexao write FConexao;
  end;

implementation

{ TObJetoRegra }

constructor TObjetoRegra.Create;
begin
  if Assigned(FConexao) then
    Exit;

  if not Assigned(FDMConexao) then
    FDMConexao := TdmConexao.Create(nil);
  FConexao := FDMConexao.GetConexao;
end;

destructor TObjetoRegra.Destroy;
begin
  inherited;
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
