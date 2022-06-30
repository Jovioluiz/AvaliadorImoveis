unit uManipuladorBenfeitorias;

interface

uses
  uRegra, uDmBenfeitorias;

type

  TParametrosLevantamento = record
    cd_obra,
    cd_proprietario,
    cd_beneficiario: Integer;
    sequencia,
    localizacao: string;
  end;

  TManipuladorBenfeitorias = class(TRegra)

  private
    FDados: TdtmBenfeitorias;
    procedure SetDados(const Value: TdtmBenfeitorias);

  public
    procedure CarregaLevantamento(Parametros: TParametrosLevantamento); virtual; abstract;
    constructor Create;
    destructor Destroy; override;

    property Dados: TdtmBenfeitorias read FDados write SetDados;
  end;

implementation

{ TManipuladorBenfeitorias }

constructor TManipuladorBenfeitorias.Create;
begin
  FDados := TdtmBenfeitorias.Create(nil);
end;

destructor TManipuladorBenfeitorias.Destroy;
begin
  FDados.Free;
  inherited;
end;

procedure TManipuladorBenfeitorias.SetDados(const Value: TdtmBenfeitorias);
begin
  FDados := Value;
end;

end.
