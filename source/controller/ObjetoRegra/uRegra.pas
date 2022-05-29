unit uRegra;

interface

uses
  uObjetoRegra, uDmFolhaCadastral;

type
  TRegra = class(TObjetoRegra)
  private
    FIdFolhaCadastral: Int64;
    FDados: TDmFolhaCadastral;
    procedure SetIdFolhaCadastral(const Value: Int64);
  public
    constructor Create;
    destructor Destroy; override;
    property IdFolhaCadastral: Int64 read FIdFolhaCadastral write SetIdFolhaCadastral;
    property Dados: TDmFolhaCadastral read FDados write FDados;
end;

implementation

{ TRegra }

constructor TRegra.Create;
begin
  FIdFolhaCadastral := 0;
  FDados := TDmFolhaCadastral.Create(nil);
end;

destructor TRegra.Destroy;
begin
  FDados.Free;
  inherited;
end;

procedure TRegra.SetIdFolhaCadastral(const Value: Int64);
begin
  FIdFolhaCadastral := Value;
end;

end.
