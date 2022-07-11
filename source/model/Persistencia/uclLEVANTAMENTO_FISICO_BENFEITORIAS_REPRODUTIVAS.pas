unit uclLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS;

interface

uses
 FireDac.Stan.Param, Data.DB, uPersistencia, uConsultaSQL;

type TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS = class(TPersistencia)

  private 
    Fdt_atz: TDateTime;
    Fid_benfeitoria: Integer;
    Fid_geral: Int64;
    Fid_levantamento_fisico_benfeitorias: Int64;
    Fidade: Currency;
    Fpreco: Currency;
    Fquantidade: Currency;
    Ftp_cultivo: Integer;
    Fun_medida: String;
    procedure Setdt_atz(const Value: TDateTime);
    procedure Setid_benfeitoria(const Value: Integer);
    procedure Setid_geral(const Value: Int64);
    procedure Setid_levantamento_fisico_benfeitorias(const Value: Int64);
    procedure Setidade(const Value: Currency);
    procedure Setpreco(const Value: Currency);
    procedure Setquantidade(const Value: Currency);
    procedure Settp_cultivo(const Value: Integer);
    procedure Setun_medida(const Value: String);
  public 
   //Metodo Pesquisar pela chave primaria
    function Pesquisar(id_geral: Int64): Boolean; 
    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure Persistir(Novo: Boolean); override;

    property dt_atz: TDateTime read Fdt_atz write Setdt_atz;
    property id_benfeitoria: Integer read Fid_benfeitoria write Setid_benfeitoria;
    property id_geral: Int64 read Fid_geral write Setid_geral;
    property id_levantamento_fisico_benfeitorias: Int64 read Fid_levantamento_fisico_benfeitorias write Setid_levantamento_fisico_benfeitorias;
    property idade: Currency read Fidade write Setidade;
    property preco: Currency read Fpreco write Setpreco;
    property quantidade: Currency read Fquantidade write Setquantidade;
    property tp_cultivo: Integer read Ftp_cultivo write Settp_cultivo;
    property un_medida: String read Fun_medida write Setun_medida;

end;

implementation

uses
    System.SysUtils, Vcl.Dialogs;

{ TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS }

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Inserir;
const
   SQL = 
   'INSERT INTO ' +
   'levantamento_fisico_benfeitorias_reprodutivas(' +
   'dt_atz, ' +
   'id_benfeitoria, ' +
   'id_geral, ' +
   'id_levantamento_fisico_benfeitorias, ' +
   'idade, ' +
   'preco, ' +
   'quantidade, ' +
   'tp_cultivo, ' +
   'un_medida)' +
   'VALUES (' +
   ':dt_atz, ' +
   ':id_benfeitoria, ' +
   ':id_geral, ' +
   ':id_levantamento_fisico_benfeitorias, ' +
   ':idade, ' +
   ':preco, ' +
   ':quantidade, ' +
   ':tp_cultivo, ' +
   ':un_medida)';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(Conexao);

  try
    try
      consulta.SQL.Add(SQL);
      consulta.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      consulta.ParamByName('id_benfeitoria').AsInteger := Fid_benfeitoria;
      consulta.ParamByName('id_geral').AsLargeInt := Fid_geral;
      consulta.ParamByName('id_levantamento_fisico_benfeitorias').AsLargeInt := Fid_levantamento_fisico_benfeitorias;
      consulta.ParamByName('idade').AsCurrency := Fidade;
      consulta.ParamByName('preco').AsCurrency := Fpreco;
      consulta.ParamByName('quantidade').AsCurrency := Fquantidade;
      consulta.ParamByName('tp_cultivo').AsInteger := Ftp_cultivo;
      consulta.ParamByName('un_medida').AsString := Fun_medida;
      consulta.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao gravar os dados na tabela levantamento_fisico_benfeitorias_reprodutivas' +  E.Message);
      end;
    end;
  finally
    consulta.Free;
  end;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Atualizar;
const
   SQL = 
   'UPDATE ' +
   'levantamento_fisico_benfeitorias_reprodutivas ' +
