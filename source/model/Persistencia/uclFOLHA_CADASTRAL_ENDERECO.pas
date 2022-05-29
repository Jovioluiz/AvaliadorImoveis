unit uclFOLHA_CADASTRAL_ENDERECO;

interface

uses
 FireDAC.Stan.Intf, FireDAC.Stan.Option, 
 FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,   
 FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt,  
 FireDAC.Comp.DataSet, Data.DB, uPersistencia;

type TFOLHA_CADASTRAL_ENDERECO = class(TPersistencia)

  private 
    Fbairro: String;
    Fcd_cidade: Integer;
    Fdt_atz: TDateTime;
    Fid_folha_cadastral: Int64;
    Fid_geral: Int64;
    Flogradouro: String;
    Fnumero: String;
    procedure Setbairro(const Value: String);
    procedure Setcd_cidade(const Value: Integer);
    procedure Setdt_atz(const Value: TDateTime);
    procedure Setid_folha_cadastral(const Value: Int64);
    procedure Setid_geral(const Value: Int64);
    procedure Setlogradouro(const Value: String);
    procedure Setnumero(const Value: String);
    function GetIdGeral: Int64;
  public 
   //Metodo Pesquisar pela chave primaria
    function Pesquisar(id_geral: Int64): Boolean; 
    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure Persistir(Novo: Boolean); override;

    property bairro: String read Fbairro write Setbairro;
    property cd_cidade: Integer read Fcd_cidade write Setcd_cidade;
    property dt_atz: TDateTime read Fdt_atz write Setdt_atz;
    property id_folha_cadastral: Int64 read Fid_folha_cadastral write Setid_folha_cadastral;
    property id_geral: Int64 read Fid_geral write Setid_geral;
    property logradouro: String read Flogradouro write Setlogradouro;
    property numero: String read Fnumero write Setnumero;

end;

implementation

uses
    System.SysUtils, Vcl.Dialogs;

{ TFOLHA_CADASTRAL_ENDERECO }

function TFOLHA_CADASTRAL_ENDERECO.GetIdGeral: Int64; 
const 
  SQL = 'select ' +           
        '* '+                  
        'from func_id_geral();' ;  
var                                    
  qry: TFDQuery;                       
begin                                  
  qry := TFDQuery.Create(nil);        
  qry.Connection := Conexao;
                                     
  try                                
    qry.Open(SQL);                   
    Result := qry.FieldByName('func_id_geral').AsLargeInt; 
  finally          
    qry.Free;  
  end;         
end; 


procedure TFOLHA_CADASTRAL_ENDERECO.Inserir;
const
   SQL = 
   'INSERT INTO ' +
   'folha_cadastral_endereco(' +
   'bairro, ' +
   'cd_cidade, ' +
   'dt_atz, ' +
   'id_folha_cadastral, ' +
   'id_geral, ' +
   'logradouro, ' +
   'numero)' +
   'VALUES (' +
   ':bairro, ' +
   ':cd_cidade, ' +
   ':dt_atz, ' +
   ':id_folha_cadastral, ' +
   ':id_geral, ' +
   ':logradouro, ' +
   ':numero)';
var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := Conexao;
  query.SQL.Add(SQL);
  try
    try
      query.ParamByName('bairro').AsString := Fbairro;
      query.ParamByName('cd_cidade').AsInteger := Fcd_cidade;
      query.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      query.ParamByName('id_folha_cadastral').AsLargeInt := Fid_folha_cadastral;
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ParamByName('logradouro').AsString := Flogradouro;
      query.ParamByName('numero').AsString := Fnumero;
      query.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral_endereco' +  E.Message);
      end;
    end;
  finally
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL_ENDERECO.Atualizar;
const
   SQL = 
   'UPDATE ' +
   'folha_cadastral_endereco ' +
'SET ' +
   'bairro = :bairro, ' +
   'cd_cidade = :cd_cidade, ' +
   'dt_atz = :dt_atz, ' +
   'id_folha_cadastral = :id_folha_cadastral, ' +
   'id_geral = :id_geral, ' +
   'logradouro = :logradouro, ' +
   'numero = :numero ' +
'WHERE ' +
'id_geral = :id_geral';

var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := Conexao;
  query.SQL.Add(SQL);
  try
    try
      query.ParamByName('bairro').AsString := Fbairro;
      query.ParamByName('cd_cidade').AsInteger := Fcd_cidade;
      query.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      query.ParamByName('id_folha_cadastral').AsLargeInt := Fid_folha_cadastral;
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ParamByName('logradouro').AsString := Flogradouro;
      query.ParamByName('numero').AsString := Fnumero;
      query.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral_endereco' +  E.Message);
      end;
    end;
  finally
    query.Free;
  end;
end;

function TFOLHA_CADASTRAL_ENDERECO.Pesquisar(id_geral: Int64): Boolean;
const
    SQL = 
   'SELECT * ' +
   ' FROM ' +
   'folha_cadastral_endereco' +
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
  finally
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL_ENDERECO.Persistir(Novo: Boolean);
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

procedure TFOLHA_CADASTRAL_ENDERECO.Excluir;
const
   SQL = 
   'DELETE ' +
   ' FROM ' +
   'folha_cadastral_endereco' +
   ' WHERE ' +
   'id_geral = :id_geral';
var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := Conexao;
  query.SQL.Add(SQL);
  try
    try
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao excluir os dados na tabela folha_cadastral_endereco' +  E.Message);
      end;
    end;
  finally
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL_ENDERECO.Setbairro(const Value: String);
begin
  Fbairro := Value;
end;

procedure TFOLHA_CADASTRAL_ENDERECO.Setcd_cidade(const Value: Integer);
begin
  Fcd_cidade := Value;
end;

procedure TFOLHA_CADASTRAL_ENDERECO.Setdt_atz(const Value: TDateTime);
begin
  Fdt_atz := Value;
end;

procedure TFOLHA_CADASTRAL_ENDERECO.Setid_folha_cadastral(const Value: Int64);
begin
  Fid_folha_cadastral := Value;
end;

procedure TFOLHA_CADASTRAL_ENDERECO.Setid_geral(const Value: Int64);
begin
  Fid_geral := Value;
end;

procedure TFOLHA_CADASTRAL_ENDERECO.Setlogradouro(const Value: String);
begin
  Flogradouro := Value;
end;

procedure TFOLHA_CADASTRAL_ENDERECO.Setnumero(const Value: String);
begin
  Fnumero := Value;
end;

end.