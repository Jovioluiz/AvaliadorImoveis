unit uclLEVANTAMENTO_FISICO_BENFEITORIAS;

interface

uses
 FireDac.Stan.Param, Data.DB, uPersistencia, uConsultaSQL;

type TLEVANTAMENTO_FISICO_BENFEITORIAS = class(TPersistencia) 

  private 
    Facessibilidade: Integer;
    Fcd_centro_consumidor: Integer;
    Fcd_obra: Integer;
    Fdistancia_centro_consumidor: Integer;
    Fdt_atz: TDateTime;
    Fdt_levantamento: TDate;
    Fid_folha_cadastral_beneficiario: Int64;
    Fid_folha_cadastral_proprietario: Int64;
    Fid_geral: Int64;
    Flocalizacao: String;
    Fnivel_manejo: Integer;
    Fnr_laudo: String;
    Fsequencia: String;
    procedure Setacessibilidade(const Value: Integer);
    procedure Setcd_centro_consumidor(const Value: Integer);
    procedure Setcd_obra(const Value: Integer);
    procedure Setdistancia_centro_consumidor(const Value: Integer);
    procedure Setdt_atz(const Value: TDateTime);
    procedure Setdt_levantamento(const Value: TDate);
    procedure Setid_folha_cadastral_beneficiario(const Value: Int64);
    procedure Setid_folha_cadastral_proprietario(const Value: Int64);
    procedure Setid_geral(const Value: Int64);
    procedure Setlocalizacao(const Value: String);
    procedure Setnivel_manejo(const Value: Integer);
    procedure Setnr_laudo(const Value: String);
    procedure Setsequencia(const Value: String);
  public 
   //Metodo Pesquisar pela chave primaria
    function Pesquisar(id_geral: Int64): Boolean; 
    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure Persistir(Novo: Boolean); override;

    property acessibilidade: Integer read Facessibilidade write Setacessibilidade;
    property cd_centro_consumidor: Integer read Fcd_centro_consumidor write Setcd_centro_consumidor;
    property cd_obra: Integer read Fcd_obra write Setcd_obra;
    property distancia_centro_consumidor: Integer read Fdistancia_centro_consumidor write Setdistancia_centro_consumidor;
    property dt_atz: TDateTime read Fdt_atz write Setdt_atz;
    property dt_levantamento: TDate read Fdt_levantamento write Setdt_levantamento;
    property id_folha_cadastral_beneficiario: Int64 read Fid_folha_cadastral_beneficiario write Setid_folha_cadastral_beneficiario;
    property id_folha_cadastral_proprietario: Int64 read Fid_folha_cadastral_proprietario write Setid_folha_cadastral_proprietario;
    property id_geral: Int64 read Fid_geral write Setid_geral;
    property localizacao: String read Flocalizacao write Setlocalizacao;
    property nivel_manejo: Integer read Fnivel_manejo write Setnivel_manejo;
    property nr_laudo: String read Fnr_laudo write Setnr_laudo;
    property sequencia: String read Fsequencia write Setsequencia;

end;

implementation

uses
    System.SysUtils, Vcl.Dialogs;

{ TLEVANTAMENTO_FISICO_BENFEITORIAS }

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Inserir;
const
   SQL = 
   'INSERT INTO ' +
   'levantamento_fisico_benfeitorias(' +
   'acessibilidade, ' +
   'cd_centro_consumidor, ' +
   'cd_obra, ' +
   'distancia_centro_consumidor, ' +
   'dt_atz, ' +
   'dt_levantamento, ' +
   'id_folha_cadastral_beneficiario, ' +
   'id_folha_cadastral_proprietario, ' +
   'id_geral, ' +
   'localizacao, ' +
   'nivel_manejo, ' +
   'nr_laudo, ' +
   'sequencia)' +
   'VALUES (' +
   ':acessibilidade, ' +
   ':cd_centro_consumidor, ' +
   ':cd_obra, ' +
   ':distancia_centro_consumidor, ' +
   ':dt_atz, ' +
   ':dt_levantamento, ' +
   ':id_folha_cadastral_beneficiario, ' +
   ':id_folha_cadastral_proprietario, ' +
   ':id_geral, ' +
   ':localizacao, ' +
   ':nivel_manejo, ' +
   ':nr_laudo, ' +
   ':sequencia)';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(Conexao);

  try
    try
      consulta.SQL.Add(SQL);
      consulta.ParamByName('acessibilidade').AsInteger := Facessibilidade;
      consulta.ParamByName('cd_centro_consumidor').AsInteger := Fcd_centro_consumidor;
      consulta.ParamByName('cd_obra').AsInteger := Fcd_obra;
      consulta.ParamByName('distancia_centro_consumidor').AsInteger := Fdistancia_centro_consumidor;
      consulta.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      consulta.ParamByName('dt_levantamento').AsDate := Fdt_levantamento;
      consulta.ParamByName('id_folha_cadastral_beneficiario').AsLargeInt := Fid_folha_cadastral_beneficiario;
      consulta.ParamByName('id_folha_cadastral_proprietario').AsLargeInt := Fid_folha_cadastral_proprietario;
      consulta.ParamByName('id_geral').AsLargeInt := Fid_geral;
      consulta.ParamByName('localizacao').AsString := Flocalizacao;
      consulta.ParamByName('nivel_manejo').AsInteger := Fnivel_manejo;
      consulta.ParamByName('nr_laudo').AsString := Fnr_laudo;
      consulta.ParamByName('sequencia').AsString := Fsequencia;
      consulta.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao gravar os dados na tabela levantamento_fisico_benfeitorias' +  E.Message);
      end;
    end;
  finally
    consulta.Free;
  end;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Atualizar;
const
   SQL = 
   'UPDATE ' +
   'levantamento_fisico_benfeitorias ' +
