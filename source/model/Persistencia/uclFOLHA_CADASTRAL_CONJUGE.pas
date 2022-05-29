unit uclFOLHA_CADASTRAL_CONJUGE;

interface

uses
 FireDAC.Stan.Intf, FireDAC.Stan.Option, 
 FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,   
 FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt,  
 FireDAC.Comp.DataSet, Data.DB, uPersistencia;

type TFOLHA_CADASTRAL_CONJUGE = class(TPersistencia)

  private 
    Fdt_atz: TDateTime;
    Fid_folha_cadastral: Int64;
    Fid_geral: Int64;
    procedure Setdt_atz(const Value: TDateTime);
    procedure Setid_folha_cadastral(const Value: Int64);
    procedure Setid_geral(const Value: Int64);
    function GetIdGeral: Int64;
  public 
   //Metodo Pesquisar pela chave primaria
    function Pesquisar(id_geral: Int64): Boolean;
    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure Persistir(Novo: Boolean); override;

    property dt_atz: TDateTime read Fdt_atz write Setdt_atz;
    property id_folha_cadastral: Int64 read Fid_folha_cadastral write Setid_folha_cadastral;
    property id_geral: Int64 read Fid_geral write Setid_geral;

end;

implementation

uses
    System.SysUtils, Vcl.Dialogs;

{ TFOLHA_CADASTRAL_CONJUGE }

function TFOLHA_CADASTRAL_CONJUGE.GetIdGeral: Int64; 
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


procedure TFOLHA_CADASTRAL_CONJUGE.Inserir;
const
   SQL = 
   'INSERT INTO ' +
   'folha_cadastral_conjuge(' +
   'dt_atz, ' +
   'id_folha_cadastral, ' +
   'id_geral)' +
   'VALUES (' +
   ':dt_atz, ' +
   ':id_folha_cadastral, ' +
   ':id_geral)';
var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := Conexao;
  query.SQL.Add(SQL);
  try
    try
      query.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      query.ParamByName('id_folha_cadastral').AsLargeInt := Fid_folha_cadastral;
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral_conjuge' +  E.Message);
      end;
    end;
  finally
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL_CONJUGE.Atualizar;
const
   SQL = 
   'UPDATE ' +
   'folha_cadastral_conjuge ' +
'SET ' +
   'dt_atz = :dt_atz, ' +
   'id_folha_cadastral = :id_folha_cadastral, ' +
   'id_geral = :id_geral ' +
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
      query.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      query.ParamByName('id_folha_cadastral').AsLargeInt := Fid_folha_cadastral;
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral_conjuge' +  E.Message);
      end;
    end;
  finally
    query.Free;
  end;
end;

function TFOLHA_CADASTRAL_CONJUGE.Pesquisar(id_geral: Int64): Boolean;
const
    SQL = 
   'SELECT * ' +
   ' FROM ' +
   'folha_cadastral_conjuge' +
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

procedure TFOLHA_CADASTRAL_CONJUGE.Persistir(Novo: Boolean);
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

procedure TFOLHA_CADASTRAL_CONJUGE.Excluir;
const
   SQL = 
   'DELETE ' +
   ' FROM ' +
   'folha_cadastral_conjuge' +
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
        raise Exception.Create('Erro ao excluir os dados na tabela folha_cadastral_conjuge' +  E.Message);
      end;
    end;
  finally
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL_CONJUGE.Setdt_atz(const Value: TDateTime);
begin
  Fdt_atz := Value;
end;

procedure TFOLHA_CADASTRAL_CONJUGE.Setid_folha_cadastral(const Value: Int64);
begin
  Fid_folha_cadastral := Value;
end;

procedure TFOLHA_CADASTRAL_CONJUGE.Setid_geral(const Value: Int64);
begin
  Fid_geral := Value;
end;

end.