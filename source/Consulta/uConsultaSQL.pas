unit uConsultaSQL;

interface

uses
  FireDAC.Comp.Client, System.Classes, uObjetoRegra;

type
  TConsultaSQL = class (TFDQuery)
  published
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{ TConsultaSQL }

constructor TConsultaSQL.Create(Owner: TComponent);
begin
  inherited Create(Owner);
end;

destructor TConsultaSQL.Destroy;
begin
  inherited;
end;

end.
