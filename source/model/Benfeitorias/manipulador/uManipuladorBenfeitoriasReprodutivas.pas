unit uManipuladorBenfeitoriasReprodutivas;

interface

uses
  uManipuladorBenfeitorias, Data.DB, uUtil,
  uclLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS;

type
  TTipoCultivo = (tcNativo = 1, tcTradicional, tcTecnificado);

  TDadosBenfeitoria = record
    cd_benfeitoria,
    un_medida: string;
    quantidade,
    idade: Double;
    tp_cultivo: TTipoCultivo;
    preco: Currency;
  end;

  TInfoPrecoBenfeitoria = record
    cd_benfeitoria,
    un_medida: string;
    cd_tabela: Integer;
    preco: Currency;
  end;

  TManipuladorBenfeitoriasReprodutivas = class(TManipuladorBenfeitorias)
  private
    function GetIdBenfeitoria(const CodBenfeitoria: string): Integer;
  public
    procedure CarregaLevantamento(Parametros: TParametrosBusca); override;
    procedure AdicionarBenfeitoriaReprodutiva(DadosBenfeitorias: TDadosBenfeitoria); overload;
    function GetNomeBenfeitoria(CodBenfeitoria: string): string; override;
    function GetInfoPrecoBenfeitoria(const CodBenfeitoria: string; const CodObra: Integer): TInfoPrecoBenfeitoria;
    function GetNome(IdFolhaCadastral: Int64): string;
    function GetCodCidade(IdFolhaCadastral: Int64): Integer;
    procedure GravarCabecalho;
    procedure GravarBenfeitorias; override;
  end;

implementation

uses
  System.Variants, uConsultaSQL, uclLEVANTAMENTO_FISICO_BENFEITORIAS;

{ TManipuladorBenfeitoriasReprodutivas }

procedure TManipuladorBenfeitoriasReprodutivas.AdicionarBenfeitoriaReprodutiva(DadosBenfeitorias: TDadosBenfeitoria);
begin
  if Dados.cdsLFBenfeitoriaReprodutiva.Locate('cd_benfeitoria;un_medida;idade;tp_cultivo',
                                              VarArrayOf([DadosBenfeitorias.cd_benfeitoria,
                                                          DadosBenfeitorias.un_medida,
                                                          DadosBenfeitorias.idade,
                                                          Ord(DadosBenfeitorias.tp_cultivo)]), []) then
    Dados.cdsLFBenfeitoriaReprodutiva.Edit
  else
    Dados.cdsLFBenfeitoriaReprodutiva.Append;
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('cd_benfeitoria').AsString := DadosBenfeitorias.cd_benfeitoria;
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('id_benfeitoria').AsInteger := GetIdBenfeitoria(DadosBenfeitorias.cd_benfeitoria);
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('un_medida').AsString := DadosBenfeitorias.un_medida;
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('quantidade').AsFloat := DadosBenfeitorias.quantidade;
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('idade').AsFloat := DadosBenfeitorias.idade;
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('tp_cultivo').AsInteger := Ord(DadosBenfeitorias.tp_cultivo);
  Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('preco').AsCurrency := DadosBenfeitorias.preco;
  Dados.cdsLFBenfeitoriaReprodutiva.Post;
end;

procedure TManipuladorBenfeitoriasReprodutivas.CarregaLevantamento(Parametros: TParametrosBusca);
const
  SQL = ' SELECT ' +
        '   lfb.id_geral, ' +
        ' 	lfb.cd_obra, ' +
        ' 	lfb.id_folha_cadastral_proprietario, ' +
        ' 	lfb.id_folha_cadastral_beneficiario, ' +
        ' 	lfb.sequencia, ' +
        ' 	lfb.localizacao, ' +
        ' 	lfb.nr_laudo, ' +
        ' 	lfb.acessibilidade, ' +
        ' 	lfb.distancia_centro_consumidor, ' +
        ' 	lfb.nivel_manejo, ' +
        ' 	lfb.cd_centro_consumidor, ' +
        '   lfbr.id_geral AS id_lf_reprodutiva, ' +
        '   lfbr.id_levantamento_fisico_benfeitorias, ' +
        '   lfbr.id_benfeitoria, ' +
        ' 	br.cd_benfeitoria, ' +
        ' 	lfbr.un_medida, ' +
        ' 	lfbr.quantidade, ' +
        ' 	lfbr.idade, ' +
        ' 	lfbr.tp_cultivo, ' +
        ' 	tpb.preco  ' +
        ' FROM ' +
        ' 	levantamento_fisico_benfeitorias lfb ' +
        ' JOIN levantamento_fisico_benfeitorias_reprodutivas lfbr ON ' +
        ' 	lfbr.id_levantamento_fisico_benfeitorias = lfb.id_geral ' +
        ' JOIN benfeitorias_reprodutivas br ON br.id_benfeitoria = lfbr.id_benfeitoria ' +
        ' JOIN tabela_preco_benfeitorias tpb ON tpb.id_benfeitoria = br.id_benfeitoria  ' +
        ' WHERE ' +
        ' 	cd_obra = :cd_obra ' +
        ' 	AND id_folha_cadastral_proprietario = :id_folha_cadastral_proprietario ' +
        ' 	AND id_folha_cadastral_beneficiario = :id_folha_cadastral_beneficiario ' +
        ' 	AND sequencia = :sequencia ' +
        ' 	AND localizacao = :localizacao  ';