'SET ' +
   'acessibilidade = :acessibilidade, ' +
   'cd_centro_consumidor = :cd_centro_consumidor, ' +
   'cd_obra = :cd_obra, ' +
   'distancia_centro_consumidor = :distancia_centro_consumidor, ' +
   'dt_atz = :dt_atz, ' +
   'dt_levantamento = :dt_levantamento, ' +
   'id_folha_cadastral_beneficiario = :id_folha_cadastral_beneficiario, ' +
   'id_folha_cadastral_proprietario = :id_folha_cadastral_proprietario, ' +
   'id_geral = :id_geral, ' +
   'localizacao = :localizacao, ' +
   'nivel_manejo = :nivel_manejo, ' +
   'nr_laudo = :nr_laudo, ' +
   'sequencia = :sequencia ' +
'WHERE ' +
'id_geral = :id_geral';

var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(Conexao);
  try
    try
      consulta.SQL.Add(SQL);
      consulta.ParamByName('acessibilidade').AsInteger := Facessibilidade;
      consulta.ParamByName('cd_centro_consumidor').AsInteger := Fcd_centro_consumidor;
      consulta.ParamByName('cd_obra').AsInteger := Fcd_obra;
      consulta.ParamByName('distancia_centro_consumidor').AsInteger := Fdistancia_centro_consumidor;
      consulta.ParamByName('dt_atz').AsDateTime := Fdt_atz;
      consulta.ParamByName('dt_levantamento').AsDate := Fdt_levantamento;
      consulta.ParamByName('id_folha_cadastral_beneficiario').AsLargeInt := Fid_folha_cadastral_beneficiario;
      consulta.ParamByName('id_folha_cadastral_proprietario').AsLargeInt := Fid_folha_cadastral_proprietario;
      consulta.ParamByName('id_geral').AsLargeInt := Fid_geral;
      consulta.ParamByName('localizacao').AsString := Flocalizacao;
      consulta.ParamByName('nivel_manejo').AsInteger := Fnivel_manejo;
      consulta.ParamByName('nr_laudo').AsString := Fnr_laudo;
      consulta.ParamByName('sequencia').AsString := Fsequencia;
      consulta.ExecSQL;
    except
    on E:exception do
      begin
        raise Exception.Create('Erro ao gravar os dados na tabela levantamento_fisico_benfeitorias' +  E.Message);
      end;
    end;
  finally
    consulta.Free;
  end;
end;

function TLEVANTAMENTO_FISICO_BENFEITORIAS.Pesquisar(id_geral: Int64): Boolean;
const
    SQL = 
   'SELECT * ' +
   ' FROM ' +
   'levantamento_fisico_benfeitorias' +
   ' WHERE ' +
   'id_geral = :id_geral';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(Conexao);

  try
    consulta.Open(SQL, [id_geral]);
    Result := not consulta.IsEmpty;
    Facessibilidade := consulta.FieldByName('acessibilidade').AsInteger;
    Fcd_centro_consumidor := consulta.FieldByName('cd_centro_consumidor').AsInteger;
    Fcd_obra := consulta.FieldByName('cd_obra').AsInteger;
    Fdistancia_centro_consumidor := consulta.FieldByName('distancia_centro_consumidor').AsInteger;
    Fdt_atz := consulta.FieldByName('dt_atz').AsDateTime;
    Fdt_levantamento := consulta.FieldByName('dt_levantamento').AsDateTime;
    Fid_folha_cadastral_beneficiario := consulta.FieldByName('id_folha_cadastral_beneficiario').AsLargeInt;
    Fid_folha_cadastral_proprietario := consulta.FieldByName('id_folha_cadastral_proprietario').AsLargeInt;
    Fid_geral := consulta.FieldByName('id_geral').AsLargeInt;
    Flocalizacao := consulta.FieldByName('localizacao').AsString;
    Fnivel_manejo := consulta.FieldByName('nivel_manejo').AsInteger;
    Fnr_laudo := consulta.FieldByName('nr_laudo').AsString;
    Fsequencia := consulta.FieldByName('sequencia').AsString;
  finally
    consulta.Free;
  end;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Persistir(Novo: Boolean);
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

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Excluir;
const
   SQL = 
   'DELETE ' +
   ' FROM ' +
   'levantamento_fisico_benfeitorias' +
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
        raise Exception.Create('Erro ao excluir os dados na tabela levantamento_fisico_benfeitorias' +  E.Message);
      end;
    end;
  finally
    consulta.Free;
  end;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setacessibilidade(const Value: Integer);
begin
  Facessibilidade := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setcd_centro_consumidor(const Value: Integer);
begin
  Fcd_centro_consumidor := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setcd_obra(const Value: Integer);
begin
  Fcd_obra := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setdistancia_centro_consumidor(const Value: Integer);
begin
  Fdistancia_centro_consumidor := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setdt_atz(const Value: TDateTime);
begin
  Fdt_atz := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setdt_levantamento(const Value: TDate);
begin
  Fdt_levantamento := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setid_folha_cadastral_beneficiario(const Value: Int64);
begin
  Fid_folha_cadastral_beneficiario := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setid_folha_cadastral_proprietario(const Value: Int64);
begin
  Fid_folha_cadastral_proprietario := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setid_geral(const Value: Int64);
begin
  Fid_geral := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setlocalizacao(const Value: String);
begin
  Flocalizacao := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setnivel_manejo(const Value: Integer);
begin
  Fnivel_manejo := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setnr_laudo(const Value: String);
begin
  Fnr_laudo := Value;
end;

procedure TLEVANTAMENTO_FISICO_BENFEITORIAS.Setsequencia(const Value: String);
begin
  Fsequencia := Value;
end;

end.