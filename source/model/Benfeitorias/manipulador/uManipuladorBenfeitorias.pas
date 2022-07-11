unit uManipuladorBenfeitorias;

interface

uses
  uRegra, uDmBenfeitorias;

type

  TAcessibilidade = (taNenhum = -1, taOtima, taMuitoBoa, taBoa, taRegular, taRuim);
  TDistancia = (tdNenhum = -1, tdMuitoProximo, tdProximo, tdDistante, tdMuitoDistante);
  TNivelManejo = (tnmNenhum = -1, tnmAvancado, tnmSemiAvancado, tnmTradicional, tnmPrimitivo, tnmImprodutivo);

  TParametrosBusca = record
    cd_obra: Integer;
    id_fc_proprietario,
    id_fc_beneficiario: Int64;
    sequencia,
    localizacao: string;
  end;

TParametrosLevantamento = record
    cd_obra: Integer;
    id_folha_cadastral_proprietario,
    id_folha_cadastral_beneficiario: Int64;
    sequencia,
    localizacao,
    nr_laudo: string;
    dt_levantamento: TDateTime;
    acessibilidade: TAcessibilidade;
    cd_centro_consumidor: Integer;
    distancia_centro_consumidor: TDistancia;
    nivel_manejo: TNivelManejo;
  end;

  TManipuladorBenfeitorias = class(TRegra)

  private
    FDados: TdtmBenfeitorias;
    procedure SetDados(const Value: TdtmBenfeitorias);

  public
    procedure CarregaLevantamento(Parametros: TParametrosBusca); virtual; abstract;
    function GetNomeBenfeitoria(CodBenfeitoria: string): string; virtual; abstract;
    procedure GravarBenfeitorias; virtual; abstract;
    procedure CarregaDataSetCabecalho(Parametros: TParametrosLevantamento);
    constructor Create;
    destructor Destroy; override;

    property Dados: TdtmBenfeitorias read FDados write SetDados;
  end;

implementation

{ TManipuladorBenfeitorias }

procedure TManipuladorBenfeitorias.CarregaDataSetCabecalho(Parametros: TParametrosLevantamento);
begin
  if FDados.cdsLFBenfeitorias.FieldByName('id_geral').AsLargeInt = 0 then
    FDados.cdsLFBenfeitorias.Append
  else
    FDados.cdsLFBenfeitorias.Edit;

  FDados.cdsLFBenfeitorias.FieldByName('cd_obra').AsInteger := Parametros.cd_obra;
  FDados.cdsLFBenfeitorias.FieldByName('id_folha_cadastral_proprietario').AsLargeInt := Parametros.id_folha_cadastral_proprietario;
  FDados.cdsLFBenfeitorias.FieldByName('id_folha_cadastral_beneficiario').AsLargeInt := Parametros.id_folha_cadastral_beneficiario;
  FDados.cdsLFBenfeitorias.FieldByName('sequencia').AsString := Parametros.sequencia;
  FDados.cdsLFBenfeitorias.FieldByName('localizacao').AsString := Parametros.localizacao;
  FDados.cdsLFBenfeitorias.FieldByName('nr_laudo').AsString := Parametros.nr_laudo;
  FDados.cdsLFBenfeitorias.FieldByName('dt_levantamento').AsDateTime := Parametros.dt_levantamento;
  FDados.cdsLFBenfeitorias.FieldByName('acessibilidade').AsInteger := Ord(Parametros.acessibilidade);
  FDados.cdsLFBenfeitorias.FieldByName('cd_centro_consumidor').AsInteger := Parametros.cd_centro_consumidor;
  FDados.cdsLFBenfeitorias.FieldByName('distancia_centro_consumidor').AsInteger := Ord(Parametros.distancia_centro_consumidor);
  FDados.cdsLFBenfeitorias.FieldByName('nivel_manejo').AsInteger := Ord(Parametros.nivel_manejo);
  FDados.cdsLFBenfeitorias.Post;
end;

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
