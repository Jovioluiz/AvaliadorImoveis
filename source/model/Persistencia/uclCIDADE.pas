unit uclCIDADE;

interface

uses
 FireDac.Stan.Param, Data.DB, uPersistencia, uConsultaSQL;

type TCIDADE = class(TPersistencia) 

  private 
    Fcd_cidade: Integer;
    Fcd_ibge: Integer;
    Fcd_pais: Integer;
    Fcep: String;
    Fdt_atz: TDateTime;
    Fnm_cidade: String;
    Fuf: String;
    procedure Setcd_cidade(const Value: Integer);
    procedure Setcd_ibge(const Value: Integer);
    procedure Setcd_pais(const Value: Integer);
    procedure Setcep(const Value: String);
    procedure Setdt_atz(const Value: TDateTime);
    procedure Setnm_cidade(const Value: String);
    procedure Setuf(const Value: String);
  public 
   //Metodo Pesquisar pela chave primaria
    function Pesquisar(cd_cidade: Integer): Boolean; 
    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure Persistir(Novo: Boolean); override;

    property cd_cidade: Integer read Fcd_cidade write Setcd_cidade;
    property cd_ibge: Integer read Fcd_ibge write Setcd_ibge;
    property cd_pais: Integer read Fcd_pais write Setcd_pais;
    property cep: String read Fcep write Setcep;
    property dt_atz: TDateTime read Fdt_atz write Setdt_atz;
    property nm_cidade: String read Fnm_cidade write Setnm_cidade;
    property uf: String read Fuf write Setuf;

end;

implementation

uses
    System.SysUtils, Vcl.Dialogs;

{ TCIDADE }

procedure TCIDADE.Inserir;const   SQL =    'INSERT INTO ' +   'cidade(' +   'cd_cidade, ' +   'cd_ibge, ' +   'cd_pais, ' +   'cep, ' +   'dt_atz, ' +   'nm_cidade, ' +   'uf)' +   'VALUES (' +   ':cd_cidade, ' +   ':cd_ibge, ' +   ':cd_pais, ' +   ':cep, ' +   ':dt_atz, ' +   ':nm_cidade, ' +   ':uf)';var  consulta: TConsultaSQL;begin  consulta := TConsultaSQL.Create(nil);  consulta.Connection := Conexao;  consulta.SQL.Add(SQL);  try    try      consulta.ParamByName('cd_cidade').AsInteger := Fcd_cidade;      consulta.ParamByName('cd_ibge').AsInteger := Fcd_ibge;      consulta.ParamByName('cd_pais').AsInteger := Fcd_pais;      consulta.ParamByName('cep').AsString := Fcep;      consulta.ParamByName('dt_atz').AsDateTime := Fdt_atz;      consulta.ParamByName('nm_cidade').AsString := Fnm_cidade;      consulta.ParamByName('uf').AsString := Fuf;      consulta.ExecSQL;    except    on E:exception do      begin        raise Exception.Create('Erro ao gravar os dados na tabela cidade' +  E.Message);      end;    end;  finally    consulta.Free;  end;end;
procedure TCIDADE.Atualizar;const   SQL =    'UPDATE ' +   'cidade ' +'SET ' +   'cd_cidade = :cd_cidade, ' +   'cd_ibge = :cd_ibge, ' +   'cd_pais = :cd_pais, ' +   'cep = :cep, ' +   'dt_atz = :dt_atz, ' +   'nm_cidade = :nm_cidade, ' +   'uf = :uf ' +'WHERE ' +'cd_cidade = :cd_cidade';var  consulta: TConsultaSQL;begin  consulta := TConsultaSQL.Create(nil);  consulta.Connection := Conexao;  consulta.SQL.Add(SQL);  try    try      consulta.ParamByName('cd_cidade').AsInteger := Fcd_cidade;      consulta.ParamByName('cd_ibge').AsInteger := Fcd_ibge;      consulta.ParamByName('cd_pais').AsInteger := Fcd_pais;      consulta.ParamByName('cep').AsString := Fcep;      consulta.ParamByName('dt_atz').AsDateTime := Fdt_atz;      consulta.ParamByName('nm_cidade').AsString := Fnm_cidade;      consulta.ParamByName('uf').AsString := Fuf;      consulta.ExecSQL;    except    on E:exception do      begin        raise Exception.Create('Erro ao gravar os dados na tabela cidade' +  E.Message);      end;    end;  finally    consulta.Free;  end;end;
function TCIDADE.Pesquisar(cd_cidade: Integer): Boolean;const    SQL =    'SELECT * ' +   ' FROM ' +   'cidade' +   ' WHERE ' +   'cd_cidade = :cd_cidade';var  consulta: TConsultaSQL;begin  consulta := TConsultaSQL.Create(nil);  consulta.Connection := Conexao;  try    consulta.Open(SQL, [cd_cidade]);    Result := not consulta.IsEmpty;    Fcd_cidade := consulta.FieldByName('cd_cidade').AsInteger;    Fcd_ibge := consulta.FieldByName('cd_ibge').AsInteger;    Fcd_pais := consulta.FieldByName('cd_pais').AsInteger;    Fcep := consulta.FieldByName('cep').AsString;    Fdt_atz := consulta.FieldByName('dt_atz').AsDateTime;    Fnm_cidade := consulta.FieldByName('nm_cidade').AsString;    Fuf := consulta.FieldByName('uf').AsString;  finally    consulta.Free;  end;end;

procedure TCIDADE.Excluir;const   SQL =    'DELETE ' +   ' FROM ' +   'cidade' +   ' WHERE ' +   'cd_cidade = :cd_cidade';var  consulta: TConsultaSQL;begin  consulta := TConsultaSQL.Create(nil);  consulta.Connection := Conexao;  consulta.SQL.Add(SQL);  try    try      consulta.ParamByName('cd_cidade').AsInteger := Fcd_cidade;      consulta.ExecSQL;    except    on E:exception do      begin        raise Exception.Create('Erro ao excluir os dados na tabela cidade' +  E.Message);      end;    end;  finally    consulta.Free;  end;end;
procedure TCIDADE.Setcd_cidade(const Value: Integer);begin  Fcd_cidade := Value;end;procedure TCIDADE.Setcd_ibge(const Value: Integer);begin  Fcd_ibge := Value;end;procedure TCIDADE.Setcd_pais(const Value: Integer);begin  Fcd_pais := Value;end;procedure TCIDADE.Setcep(const Value: String);begin  Fcep := Value;end;procedure TCIDADE.Setdt_atz(const Value: TDateTime);begin  Fdt_atz := Value;end;procedure TCIDADE.Setnm_cidade(const Value: String);begin  Fnm_cidade := Value;end;procedure TCIDADE.Setuf(const Value: String);begin  Fuf := Value;end;end.