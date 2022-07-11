unit uConsultaSQL;

interface

uses
  FireDAC.Comp.Client, System.Classes, uObjetoRegra;

type
  TConsultaSQL = class (TFDQuery)
  public
    constructor Create(Owner: TComponent); overload; override;
    constructor Create(Conexao: TFDconnection); reintroduce; overload;
    destructor Destroy; override;
  end;

implementation

{ TConsultaSQL }

constructor TConsultaSQL.Create(Owner: TComponent);
begin
  inherited Create(Owner);
end;

constructor TConsultaSQL.Create(Conexao: TFDconnection);
begin
  Create(Owner);
  Self.Connection := Conexao;
end;

destructor TConsultaSQL.Destroy;
begin
  inherited;
end;

end.
