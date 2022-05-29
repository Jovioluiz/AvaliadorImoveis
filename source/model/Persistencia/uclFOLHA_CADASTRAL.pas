unit uclFOLHA_CADASTRAL;

interface

uses
 FireDAC.Stan.Intf, FireDAC.Stan.Option, 
 FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,   
 FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt,  
 FireDAC.Comp.DataSet, Data.DB, uPersistencia;

type TFOLHA_CADASTRAL = class(TPersistencia)

  private 
    Fcd_cidade_naturalidade: Integer;
    Fcd_municipio: Integer;
    Fcpf_cnpj: String;
    Fdt_atz: TDateTime;
    Fdt_cadastro: TDate;
    Fdt_nascimento: TDate;
    Femail: String;
    Fid_geral: Int64;
    Fie_rg: String;
    Flocalidade: String;
    Fnm_cadastrador: String;
    Fnome: String;
    Fnome_mae: String;
    Fnome_pai: String;
    Fcd_obra: Integer;
    Fobs: String;
    Fprofissao: String;
    Fsabe_assinar: Boolean;
    Fsequencia: String;
    Ftp_documento: String;
    Ftp_pessoa: String;
    Forgao_expedidor: String;
    Ffolha_proprietario: Boolean;
    procedure Setcd_cidade_naturalidade(const Value: Integer);
    procedure Setcd_municipio(const Value: Integer);
    procedure Setcpf_cnpj(const Value: String);
    procedure Setdt_atz(const Value: TDateTime);
    procedure Setdt_cadastro(const Value: TDate);
    procedure Setdt_nascimento(const Value: TDate);
    procedure Setemail(const Value: String);
    procedure Setid_geral(const Value: Int64);
    procedure Setie_rg(const Value: String);
    procedure Setlocalidade(const Value: String);
    procedure Setnm_cadastrador(const Value: String);
    procedure Setnome(const Value: String);
    procedure Setnome_mae(const Value: String);
    procedure Setnome_pai(const Value: String);
    procedure Setcd_obra(const Value: Integer);
    procedure Setobs(const Value: String);
    procedure Setprofissao(const Value: String);
    procedure Setsabe_assinar(const Value: Boolean);
    procedure Setsequencia(const Value: String);
    procedure Settp_documento(const Value: String);
    procedure Settp_pessoa(const Value: String);
    procedure Setorgao_expedidor(const Value: string);
    procedure Setfolha_proprietario(const Value: Boolean);

  public 
   //Metodo Pesquisar pela chave primaria
    function Pesquisar(id_geral: Int64): Boolean; 
    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure Persistir(Novo: Boolean); override;

    property cd_cidade_naturalidade: Integer read Fcd_cidade_naturalidade write Setcd_cidade_naturalidade;
    property cd_municipio: Integer read Fcd_municipio write Setcd_municipio;
    property cpf_cnpj: String read Fcpf_cnpj write Setcpf_cnpj;
    property dt_atz: TDateTime read Fdt_atz write Setdt_atz;
    property dt_cadastro: TDate read Fdt_cadastro write Setdt_cadastro;
    property dt_nascimento: TDate read Fdt_nascimento write Setdt_nascimento;
    property email: String read Femail write Setemail;
    property id_geral: Int64 read Fid_geral write Setid_geral;
    property ie_rg: String read Fie_rg write Setie_rg;
    property localidade: String read Flocalidade write Setlocalidade;
    property nm_cadastrador: String read Fnm_cadastrador write Setnm_cadastrador;
    property nome: String read Fnome write Setnome;
    property nome_mae: String read Fnome_mae write Setnome_mae;
    property nome_pai: String read Fnome_pai write Setnome_pai;
    property cd_obra: Integer read Fcd_obra write Setcd_obra;
    property obs: String read Fobs write Setobs;
    property profissao: String read Fprofissao write Setprofissao;
    property sabe_assinar: Boolean read Fsabe_assinar write Setsabe_assinar;
    property sequencia: String read Fsequencia write Setsequencia;
    property tp_documento: String read Ftp_documento write Settp_documento;
    property tp_pessoa: String read Ftp_pessoa write Settp_pessoa;
    property orgao_expedidor: String read Forgao_expedidor write Setorgao_expedidor;
    property folha_proprietario: Boolean read Ffolha_proprietario write Setfolha_proprietario;

end;

implementation

