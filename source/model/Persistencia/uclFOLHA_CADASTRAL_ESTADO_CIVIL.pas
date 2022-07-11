unit uclFOLHA_CADASTRAL_ESTADO_CIVIL;

interface

uses
 FireDAC.Stan.Intf, FireDAC.Stan.Option, 
 FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,   
 FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt,  
 FireDAC.Comp.DataSet, Data.DB, uPersistencia;

type TFOLHA_CADASTRAL_ESTADO_CIVIL = class(TPersistencia)

  private 
    Fcd_estado_civil: Integer;
    Fdt_atz: TDateTime;
    Fid_folha_cadastral: Int64;
    Fid_geral: Int64;
    procedure Setcd_estado_civil(const Value: Integer);
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
    function Buscar(const NomeCampoFiltro, ValorCampoFiltro: string): Boolean;

    property cd_estado_civil: Integer read Fcd_estado_civil write Setcd_estado_civil;
    property dt_atz: TDateTime read Fdt_atz write Setdt_atz;
    property id_folha_cadastral: Int64 read Fid_folha_cadastral write Setid_folha_cadastral;
    property id_geral: Int64 read Fid_geral write Setid_geral;

end;

implementation

uses
    System.SysUtils, Vcl.Dialogs;

{ TFOLHA_CADASTRAL_ESTADO_CIVIL }

function TFOLHA_CADASTRAL_ESTADO_CIVIL.GetIdGeral: Int64; 
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


procedure TFOLHA_CADASTRAL_ESTADO_CIVIL.Inserir;
const
   SQL = 
   'INSERT INTO ' +
   'folha_cadastral_estado_civil(' +
   'cd_estado_civil, ' +
   'dt_atz, ' +
   'id_folha_cadastral, ' +
   'id_geral)' +
   'VALUES (' +
   ':cd_estado_civil, ' +
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
      query.ParamByName('cd_estado_civil').AsInteger := Fcd_estado_civil;
      query.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      query.ParamByName('id_folha_cadastral').AsLargeInt := Fid_folha_cadastral;
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral_estado_civil' +  E.Message);
      end;
    end;
  finally
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL.Atualizar;
const
   SQL = 
   'UPDATE ' +
   'folha_cadastral_estado_civil ' +
'SET ' +
   'cd_estado_civil = :cd_estado_civil, ' +
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
      query.ParamByName('cd_estado_civil').AsInteger := Fcd_estado_civil;
      query.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      query.ParamByName('id_folha_cadastral').AsLargeInt := Fid_folha_cadastral;
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral_estado_civil' +  E.Message);
      end;
    end;
  finally
    query.Free;
  end;
end;

function TFOLHA_CADASTRAL_ESTADO_CIVIL.Pesquisar(id_geral: Int64): Boolean;
const
    SQL = 
   'SELECT * ' +
   ' FROM ' +
   'folha_cadastral_estado_civil' +
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

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL.Persistir(Novo: Boolean);
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

function TFOLHA_CADASTRAL_ESTADO_CIVIL.Buscar(const NomeCampoFiltro, ValorCampoFiltro: string): Boolean;
const
  SQL = 'select 1 from folha_cadastral_estado_civil ';
var
  query: TFDquery;
begin
  Result := False;
  query := TFDquery.Create(nil);
  query.Connection := Conexao;
  query.SQL.Add(SQL);

  try
    if not NomeCampoFiltro.IsEmpty and not ValorCampoFiltro.IsEmpty then
    begin
      query.SQL.Text := query.SQL.Text + ' where ' + NomeCampoFiltro + ' = ' + ValorCampoFiltro;
      query.Open();
      Result := not query.IsEmpty;
    end;
  finally
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL.Excluir;
const
   SQL = 
   'DELETE ' +
   ' FROM ' +
   'folha_cadastral_estado_civil' +
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
        raise Exception.Create('Erro ao excluir os dados na tabela folha_cadastral_estado_civil' +  E.Message);
      end;
    end;
  finally
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL.Setcd_estado_civil(const Value: Integer);
begin
  Fcd_estado_civil := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL.Setdt_atz(const Value: TDateTime);
begin
  Fdt_atz := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL.Setid_folha_cadastral(const Value: Int64);
begin
  Fid_folha_cadastral := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL.Setid_geral(const Value: Int64);
begin
  Fid_geral := Value;
end;

end.