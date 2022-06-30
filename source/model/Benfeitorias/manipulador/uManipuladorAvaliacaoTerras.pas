unit uManipuladorAvaliacaoTerras;

interface

uses
  uRegra, uDmBenfeitorias;

type
  TManipuladorAvaliacaoTerras = class(TRegra)
  private
    FDados: TdtmBenfeitorias;
  public
    constructor Create;
    destructor Destroy; override;
    property Dados: TdtmBenfeitorias read FDados write FDados;

  end;

implementation

{ TManipuladorAvaliacaoTerras }

constructor TManipuladorAvaliacaoTerras.Create;
begin
  FDados := TdtmBenfeitorias.Create(nil);
end;

destructor TManipuladorAvaliacaoTerras.Destroy;
begin
  FDados.Free;
  inherited;
end;

end.