uses
    System.SysUtils, Vcl.Dialogs;

{ TFOLHA_CADASTRAL }


procedure TFOLHA_CADASTRAL.Inserir;
const
   SQL = 
   'INSERT INTO ' +
   'folha_cadastral(' +
   'cd_cidade_naturalidade, ' +
   'cd_municipio, ' +
   'cpf_cnpj, ' +
   'dt_atz, ' +
   'dt_cadastro, ' +
   'dt_nascimento, ' +
   'email, ' +
   'id_geral, ' +
   'ie_rg, ' +
   'localidade, ' +
   'nm_cadastrador, ' +
   'nome, ' +
   'nome_mae, ' +
   'nome_pai, ' +
   'cd_obra, ' +
   'obs, ' +
   'profissao, ' +
   'sabe_assinar, ' +
   'sequencia, ' +
   'tp_documento, ' +
   'tp_pessoa, ' +
   'orgao_expedidor, ' +
   'folha_proprietario)' +
   'VALUES (' +
   ':cd_cidade_naturalidade, ' +
   ':cd_municipio, ' +
   ':cpf_cnpj, ' +
   ':dt_atz, ' +
   ':dt_cadastro, ' +
   ':dt_nascimento, ' +
   ':email, ' +
   ':id_geral, ' +
   ':ie_rg, ' +
   ':localidade, ' +
   ':nm_cadastrador, ' +
   ':nome, ' +
   ':nome_mae, ' +
   ':nome_pai, ' +
   ':cd_obra, ' +
   ':obs, ' +
   ':profissao, ' +
   ':sabe_assinar, ' +
   ':sequencia, ' +
   ':tp_documento, ' +
   ':tp_pessoa,'+
   ':orgao_expedidor, ' +
   ':folha_proprietario)';
var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := Conexao;
//  query.Connection.StartTransaction;
  query.SQL.Add(SQL);
  try
    try
      query.ParamByName('cd_cidade_naturalidade').AsInteger := Fcd_cidade_naturalidade;
      query.ParamByName('cd_municipio').AsInteger := Fcd_municipio;
      query.ParamByName('cpf_cnpj').AsString := Fcpf_cnpj;
      query.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      query.ParamByName('dt_cadastro').AsDate := Fdt_cadastro;
      query.ParamByName('dt_nascimento').AsDate := Fdt_nascimento;
      query.ParamByName('email').AsString := Femail;
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ParamByName('ie_rg').AsString := Fie_rg;
      query.ParamByName('localidade').AsString := Flocalidade;
      query.ParamByName('nm_cadastrador').AsString := Fnm_cadastrador;
      query.ParamByName('nome').AsString := Fnome;
      query.ParamByName('nome_mae').AsString := Fnome_mae;
      query.ParamByName('nome_pai').AsString := Fnome_pai;
      query.ParamByName('cd_obra').AsInteger := Fcd_obra;
      query.ParamByName('obs').AsString := Fobs;
      query.ParamByName('profissao').AsString := Fprofissao;
      query.ParamByName('sabe_assinar').AsBoolean := Fsabe_assinar;
      query.ParamByName('sequencia').AsString := Fsequencia;
      query.ParamByName('tp_documento').AsString := Ftp_documento;
      query.ParamByName('tp_pessoa').AsString := Ftp_pessoa;
      query.ParamByName('orgao_expedidor').AsString := Forgao_expedidor;
      query.ParamByName('folha_proprietario').AsBoolean := Ffolha_proprietario;

      query.ExecSQL;
//      query.Connection.Commit;
    except
    on E:exception do
      begin
//        query.Connection.Rollback;
        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral' +  E.Message);
      end;
    end;
  finally
//    query.Connection.Rollback;
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL.Atualizar;
const
   SQL = 
   'UPDATE ' +
   'folha_cadastral ' +
