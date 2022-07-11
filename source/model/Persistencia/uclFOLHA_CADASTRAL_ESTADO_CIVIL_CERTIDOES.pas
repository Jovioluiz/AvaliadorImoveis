unit uclFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES;

interface

uses
 FireDAC.Stan.Intf, FireDAC.Stan.Option, 
 FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,   
 FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.Client, FireDAC.DApt,  
 FireDAC.Comp.DataSet, Data.DB, uPersistencia;

type TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES = class(TPersistencia)

  private 
    Fcartorio: String;
    Fdata: TDate;
    Fdt_atz: TDateTime;
    Ffolhas: String;
    Fid_folha_cadastral_estado_civil: Int64;
    Fid_geral: Int64;
    Fjuizo: String;
    Flivro: String;
    Fnr_certidao: String;
    Fnr_sentenca_autos: String;
    Fpossui_pacto_antenupcial: Boolean;
    Funiao_estavel_desde: String;
    procedure Setcartorio(const Value: String);
    procedure Setdata(const Value: TDate);
    procedure Setdt_atz(const Value: TDateTime);
    procedure Setfolhas(const Value: String);
    procedure Setid_folha_cadastral_estado_civil(const Value: Int64);
    procedure Setid_geral(const Value: Int64);
    procedure Setjuizo(const Value: String);
    procedure Setlivro(const Value: String);
    procedure Setnr_certidao(const Value: String);
    procedure Setnr_sentenca_autos(const Value: String);
    procedure Setpossui_pacto_antenupcial(const Value: Boolean);
    procedure Setuniao_estavel_desde(const Value: String);
    function GetIdGeral: Int64;
  public 
   //Metodo Pesquisar pela chave primaria
    function Pesquisar(id_geral: Int64): Boolean;  overload;
   //Metodo Pesquisar pelas unique
    function Pesquisar(const id_folha_cadastral_estado_civil: Int64; const nr_certidao: String; const folhas: String; const livro: String): Boolean;  overload;
    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure Persistir(Novo: Boolean); override;

    property cartorio: String read Fcartorio write Setcartorio;
    property data: TDate read Fdata write Setdata;
    property dt_atz: TDateTime read Fdt_atz write Setdt_atz;
    property folhas: String read Ffolhas write Setfolhas;
    property id_folha_cadastral_estado_civil: Int64 read Fid_folha_cadastral_estado_civil write Setid_folha_cadastral_estado_civil;
    property id_geral: Int64 read Fid_geral write Setid_geral;
    property juizo: String read Fjuizo write Setjuizo;
    property livro: String read Flivro write Setlivro;
    property nr_certidao: String read Fnr_certidao write Setnr_certidao;
    property nr_sentenca_autos: String read Fnr_sentenca_autos write Setnr_sentenca_autos;
    property possui_pacto_antenupcial: Boolean read Fpossui_pacto_antenupcial write Setpossui_pacto_antenupcial;
    property uniao_estavel_desde: String read Funiao_estavel_desde write Setuniao_estavel_desde;

end;

implementation

uses
    System.SysUtils, Vcl.Dialogs;

{ TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES }

function TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.GetIdGeral: Int64; 
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


procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Inserir;
const
   SQL = 
   'INSERT INTO ' +
   'folha_cadastral_estado_civil_certidoes(' +
   'cartorio, ' +
   'data, ' +
   'dt_atz, ' +
   'folhas, ' +
   'id_folha_cadastral_estado_civil, ' +
   'id_geral, ' +
   'juizo, ' +
   'livro, ' +
   'nr_certidao, ' +
   'nr_sentenca_autos, ' +
   'possui_pacto_antenupcial, ' +
   'uniao_estavel_desde)' +
   'VALUES (' +
   ':cartorio, ' +
   ':data, ' +
   ':dt_atz, ' +
   ':folhas, ' +
   ':id_folha_cadastral_estado_civil, ' +
   ':id_geral, ' +
   ':juizo, ' +
   ':livro, ' +
   ':nr_certidao, ' +
   ':nr_sentenca_autos, ' +
   ':possui_pacto_antenupcial, ' +
   ':uniao_estavel_desde)';
var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := Conexao;
//  query.Connection.StartTransaction;
  query.SQL.Add(SQL);
  try
    try
      query.ParamByName('cartorio').AsString := Fcartorio;
      query.ParamByName('data').AsDate := Fdata;
      query.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      query.ParamByName('folhas').AsString := Ffolhas;
      query.ParamByName('id_folha_cadastral_estado_civil').AsLargeInt := Fid_folha_cadastral_estado_civil;
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ParamByName('juizo').AsString := Fjuizo;
      query.ParamByName('livro').AsString := Flivro;
      query.ParamByName('nr_certidao').AsString := Fnr_certidao;
      query.ParamByName('nr_sentenca_autos').AsString := Fnr_sentenca_autos;
      query.ParamByName('possui_pacto_antenupcial').AsBoolean := Fpossui_pacto_antenupcial;
      query.ParamByName('uniao_estavel_desde').AsString := Funiao_estavel_desde;
      query.ExecSQL;
