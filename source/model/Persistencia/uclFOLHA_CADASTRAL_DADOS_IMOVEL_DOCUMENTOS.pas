unit uclFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS;

interface

uses
 FireDac.Stan.Param, Data.DB, uPersistencia, uConsultaSQL;

type TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS = class(TPersistencia) 

  private 
    Farea_reserva_averbada: Currency;
    Farea_total: Currency;
    Fcd_comarca: Integer;
    Fdt_atz: TDateTime;
    Fid_folha_cadastral_dados_imovel: Int64;
    Fid_geral: Int64;
    Fnr_folha: String;
    Fnr_livro: String;
    Fnr_matricula: String;
    Foficio: Integer;
    procedure Setarea_reserva_averbada(const Value: Currency);
    procedure Setarea_total(const Value: Currency);
    procedure Setcd_comarca(const Value: Integer);
    procedure Setdt_atz(const Value: TDateTime);
    procedure Setid_folha_cadastral_dados_imovel(const Value: Int64);
    procedure Setid_geral(const Value: Int64);
    procedure Setnr_folha(const Value: String);
    procedure Setnr_livro(const Value: String);
    procedure Setnr_matricula(const Value: String);
    procedure Setoficio(const Value: Integer);
  public 
   //Metodo Pesquisar pela chave primaria
    function Pesquisar(id_geral: Int64): Boolean; 
    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure Persistir(Novo: Boolean); override;

    property area_reserva_averbada: Currency read Farea_reserva_averbada write Setarea_reserva_averbada;
    property area_total: Currency read Farea_total write Setarea_total;
    property cd_comarca: Integer read Fcd_comarca write Setcd_comarca;
    property dt_atz: TDateTime read Fdt_atz write Setdt_atz;
    property id_folha_cadastral_dados_imovel: Int64 read Fid_folha_cadastral_dados_imovel write Setid_folha_cadastral_dados_imovel;
    property id_geral: Int64 read Fid_geral write Setid_geral;
    property nr_folha: String read Fnr_folha write Setnr_folha;
    property nr_livro: String read Fnr_livro write Setnr_livro;
    property nr_matricula: String read Fnr_matricula write Setnr_matricula;
    property oficio: Integer read Foficio write Setoficio;

end;

implementation

uses
    System.SysUtils, Vcl.Dialogs;

{ TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS }

procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Inserir;const   SQL =    'INSERT INTO ' +   'folha_cadastral_dados_imovel_documentos(' +   'area_reserva_averbada, ' +   'area_total, ' +   'cd_comarca, ' +   'dt_atz, ' +   'id_folha_cadastral_dados_imovel, ' +   'id_geral, ' +   'nr_folha, ' +   'nr_livro, ' +   'nr_matricula, ' +   'oficio)' +   'VALUES (' +   ':area_reserva_averbada, ' +   ':area_total, ' +   ':cd_comarca, ' +   ':dt_atz, ' +   ':id_folha_cadastral_dados_imovel, ' +   ':id_geral, ' +   ':nr_folha, ' +   ':nr_livro, ' +   ':nr_matricula, ' +   ':oficio)';var  consulta: TConsultaSQL;begin  consulta := TConsultaSQL.Create(nil);  consulta.Connection := Conexao;  consulta.SQL.Add(SQL);  try    try      consulta.ParamByName('area_reserva_averbada').AsCurrency := Farea_reserva_averbada;      consulta.ParamByName('area_total').AsCurrency := Farea_total;      consulta.ParamByName('cd_comarca').AsInteger := Fcd_comarca;      consulta.ParamByName('dt_atz').AsDateTime := Fdt_atz;      consulta.ParamByName('id_folha_cadastral_dados_imovel').AsLargeInt := Fid_folha_cadastral_dados_imovel;      consulta.ParamByName('id_geral').AsLargeInt := Fid_geral;      consulta.ParamByName('nr_folha').AsString := Fnr_folha;      consulta.ParamByName('nr_livro').AsString := Fnr_livro;      consulta.ParamByName('nr_matricula').AsString := Fnr_matricula;      consulta.ParamByName('oficio').AsInteger := Foficio;      consulta.ExecSQL;    except    on E:exception do      begin        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral_dados_imovel_documentos' +  E.Message);      end;    end;  finally    consulta.Free;  end;end;
procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Atualizar;const   SQL =    'UPDATE ' +   'folha_cadastral_dados_imovel_documentos ' +'SET ' +   'area_reserva_averbada = :area_reserva_averbada, ' +   'area_total = :area_total, ' +   'cd_comarca = :cd_comarca, ' +   'dt_atz = :dt_atz, ' +   'id_folha_cadastral_dados_imovel = :id_folha_cadastral_dados_imovel, ' +   'id_geral = :id_geral, ' +   'nr_folha = :nr_folha, ' +   'nr_livro = :nr_livro, ' +   'nr_matricula = :nr_matricula, ' +   'oficio = :oficio ' +'WHERE ' +'id_geral = :id_geral';var  consulta: TConsultaSQL;begin  consulta := TConsultaSQL.Create(nil);  consulta.Connection := Conexao;  consulta.SQL.Add(SQL);  try    try      consulta.ParamByName('area_reserva_averbada').AsCurrency := Farea_reserva_averbada;      consulta.ParamByName('area_total').AsCurrency := Farea_total;      consulta.ParamByName('cd_comarca').AsInteger := Fcd_comarca;      consulta.ParamByName('dt_atz').AsDateTime := Fdt_atz;      consulta.ParamByName('id_folha_cadastral_dados_imovel').AsLargeInt := Fid_folha_cadastral_dados_imovel;      consulta.ParamByName('id_geral').AsLargeInt := Fid_geral;      consulta.ParamByName('nr_folha').AsString := Fnr_folha;      consulta.ParamByName('nr_livro').AsString := Fnr_livro;      consulta.ParamByName('nr_matricula').AsString := Fnr_matricula;      consulta.ParamByName('oficio').AsInteger := Foficio;      consulta.ExecSQL;    except    on E:exception do      begin        raise Exception.Create('Erro ao gravar os dados na tabela folha_cadastral_dados_imovel_documentos' +  E.Message);      end;    end;  finally    consulta.Free;  end;end;
function TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Pesquisar(id_geral: Int64): Boolean;const    SQL =    'SELECT * ' +   ' FROM ' +   'folha_cadastral_dados_imovel_documentos' +   ' WHERE ' +   'id_geral = :id_geral';var  consulta: TConsultaSQL;begin  consulta := TConsultaSQL.Create(nil);  consulta.Connection := Conexao;  try    consulta.Open(SQL, [id_geral]);    Result := not consulta.IsEmpty;    Farea_reserva_averbada := consulta.FieldByName('area_reserva_averbada').AsCurrency;    Farea_total := consulta.FieldByName('area_total').AsCurrency;    Fcd_comarca := consulta.FieldByName('cd_comarca').AsInteger;    Fdt_atz := consulta.FieldByName('dt_atz').AsDateTime;    Fid_folha_cadastral_dados_imovel := consulta.FieldByName('id_folha_cadastral_dados_imovel').AsLargeInt;    Fid_geral := consulta.FieldByName('id_geral').AsLargeInt;    Fnr_folha := consulta.FieldByName('nr_folha').AsString;    Fnr_livro := consulta.FieldByName('nr_livro').AsString;    Fnr_matricula := consulta.FieldByName('nr_matricula').AsString;    Foficio := consulta.FieldByName('oficio').AsInteger;  finally    consulta.Free;  end;end;

procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Persistir(Novo: Boolean);begin  if Novo then  begin     if id_geral = 0 then      id_geral := GetIdGeral;    Inserir;  end  else     Atualizar;end;

procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Excluir;const   SQL =    'DELETE ' +   ' FROM ' +   'folha_cadastral_dados_imovel_documentos' +   ' WHERE ' +   'id_geral = :id_geral';var  consulta: TConsultaSQL;begin  consulta := TConsultaSQL.Create(nil);  consulta.Connection := Conexao;  consulta.SQL.Add(SQL);  try    try      consulta.ParamByName('id_geral').AsLargeInt := Fid_geral;      consulta.ExecSQL;    except    on E:exception do      begin        raise Exception.Create('Erro ao excluir os dados na tabela folha_cadastral_dados_imovel_documentos' +  E.Message);      end;    end;  finally    consulta.Free;  end;end;
procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Setarea_reserva_averbada(const Value: Currency);begin  Farea_reserva_averbada := Value;end;procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Setarea_total(const Value: Currency);begin  Farea_total := Value;end;procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Setcd_comarca(const Value: Integer);begin  Fcd_comarca := Value;end;procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Setdt_atz(const Value: TDateTime);begin  Fdt_atz := Value;end;procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Setid_folha_cadastral_dados_imovel(const Value: Int64);begin  Fid_folha_cadastral_dados_imovel := Value;end;procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Setid_geral(const Value: Int64);begin  Fid_geral := Value;end;procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Setnr_folha(const Value: String);begin  Fnr_folha := Value;end;procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Setnr_livro(const Value: String);begin  Fnr_livro := Value;end;procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Setnr_matricula(const Value: String);begin  Fnr_matricula := Value;end;procedure TFOLHA_CADASTRAL_DADOS_IMOVEL_DOCUMENTOS.Setoficio(const Value: Integer);begin  Foficio := Value;end;end.