'SET ' +
   'cd_cidade_naturalidade = :cd_cidade_naturalidade, ' +
   'cd_municipio = :cd_municipio, ' +
   'cpf_cnpj = :cpf_cnpj, ' +
   'dt_atz = :dt_atz, ' +
   'dt_cadastro = :dt_cadastro, ' +
   'dt_nascimento = :dt_nascimento, ' +
   'email = :email, ' +
   'id_geral = :id_geral, ' +
   'ie_rg = :ie_rg, ' +
   'localidade = :localidade, ' +
   'nm_cadastrador = :nm_cadastrador, ' +
   'nome = :nome, ' +
   'nome_mae = :nome_mae, ' +
   'nome_pai = :nome_pai, ' +
   'cd_obra = :cd_obra, ' +
   'obs = :obs, ' +
   'profissao = :profissao, ' +
   'sabe_assinar = :sabe_assinar, ' +
   'sequencia = :sequencia, ' +
   'tp_documento = :tp_documento, ' +
   'tp_pessoa = :tp_pessoa, ' +
   'orgao_expedidor = :orgao_expedidor, ' +
   'folha_proprietario = :folha_proprietario ' +
'WHERE ' +
'id_geral = :id_geral';

var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := Conexao;
//  query.Connection.StartTransaction;
  query.SQL.Add(SQL);
  try
    try
      query.ParamByName('cd_cidade_naturalidade').AsInteger := Fcd_cidade_naturalidade;
      query.ParamByName('cd_municipio').AsInteger := Fcd_municipio;
      query.ParamByName('cpf_cnpj').AsString := Fcpf_cnpj;
      query.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      query.ParamByName('dt_cadastro').AsDate := Fdt_cadastro;
      query.ParamByName('dt_nascimento').AsDate := Fdt_nascimento;
      query.ParamByName('email').AsString := Femail;
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ParamByName('ie_rg').AsString := Fie_rg;
      query.ParamByName('localidade').AsString := Flocalidade;
      query.ParamByName('nm_cadastrador').AsString := Fnm_cadastrador;
      query.ParamByName('nome').AsString := Fnome;
      query.ParamByName('nome_mae').AsString := Fnome_mae;
      query.ParamByName('nome_pai').AsString := Fnome_pai;
      query.ParamByName('cd_obra').AsInteger := Fcd_obra;
      query.ParamByName('obs').AsString := Fobs;
      query.ParamByName('profissao').AsString := Fprofissao;
      query.ParamByName('sabe_assinar').AsBoolean := Fsabe_assinar;
      query.ParamByName('sequencia').AsString := Fsequencia;
      query.ParamByName('tp_documento').AsString := Ftp_documento;
      query.ParamByName('tp_pessoa').AsString := Ftp_pessoa;
      query.ParamByName('orgao_expedidor').AsString := Forgao_expedidor;
      query.ParamByName('folha_proprietario').AsBoolean := Ffolha_proprietario;
      query.ExecSQL;
//      query.Connection.Commit;
    except
    on E:exception do
      begin
//        query.Connection.Rollback;
        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral' +  E.Message);
      end;
    end;
  finally
//    query.Connection.Rollback;
    query.Free;
  end;
end;

function TFOLHA_CADASTRAL.Pesquisar(id_geral: Int64): Boolean;
const
    SQL = 
   'SELECT * ' +
   ' FROM ' +
   'folha_cadastral' +
   ' WHERE ' +
   'id_geral = :id_geral';
var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := Conexao;

  try
    query.Open(SQL, [id_geral]);
    Result := not query.IsEmpty;

    Fcd_cidade_naturalidade := query.FieldByName('cd_cidade_naturalidade').AsInteger;
    Fcd_municipio := query.FieldByName('cd_municipio').AsInteger;
    Fcpf_cnpj := query.FieldByName('cpf_cnpj').AsString;
    Fdt_atz := query.FieldByName('dt_atz').AsDateTime;
    Fdt_cadastro := query.FieldByName('dt_cadastro').AsDateTime;
    Fdt_nascimento := query.FieldByName('dt_nascimento').AsDateTime;
    Femail := query.FieldByName('email').AsString;
    Fid_geral := query.FieldByName('id_geral').AsLargeInt;
    Fie_rg := query.FieldByName('ie_rg').AsString;
    Flocalidade := query.FieldByName('localidade').AsString;
    Fnm_cadastrador := query.FieldByName('nm_cadastrador').AsString;
    Fnome := query.FieldByName('nome').AsString;
    Fnome_mae := query.FieldByName('nome_mae').AsString;
    Fnome_pai := query.FieldByName('nome_pai').AsString;
    Fcd_obra := query.FieldByName('cd_obra').AsInteger;
    Fobs := query.FieldByName('obs').AsString;
    Fprofissao := query.FieldByName('profissao').AsString;
    Fsabe_assinar := query.FieldByName('sabe_assinar').AsBoolean;
    Fsequencia := query.FieldByName('sequencia').AsString;
    Ftp_documento := query.FieldByName('tp_documento').AsString;
    Ftp_pessoa := query.FieldByName('tp_pessoa').AsString;
    Forgao_expedidor := query.FieldByName('orgao_expedidor').AsString;
    Ffolha_proprietario := query.FieldByName('folha_proprietario').AsBoolean;
  finally
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL.Persistir(Novo: Boolean);
begin
  if Novo then
  begin 
  if id_geral = 0 then
    id_geral := GetIdGeral;
   Inserir;
  end
  else 
    Atualizar;