var
  consulta: TConsultaSQL;
begin
  inherited;
  consulta := TConsultaSQL.Create(Conexao);

  try
    consulta.Open(SQL, [Parametros.cd_obra,
                        Parametros.id_fc_proprietario,
                        Parametros.id_fc_beneficiario,
                        Parametros.sequencia,
                        Parametros.localizacao]);
    if not consulta.IsEmpty then
    begin
      Dados.cdsLFBenfeitorias.Append;
      Dados.cdsLFBenfeitorias.FieldByName('id_geral').AsLargeInt := consulta.FieldByName('id_geral').AsLargeInt;
      Dados.cdsLFBenfeitorias.FieldByName('cd_obra').AsInteger := consulta.FieldByName('cd_obra').AsInteger;
      Dados.cdsLFBenfeitorias.FieldByName('id_folha_cadastral_proprietario').AsLargeInt := consulta.FieldByName('id_folha_cadastral_proprietario').AsLargeInt;
      Dados.cdsLFBenfeitorias.FieldByName('id_folha_cadastral_beneficiario').AsLargeInt := consulta.FieldByName('id_folha_cadastral_beneficiario').AsLargeInt;
      Dados.cdsLFBenfeitorias.FieldByName('sequencia').AsString := consulta.FieldByName('sequencia').AsString;
      Dados.cdsLFBenfeitorias.FieldByName('localizacao').AsString := consulta.FieldByName('localizacao').AsString;
      Dados.cdsLFBenfeitorias.FieldByName('nr_laudo').AsString := consulta.FieldByName('nr_laudo').AsString;
      case consulta.FieldByName('acessibilidade').AsInteger of
        -1: Dados.cdsLFBenfeitorias.FieldByName('acessibilidade').AsInteger := Ord(taNenhum);
        0: Dados.cdsLFBenfeitorias.FieldByName('acessibilidade').AsInteger := Ord(taOtima);
        1: Dados.cdsLFBenfeitorias.FieldByName('acessibilidade').AsInteger := Ord(taMuitoBoa);
        2: Dados.cdsLFBenfeitorias.FieldByName('acessibilidade').AsInteger := Ord(taBoa);
        3: Dados.cdsLFBenfeitorias.FieldByName('acessibilidade').AsInteger := Ord(taRegular);
        4: Dados.cdsLFBenfeitorias.FieldByName('acessibilidade').AsInteger := Ord(taRuim);
      end;

      case consulta.FieldByName('distancia_centro_consumidor').AsInteger of
        -1: Dados.cdsLFBenfeitorias.FieldByName('distancia_centro_consumidor').AsInteger := Ord(tdNenhum);
        0: Dados.cdsLFBenfeitorias.FieldByName('distancia_centro_consumidor').AsInteger := Ord(tdMuitoProximo);
        1: Dados.cdsLFBenfeitorias.FieldByName('distancia_centro_consumidor').AsInteger := Ord(tdProximo);
        2: Dados.cdsLFBenfeitorias.FieldByName('distancia_centro_consumidor').AsInteger := Ord(tdDistante);
        3: Dados.cdsLFBenfeitorias.FieldByName('distancia_centro_consumidor').AsInteger := Ord(tdMuitoDistante);
      end;

      case consulta.FieldByName('nivel_manejo').AsInteger of
        -1: Dados.cdsLFBenfeitorias.FieldByName('nivel_manejo').AsLargeInt := Ord(tnmNenhum);
        0: Dados.cdsLFBenfeitorias.FieldByName('nivel_manejo').AsLargeInt := Ord(tnmAvancado);
        1: Dados.cdsLFBenfeitorias.FieldByName('nivel_manejo').AsLargeInt := Ord(tnmSemiAvancado);
        2: Dados.cdsLFBenfeitorias.FieldByName('nivel_manejo').AsLargeInt := Ord(tnmTradicional);
        3: Dados.cdsLFBenfeitorias.FieldByName('nivel_manejo').AsLargeInt := Ord(tnmPrimitivo);
        4: Dados.cdsLFBenfeitorias.FieldByName('nivel_manejo').AsLargeInt := Ord(tnmImprodutivo);
      end;
      Dados.cdsLFBenfeitorias.FieldByName('cd_centro_consumidor').AsInteger := consulta.FieldByName('cd_centro_consumidor').AsInteger;
      Dados.cdsLFBenfeitorias.Post;

      consulta.Loop(
      procedure
      begin
        Dados.cdsLFBenfeitoriaReprodutiva.Append;
        Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('id_geral').AsLargeInt := consulta.FieldByName('id_lf_reprodutiva').AsLargeInt;
        Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('id_levantamento_fisico_benfeitorias').AsLargeInt := consulta.FieldByName('id_levantamento_fisico_benfeitorias').AsLargeInt;
        Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('cd_benfeitoria').AsString := consulta.FieldByName('cd_benfeitoria').AsString;
        Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('id_benfeitoria').AsInteger := consulta.FieldByName('id_benfeitoria').AsInteger;
        Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('un_medida').AsString := consulta.FieldByName('un_medida').AsString;
        Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('quantidade').AsFloat := consulta.FieldByName('quantidade').AsFloat;
        Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('idade').AsFloat := consulta.FieldByName('idade').AsFloat;
        Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('tp_cultivo').AsInteger := consulta.FieldByName('tp_cultivo').AsInteger;
        Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('preco').AsCurrency := consulta.FieldByName('preco').AsCurrency;
        Dados.cdsLFBenfeitoriaReprodutiva.Post;
      end
      );
    end;
  finally
    consulta.Free;
  end;
