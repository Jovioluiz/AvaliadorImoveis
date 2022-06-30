unit uRegra;

interface

uses
  uObjetoRegra, uDmFolhaCadastral;

type
  TRegra = class(TObjetoRegra)
  private
    FIdFolhaCadastral: Int64;
    procedure SetIdFolhaCadastral(const Value: Int64);
  public
    constructor Create;
    destructor Destroy; override;
    property IdFolhaCadastral: Int64 read FIdFolhaCadastral write SetIdFolhaCadastral;
end;

implementation

{ TRegra }

constructor TRegra.Create;
begin
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
