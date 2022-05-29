unit uDmFolhaCadastral;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TDmFolhaCadastral = class(TDataModule)
    dsFolhaCadastral: TDataSource;
    cdsFolhaCadastral: TClientDataSet;
    dsFolhaCadEstadoCivil: TDataSource;
    cdsFolhaCadEstadoCivil: TClientDataSet;
    dsFolhaCadEstadoCivilCert: TDataSource;
    cdsFolhaCadEstadoCivilCert: TClientDataSet;
    dsFolhaCadastralEndereco: TDataSource;
    cdsFolhaCadastralEndereco: TClientDataSet;
    dsConjuge: TDataSource;
    cdsConjuge: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmFolhaCadastral: TDmFolhaCadastral;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