end;

procedure TFOLHA_CADASTRAL.Excluir;
const
   SQL = 
   'DELETE ' +
   ' FROM ' +
   'folha_cadastral' +
   ' WHERE ' +
   'id_geral = :id_geral';
var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := Conexao;
  query.Connection.StartTransaction;
  query.SQL.Add(SQL);
  try
    try
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ExecSQL;
      query.Connection.Commit;
    except
    on E:exception do
      begin
        query.Connection.Rollback;
        raise Exception.Create('Erro ao excluir os dados na tabela folha_cadastral' +  E.Message);
      end;
    end;
  finally
    query.Connection.Rollback;
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL.Setcd_cidade_naturalidade(const Value: Integer);
begin
  Fcd_cidade_naturalidade := Value;
end;

procedure TFOLHA_CADASTRAL.Setcd_municipio(const Value: Integer);
begin
  Fcd_municipio := Value;
end;

procedure TFOLHA_CADASTRAL.Setcpf_cnpj(const Value: String);
begin
  Fcpf_cnpj := Value;
end;

procedure TFOLHA_CADASTRAL.Setdt_atz(const Value: TDateTime);
begin
  Fdt_atz := Value;
end;

procedure TFOLHA_CADASTRAL.Setdt_cadastro(const Value: TDate);
begin
  Fdt_cadastro := Value;
end;

procedure TFOLHA_CADASTRAL.Setdt_nascimento(const Value: TDate);
begin
  Fdt_nascimento := Value;
end;

procedure TFOLHA_CADASTRAL.Setemail(const Value: String);
begin
  Femail := Value;
end;

procedure TFOLHA_CADASTRAL.Setfolha_proprietario(const Value: Boolean);
begin
  Ffolha_proprietario := Value;
end;

procedure TFOLHA_CADASTRAL.Setid_geral(const Value: Int64);
begin
  Fid_geral := Value;
end;

procedure TFOLHA_CADASTRAL.Setie_rg(const Value: String);
begin
  Fie_rg := Value;
end;

procedure TFOLHA_CADASTRAL.Setlocalidade(const Value: String);
begin
  Flocalidade := Value;
end;

procedure TFOLHA_CADASTRAL.Setnm_cadastrador(const Value: String);
begin
  Fnm_cadastrador := Value;
end;

procedure TFOLHA_CADASTRAL.Setnome(const Value: String);
begin
  Fnome := Value;
end;

procedure TFOLHA_CADASTRAL.Setnome_mae(const Value: String);
begin
  Fnome_mae := Value;
end;

procedure TFOLHA_CADASTRAL.Setnome_pai(const Value: String);
begin
  Fnome_pai := Value;
end;

procedure TFOLHA_CADASTRAL.Setcd_obra(const Value: Integer);
begin
  Fcd_obra := Value;
end;

procedure TFOLHA_CADASTRAL.Setobs(const Value: String);
begin
  Fobs := Value;
end;

procedure TFOLHA_CADASTRAL.Setorgao_expedidor(const Value: string);
begin
  Forgao_expedidor := Value;
end;

procedure TFOLHA_CADASTRAL.Setprofissao(const Value: String);
begin
  Fprofissao := Value;
end;

procedure TFOLHA_CADASTRAL.Setsabe_assinar(const Value: Boolean);
begin
  Fsabe_assinar := Value;
end;

procedure TFOLHA_CADASTRAL.Setsequencia(const Value: String);
begin
  Fsequencia := Value;
end;

procedure TFOLHA_CADASTRAL.Settp_documento(const Value: String);
begin
  Ftp_documento := Value;
end;

procedure TFOLHA_CADASTRAL.Settp_pessoa(const Value: String);
begin
  Ftp_pessoa := Value;
end;

end.