end;

function TManipuladorBenfeitoriasReprodutivas.GetCodCidade(IdFolhaCadastral: Int64): Integer;
const
  SQL = 'SELECT cd_municipio FROM folha_cadastral fc WHERE id_geral = :id_geral';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(Conexao);

  try
    consulta.Open(SQL, [IdFolhaCadastral]);
    Result := consulta.FieldByName('cd_municipio').AsInteger;
  finally
    consulta.Free;
  end;
end;

function TManipuladorBenfeitoriasReprodutivas.GetIdBenfeitoria(const CodBenfeitoria: string): Integer;
const
  SQL = 'select id_benfeitoria from benfeitorias_reprodutivas where cd_benfeitoria = :cd_benfeitoria';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(Conexao);

  try
    consulta.Open(SQL, [CodBenfeitoria]);
    Result := consulta.FieldByName('id_benfeitoria').AsInteger;
  finally
    consulta.Free;
  end;
end;

function TManipuladorBenfeitoriasReprodutivas.GetInfoPrecoBenfeitoria(const CodBenfeitoria: string; const CodObra: Integer): TInfoPrecoBenfeitoria;
const
  SQL = ' SELECT ' +
        ' 	br.cd_benfeitoria, ' +
        ' 	tpb.un_medida, ' +
        ' 	tp.cd_tabela, ' +
        ' 	tpb.preco  ' +
        ' 	FROM benfeitorias_reprodutivas br ' +
        ' JOIN tabela_preco_benfeitorias tpb ON ' +
        ' 	tpb.id_benfeitoria = br.id_benfeitoria ' +
        ' JOIN tabela_preco tp ON ' +
        ' 	tp.cd_tabela = tpb.cd_tabela ' +
        ' WHERE ' +
        ' 	br.id_benfeitoria = :id_benfeitoria ' +
        ' 	AND tp.cd_obra = :cd_obra ' +
        ' 	AND tp.ativo ' ;
var
  consulta: TConsultaSQL;
  idBenfeitoria: Integer;
begin
  consulta := TConsultaSQL.Create(Conexao);

  try
    idBenfeitoria := GetIdBenfeitoria(CodBenfeitoria);
    consulta.Open(SQL, [idBenfeitoria, CodObra]);
    if consulta.IsEmpty then
      Exit(Default(TInfoPrecoBenfeitoria));
    Result.cd_benfeitoria := consulta.FieldByName('cd_benfeitoria').AsString;
    Result.un_medida := consulta.FieldByName('un_medida').AsString;
    Result.cd_tabela := consulta.FieldByName('cd_tabela').AsInteger;
    Result.preco := consulta.FieldByName('preco').AsCurrency;
  finally
    consulta.Free;
  end;
end;

