unit uRegra;

interface

uses
  uObjetoRegra, uDmFolhaCadastral, FireDAC.Comp.Client;

type
  TRegra = class(TObjetoRegra)
  private
    FIdFolhaCadastral: Int64;
    procedure SetIdFolhaCadastral(const Value: Int64);
  public
    constructor Create(ConexaoBanco: TFDConnection); override;
    destructor Destroy; override;
    property IdFolhaCadastral: Int64 read FIdFolhaCadastral write SetIdFolhaCadastral;
end;

implementation

{ TRegra }

constructor TRegra.Create(ConexaoBanco: TFDConnection);
begin
  inherited Create(ConexaoBanco);
  FIdFolhaCadastral := 0;
end;

destructor TRegra.Destroy;
begin
  inherited;
end;

procedure TRegra.SetIdFolhaCadastral(const Value: Int64);
begin
  FIdFolhaCadastral := Value;
end;

end.
