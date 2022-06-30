unit uDmBenfeitorias;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TdtmBenfeitorias = class(TDataModule)
    dsLFBenfeitoriaReprodutiva: TDataSource;
    cdsLFBenfeitoriaReprodutiva: TClientDataSet;
    dsLFBenfeitorias: TDataSource;
    cdsLFBenfeitorias: TClientDataSet;
    cdsLFBenfeitoriaReprodutivaid_geral: TLargeintField;
    cdsLFBenfeitoriaReprodutivaid_levantamento_fisico_benfeitorias: TLargeintField;
    cdsLFBenfeitoriaReprodutivacd_benfeitoria: TIntegerField;
    cdsLFBenfeitoriaReprodutivaun_medida: TStringField;
    cdsLFBenfeitoriaReprodutivaquantidade: TFloatField;
    cdsLFBenfeitoriaReprodutivaidade: TFloatField;
    cdsLFBenfeitoriaReprodutivatp_cultivo: TIntegerField;
    dsClasseTerra: TDataSource;
    cdsClasseTerra: TClientDataSet;
    cdsClasseTerrafator: TFloatField;
    cdsClasseTerraclasse: TStringField;
    cdsClasseTerraarea_ha: TFloatField;
    cdsClasseTerrafa: TFloatField;
    cdsClasseTerrafm: TFloatField;
    cdsClasseTerrafd: TFloatField;
    cdsClasseTerraarea_total: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmBenfeitorias: TdtmBenfeitorias;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