function TManipuladorBenfeitoriasReprodutivas.GetNome(IdFolhaCadastral: Int64): string;
const
  SQL = 'SELECT nome FROM folha_cadastral fc WHERE id_geral = :id_geral';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(Conexao);

  try
    consulta.Open(SQL, [IdFolhaCadastral]);
    Result := consulta.FieldByName('nome').AsString;
  finally
    consulta.Free;
  end;
end;

function TManipuladorBenfeitoriasReprodutivas.GetNomeBenfeitoria(CodBenfeitoria: string): string;
const
  SQL = 'select nm_benfeitoria from benfeitorias_reprodutivas where cd_benfeitoria = :cd_benfeitoria';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(Conexao);
  try
    consulta.Open(SQL, [CodBenfeitoria]);
    Result := consulta.FieldByName('nm_benfeitoria').AsString;
  finally
    consulta.Free;
  end;
end;

procedure TManipuladorBenfeitoriasReprodutivas.GravarBenfeitorias;
var
  persistencia: TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS;
  novo: Boolean;
begin
  inherited;
  persistencia := TLEVANTAMENTO_FISICO_BENFEITORIAS_REPRODUTIVAS.Create(Conexao);

  try
    Dados.cdsLFBenfeitoriaReprodutiva.Loop(
    procedure
    begin
      novo := not persistencia.Pesquisar(Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('id_geral').AsLargeInt);
      if Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('id_geral').AsLargeInt > 0 then
        persistencia.id_geral := Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('id_geral').AsLargeInt;
      persistencia.id_benfeitoria := Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('id_benfeitoria').AsInteger;
      persistencia.id_levantamento_fisico_benfeitorias := Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('id_levantamento_fisico_benfeitorias').AsLargeInt;  
      persistencia.idade := Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('idade').AsFloat;    
      persistencia.quantidade := Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('quantidade').AsFloat;   
      persistencia.tp_cultivo := Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('tp_cultivo').AsInteger;  
      persistencia.un_medida := Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('un_medida').AsString;       
      persistencia.preco := Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('preco').AsCurrency;
      persistencia.Persistir(novo);
    end);
  
  finally
    persistencia.Free;
  end;
end;

procedure TManipuladorBenfeitoriasReprodutivas.GravarCabecalho;
var
  persistencia: TLEVANTAMENTO_FISICO_BENFEITORIAS;
  novo: Boolean;
begin
  persistencia := TLEVANTAMENTO_FISICO_BENFEITORIAS.Create(Conexao);

  try
    novo := not persistencia.Pesquisar(Dados.cdsLFBenfeitorias.FieldByName('id_geral').AsLargeInt);
    persistencia.acessibilidade := Dados.cdsLFBenfeitorias.FieldByName('acessibilidade').AsInteger;
    persistencia.cd_centro_consumidor := Dados.cdsLFBenfeitorias.FieldByName('cd_centro_consumidor').AsInteger;
    persistencia.cd_obra := Dados.cdsLFBenfeitorias.FieldByName('cd_obra').AsInteger;
    persistencia.distancia_centro_consumidor := Dados.cdsLFBenfeitorias.FieldByName('distancia_centro_consumidor').AsInteger;
    persistencia.dt_levantamento := Dados.cdsLFBenfeitorias.FieldByName('dt_levantamento').AsDateTime;
    persistencia.id_folha_cadastral_beneficiario := Dados.cdsLFBenfeitorias.FieldByName('id_folha_cadastral_beneficiario').AsLargeInt;
    persistencia.id_folha_cadastral_proprietario := Dados.cdsLFBenfeitorias.FieldByName('id_folha_cadastral_proprietario').AsLargeInt;
    persistencia.localizacao := Dados.cdsLFBenfeitorias.FieldByName('localizacao').AsString;
    persistencia.nivel_manejo := Dados.cdsLFBenfeitorias.FieldByName('nivel_manejo').AsInteger;
    persistencia.nr_laudo := Dados.cdsLFBenfeitorias.FieldByName('nr_laudo').AsString;
    persistencia.sequencia := Dados.cdsLFBenfeitorias.FieldByName('sequencia').AsString;
    persistencia.Persistir(novo);

    Dados.cdsLFBenfeitorias.Edit;
    Dados.cdsLFBenfeitorias.FieldByName('id_geral').AsLargeInt := persistencia.id_geral;
    Dados.cdsLFBenfeitorias.Post;  
    Dados.cdsLFBenfeitoriaReprodutiva.Edit;
    Dados.cdsLFBenfeitoriaReprodutiva.FieldByName('id_levantamento_fisico_benfeitorias').AsLargeInt := persistencia.id_geral;
    Dados.cdsLFBenfeitoriaReprodutiva.Post;  
  finally
    persistencia.Free;
  end;
end;

end.