//      query.Connection.Commit;
    except
    on E:exception do
      begin
//        query.Connection.Rollback;
        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral_estado_civil_certidoes' +  E.Message);
      end;
    end;
  finally
//    query.Connection.Rollback;
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Atualizar;
const
   SQL = 
   'UPDATE ' +
   'folha_cadastral_estado_civil_certidoes ' +
'SET ' +
   'cartorio = :cartorio, ' +
   'data = :data, ' +
   'dt_atz = :dt_atz, ' +
   'folhas = :folhas, ' +
   'id_folha_cadastral_estado_civil = :id_folha_cadastral_estado_civil, ' +
   'id_geral = :id_geral, ' +
   'juizo = :juizo, ' +
   'livro = :livro, ' +
   'nr_certidao = :nr_certidao, ' +
   'nr_sentenca_autos = :nr_sentenca_autos, ' +
   'possui_pacto_antenupcial = :possui_pacto_antenupcial, ' +
   'uniao_estavel_desde = :uniao_estavel_desde ' +
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
      query.ParamByName('cartorio').AsString := Fcartorio;
      query.ParamByName('data').AsDate := Fdata;
      query.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      query.ParamByName('folhas').AsString := Ffolhas;
      query.ParamByName('id_folha_cadastral_estado_civil').AsLargeInt := Fid_folha_cadastral_estado_civil;
      query.ParamByName('id_geral').AsLargeInt := Fid_geral;
      query.ParamByName('juizo').AsString := Fjuizo;
      query.ParamByName('livro').AsString := Flivro;
      query.ParamByName('nr_certidao').AsString := Fnr_certidao;
      query.ParamByName('nr_sentenca_autos').AsString := Fnr_sentenca_autos;
      query.ParamByName('possui_pacto_antenupcial').AsBoolean := Fpossui_pacto_antenupcial;
      query.ParamByName('uniao_estavel_desde').AsString := Funiao_estavel_desde;
      query.ExecSQL;
//      query.Connection.Commit;
    except
    on E:exception do
      begin
//        query.Connection.Rollback;
        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral_estado_civil_certidoes' +  E.Message);
      end;
    end;
  finally
//    query.Connection.Rollback;
    query.Free;
  end;
end;

function TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Pesquisar(id_geral: Int64): Boolean;
const
    SQL = 
   'SELECT * ' +
   ' FROM ' +
   'folha_cadastral_estado_civil_certidoes' +
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

function TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Pesquisar(const id_folha_cadastral_estado_civil: Int64; const nr_certidao: String; const folhas: String; const livro: String): Boolean;
const
    SQL = 
   'SELECT * ' +
   ' FROM ' +
   'folha_cadastral_estado_civil_certidoes' +
   ' WHERE ' +
   ' id_folha_cadastral_estado_civil = :id_folha_cadastral_estado_civil AND nr_certidao = :nr_certidao AND folhas = :folhas AND livro = :livro';
var
  query: TFDquery;
begin
  query := TFDquery.Create(nil);
  query.Connection := Conexao;

  try
    query.Open(SQL, [id_folha_cadastral_estado_civil, nr_certidao, folhas, livro]);
    Result := not query.IsEmpty;
  finally
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Persistir(Novo: Boolean);
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

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Excluir;
const
   SQL = 
   'DELETE ' +
   ' FROM ' +
   'folha_cadastral_estado_civil_certidoes' +
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
//      query.Connection.Commit;
    except
    on E:exception do
      begin
//        query.Connection.Rollback;
        raise Exception.Create('Erro ao excluir os dados na tabela folha_cadastral_estado_civil_certidoes' +  E.Message);
      end;
    end;
  finally
//    query.Connection.Rollback;
    query.Free;
  end;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setcartorio(const Value: String);
begin
  Fcartorio := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setdata(const Value: TDate);
begin
  Fdata := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setdt_atz(const Value: TDateTime);
begin
  Fdt_atz := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setfolhas(const Value: String);
begin
  Ffolhas := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setid_folha_cadastral_estado_civil(const Value: Int64);
begin
  Fid_folha_cadastral_estado_civil := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setid_geral(const Value: Int64);
begin
  Fid_geral := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setjuizo(const Value: String);
begin
  Fjuizo := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setlivro(const Value: String);
begin
  Flivro := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setnr_certidao(const Value: String);
begin
  Fnr_certidao := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setnr_sentenca_autos(const Value: String);
begin
  Fnr_sentenca_autos := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setpossui_pacto_antenupcial(const Value: Boolean);
begin
  Fpossui_pacto_antenupcial := Value;
end;

procedure TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Setuniao_estavel_desde(const Value: String);
begin
  Funiao_estavel_desde := Value;
end;

end.