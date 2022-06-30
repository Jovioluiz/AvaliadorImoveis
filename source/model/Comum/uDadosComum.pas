unit uDadosComum;

interface

uses
  uRegra;

type
  TDadosComum = class(TRegra)
  private

  public
    function GetObra(CodObra: Integer): string;
    function GetNomeCidade(CodCidade: Integer): string;
    function GetUF(CodCidade: Integer): string;
  end;

implementation

uses
  uConsultaSQL;

{ TDadosComum }

function TDadosComum.GetObra(CodObra: Integer): string;
const
  SQL = ' SELECT ' +
        ' 	concat(sigla_obra, '' - '', nm_obra) AS nm_obra ' +
        ' FROM ' +
        ' 	obras ' +
        ' WHERE ' +
        ' 	cd_obra = :cd_obra ';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(nil);
  consulta.Connection := Conexao;

  try
    consulta.Open(SQL, [CodObra]);
    Result := consulta.FieldByName('nm_obra').AsString;
  finally
    consulta.Free;
  end;
end;

function TDadosComum.GetNomeCidade(CodCidade: Integer): string;
const
  SQL = ' SELECT ' +
        ' 	nm_cidade ' +
        ' FROM ' +
        ' 	cidade ' +
        ' WHERE ' +
        ' 	cd_cidade = :cd_cidade ';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(nil);
  consulta.Connection := Conexao;

  try
    consulta.Open(SQL, [CodCidade]);
    Result := consulta.FieldByName('nm_cidade').AsString;
  finally
    consulta.Free;
  end;
end;

function TDadosComum.GetUF(CodCidade: Integer): string;
const
  SQL = 'SELECT ' +
        '	uf   ' +
        'FROM  ' +
        '	cidade c ' +
        'WHERE ' +
        '	cd_cidade = :cd_cidade ';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(nil);
  consulta.Connection := Conexao;

  try
    consulta.Open(SQL, [CodCidade]);
    Result := consulta.FieldByName('uf').AsString;
  finally
    consulta.Free;
  end;
end;

end.
