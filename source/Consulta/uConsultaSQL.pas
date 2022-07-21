unit uConsultaSQL;

interface

uses
  FireDAC.Comp.Client, System.Classes, uObjetoRegra;

type
  TConsultaSQL = class (TFDQuery)
  public
    constructor Create(Owner: TComponent); overload; override;
    constructor Create(const Conexao: TFDconnection; const SQL: string = ''); reintroduce; overload;
    destructor Destroy; override;
  end;

implementation

{ TConsultaSQL }

constructor TConsultaSQL.Create(Owner: TComponent);
begin
  inherited Create(Owner);
end;

constructor TConsultaSQL.Create(const Conexao: TFDconnection; const SQL: string = '');
begin
  Create(Owner);
  Self.Connection := Conexao;
  Self.SQL.Text := SQL;
end;

destructor TConsultaSQL.Destroy;
begin
  inherited;
end;

end.