'SET ' +
   'dt_atz = :dt_atz, ' +
   'id_benfeitoria = :id_benfeitoria, ' +
   'id_geral = :id_geral, ' +
   'id_levantamento_fisico_benfeitorias = :id_levantamento_fisico_benfeitorias, ' +
   'idade = :idade, ' +
   'preco = :preco, ' +
   'quantidade = :quantidade, ' +
   'tp_cultivo = :tp_cultivo, ' +
   'un_medida = :un_medida ' +
'WHERE ' +
'id_geral = :id_geral';

var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(Conexao);

  try
    try
      consulta.SQL.Add(SQL);
      consulta.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      consulta.ParamByName('id_benfeitoria').AsInteger := Fid_benfeitoria;
      consulta.ParamByName('id_geral').AsLargeInt := Fid_geral;
      consulta.ParamByName('id_levantamento_fisico_benfeitorias').AsLargeInt := Fid_levantamento_fisico_benfeitorias;
      consulta.ParamByName('idade').AsCurrency := Fidade;
      consulta.ParamByName('preco').AsCurrency := Fpreco;
      consulta.ParamByName('quantidade').AsCurrency := Fquantidade;
      consulta.ParamByName('tp_cultivo').AsInteger := Ftp_cultivo;
      consulta.ParamByName('un_medida').AsString := Fun_medida;
      consulta.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao gravar os dados na tabela levantamento_fisico_benfeitorias_reprodutivas' +  E.Message);
      end;
    end;
  finally
    consulta.Free;
  end;
end;

function TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Pesquisar(id_geral: Int64): Boolean;
const
    SQL = 
   'SELECT * ' +
   ' FROM ' +
   'levantamento_fisico_benfeitorias_reprodutivas' +
   ' WHERE ' +
   'id_geral = :id_geral';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(Conexao);

  try
    consulta.Open(SQL, [id_geral]);
    Result := not consulta.IsEmpty;
    Fdt_atz := consulta.FieldByName('dt_atz').AsDateTime;
    Fid_benfeitoria := consulta.FieldByName('id_benfeitoria').AsInteger;
    Fid_geral := consulta.FieldByName('id_geral').AsLargeInt;
    Fid_levantamento_fisico_benfeitorias := consulta.FieldByName('id_levantamento_fisico_benfeitorias').AsLargeInt;
    Fidade := consulta.FieldByName('idade').AsCurrency;
    Fpreco := consulta.FieldByName('preco').AsCurrency;
    Fquantidade := consulta.FieldByName('quantidade').AsCurrency;
    Ftp_cultivo := consulta.FieldByName('tp_cultivo').AsInteger;
    Fun_medida := consulta.FieldByName('un_medida').AsString;
  finally
    consulta.Free;
  end;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Persistir(Novo: Boolean);
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

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Excluir;
const
   SQL = 
   'DELETE ' +
   ' FROM ' +
   'levantamento_fisico_benfeitorias_reprodutivas' +
   ' WHERE ' +
   'id_geral = :id_geral';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(Conexao);

  try
    try
      consulta.SQL.Add(SQL);
      consulta.ParamByName('id_geral').AsLargeInt := Fid_geral;
      consulta.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao excluir os dados na tabela levantamento_fisico_benfeitorias_reprodutivas' +  E.Message);
      end;
    end;
  finally
    consulta.Free;
  end;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Setdt_atz(const Value: TDateTime);
begin
  Fdt_atz := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Setid_benfeitoria(const Value: Integer);
begin
  Fid_benfeitoria := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Setid_geral(const Value: Int64);
begin
  Fid_geral := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Setid_levantamento_fisico_benfeitorias(const Value: Int64);
begin
  Fid_levantamento_fisico_benfeitorias := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Setidade(const Value: Currency);
begin
  Fidade := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Setpreco(const Value: Currency);
begin
  Fpreco := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Setquantidade(const Value: Currency);
begin
  Fquantidade := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Settp_cultivo(const Value: Integer);
begin
  Ftp_cultivo := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Setun_medida(const Value: String);
begin
  Fun_medida := Value;
end;

end.