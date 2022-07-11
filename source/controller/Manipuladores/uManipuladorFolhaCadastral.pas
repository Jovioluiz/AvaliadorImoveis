unit uManipuladorFolhaCadastral;

interface

uses
  uRegra, uUtil, uDmFolhaCadastral, uDadosComum;

type TManipuladorFolhaCadastral = class(TRegra)
  private
    FDados: TDmFolhaCadastral;
    FDadosComum: TDadosComum;
    procedure GravaFolhaCadastralEstadoCivil(IdFolhaCadastral: Int64);
    procedure GravaFolhaCadastralEstadoCivilCertidoes(IdFolhaEstadoCivil: Int64);
    procedure GravaFolhaCadastralEndereco(IdFolhaCadastral: Int64);
    procedure CarregaFolhaCadastralDadosCivil(IdFolhaCadastral: Int64);
    procedure CarregaFolhaCadastralEndereco(IdFolhaCadastral: Int64);
    procedure GravaVinculoFolhaCadastralConjuge(IdFolhaCadastral: Int64);
    procedure SetDados(const Value: TDmFolhaCadastral);
  public
    constructor Create;
    destructor Destroy; override;
    procedure GravaFolhaCadastral;
    function GetNomeCidade(CodCidade: Integer): string;
    function GetUF(CodCidade: Integer): string;
    function GetObra(CodObra: Integer): string;
    function CarregaFolhaCadastral(CodObra: Integer; const Sequencia: string): Boolean;
    property Dados: TDmFolhaCadastral read FDados write SetDados;

end;

implementation

uses
  uclFOLHA_CADASTRAL, uConsultaSQL, uclFOLHA_CADASTRAL_ESTADO_CIVIL,
  System.SysUtils, uclFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES, Data.DB,
  uclFOLHA_CADASTRAL_ENDERECO, uclFOLHA_CADASTRAL_CONJUGE;

{ TManipuladorFolhaCadastral }

function TManipuladorFolhaCadastral.CarregaFolhaCadastral(CodObra: Integer; const Sequencia: string): Boolean;
const
  SQL = ' SELECT ' +
        ' 	id_geral, ' +
        ' 	nome, ' +
        ' 	dt_nascimento, ' +
        ' 	cd_cidade_naturalidade, ' +
        ' 	profissao, ' +
        ' 	tp_pessoa, ' +
        ' 	cpf_cnpj, ' +
        ' 	tp_documento, ' +
        ' 	ie_rg, ' +
        ' 	sabe_assinar, ' +
        ' 	nome_pai, ' +
        ' 	nome_mae, ' +
        ' 	email, ' +
        ' 	dt_cadastro, ' +
        ' 	obs, ' +
        ' 	localidade, ' +
        ' 	nm_cadastrador, ' +
        ' 	cd_obra, ' +
        ' 	sequencia, ' +
        ' 	cd_municipio, ' +
        '   orgao_expedidor, ' +
        '   folha_proprietario ' +
        ' FROM ' +
        ' 	folha_cadastral ' +
        ' WHERE ' +
        ' 	cd_obra = :cd_obra ' +
        ' 	AND sequencia = :sequencia ';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(nil);
  consulta.Connection := Conexao;

  try
    consulta.Open(SQL, [CodObra, Sequencia]);
    Result := not consulta.IsEmpty;
    if consulta.IsEmpty then
      Exit(False);

    consulta.LoopSimples(
    procedure
    begin
      Dados.cdsFolhaCadastral.Append;
      Dados.cdsFolhaCadastral.FieldByName('id_geral').AsLargeInt := consulta.FieldByName('id_geral').AsLargeInt;
      Dados.cdsFolhaCadastral.FieldByName('nome').AsString := consulta.FieldByName('nome').AsString;
      Dados.cdsFolhaCadastral.FieldByName('dt_nascimento').AsDateTime := consulta.FieldByName('dt_nascimento').AsDateTime;
      Dados.cdsFolhaCadastral.FieldByName('cd_cidade_naturalidade').AsInteger := consulta.FieldByName('cd_cidade_naturalidade').AsInteger;
      Dados.cdsFolhaCadastral.FieldByName('profissao').AsString := consulta.FieldByName('profissao').AsString;
      Dados.cdsFolhaCadastral.FieldByName('tp_pessoa').AsString := consulta.FieldByName('tp_pessoa').AsString;
      Dados.cdsFolhaCadastral.FieldByName('cpf_cnpj').AsString := consulta.FieldByName('cpf_cnpj').AsString;
      Dados.cdsFolhaCadastral.FieldByName('tp_documento').AsString := consulta.FieldByName('tp_documento').AsString;
      Dados.cdsFolhaCadastral.FieldByName('ie_rg').AsString := consulta.FieldByName('ie_rg').AsString;
      Dados.cdsFolhaCadastral.FieldByName('sabe_assinar').AsBoolean := consulta.FieldByName('sabe_assinar').AsBoolean;
      Dados.cdsFolhaCadastral.FieldByName('nome_pai').AsString := consulta.FieldByName('nome_pai').AsString;
      Dados.cdsFolhaCadastral.FieldByName('nome_mae').AsString := consulta.FieldByName('nome_mae').AsString;
      Dados.cdsFolhaCadastral.FieldByName('email').AsString := consulta.FieldByName('email').AsString;
      Dados.cdsFolhaCadastral.FieldByName('dt_cadastro').AsDateTime := consulta.FieldByName('dt_cadastro').AsDateTime;
      Dados.cdsFolhaCadastral.FieldByName('obs').AsString := consulta.FieldByName('obs').AsString;
      Dados.cdsFolhaCadastral.FieldByName('localidade').AsString := consulta.FieldByName('localidade').AsString;
      Dados.cdsFolhaCadastral.FieldByName('nm_cadastrador').AsString := consulta.FieldByName('nm_cadastrador').AsString;
      Dados.cdsFolhaCadastral.FieldByName('cd_obra').AsInteger := consulta.FieldByName('cd_obra').AsInteger;
      Dados.cdsFolhaCadastral.FieldByName('sequencia').AsString := consulta.FieldByName('sequencia').AsString;
      Dados.cdsFolhaCadastral.FieldByName('cd_municipio').AsInteger := consulta.FieldByName('cd_municipio').AsInteger;
      Dados.cdsFolhaCadastral.FieldByName('orgao_expedidor').AsString := consulta.FieldByName('orgao_expedidor').AsString;
      Dados.cdsFolhaCadastral.FieldByName('folha_proprietario').AsBoolean := consulta.FieldByName('folha_proprietario').AsBoolean;
      Dados.cdsFolhaCadastral.Post;
    end
    );
    CarregaFolhaCadastralDadosCivil(Dados.cdsFolhaCadastral.FieldByName('id_geral').AsLargeInt);
  finally
    consulta.Free;
  end;
end;

procedure TManipuladorFolhaCadastral.CarregaFolhaCadastralDadosCivil(IdFolhaCadastral: Int64);
const
  SQL = ' SELECT ' +
        ' 	id_geral, ' +
        ' 	id_folha_cadastral, ' +
        ' 	cd_estado_civil ' +
        ' FROM ' +
        ' 	folha_cadastral_estado_civil ' +
        ' WHERE ' +
        ' 	id_folha_cadastral = :id_folha_cadastral ';

  SQL_CERTIDOES =  ' SELECT ' +
                   ' 	id_geral, ' +
                   ' 	id_folha_cadastral_estado_civil, ' +
                   ' 	nr_certidao, ' +
                   ' 	folhas, ' +
                   ' 	livro, ' +
                   ' 	DATA, ' +
                   ' 	cartorio, ' +
                   ' 	nr_sentenca_autos, ' +
                   ' 	juizo, ' +
                   ' 	possui_pacto_antenupcial, ' +
                   ' 	uniao_estavel_desde  ' +
                   ' FROM folha_cadastral_estado_civil_certidoes ' +
                   ' WHERE ' +
                   ' 	id_folha_cadastral_estado_civil = :id  ';

var
  consulta,
  consultaCertidoes: TConsultaSQL;

  procedure CarregaFolhaCadastralDadosCivilCertidoes(IdFolhaEstadoCivil: Int64);
  begin
    consultaCertidoes := TConsultaSQL.Create(nil);
    consultaCertidoes.Connection := Conexao;

    try
      consultaCertidoes.Open(SQL_CERTIDOES, [IdFolhaEstadoCivil]);

      consultaCertidoes.Loop(
      procedure
      begin
        Dados.cdsFolhaCadEstadoCivilCert.Append;
        Dados.cdsFolhaCadEstadoCivilCert.FieldByName('id_geral').AsLargeInt := consultaCertidoes.FieldByName('id_geral').AsLargeInt;
        Dados.cdsFolhaCadEstadoCivilCert.FieldByName('id_folha_cadastral_estado_civil').AsLargeInt := consultaCertidoes.FieldByName('id_folha_cadastral_estado_civil').AsLargeInt;
        Dados.cdsFolhaCadEstadoCivilCert.FieldByName('nr_certidao').AsString := consultaCertidoes.FieldByName('nr_certidao').AsString;
        Dados.cdsFolhaCadEstadoCivilCert.FieldByName('folhas').AsString := consultaCertidoes.FieldByName('folhas').AsString;
        Dados.cdsFolhaCadEstadoCivilCert.FieldByName('livro').AsString := consultaCertidoes.FieldByName('livro').AsString;
        Dados.cdsFolhaCadEstadoCivilCert.FieldByName('data').AsDateTime := consultaCertidoes.FieldByName('data').AsDateTime;
        Dados.cdsFolhaCadEstadoCivilCert.FieldByName('cartorio').AsString := consultaCertidoes.FieldByName('cartorio').AsString;
        Dados.cdsFolhaCadEstadoCivilCert.FieldByName('nr_sentenca_autos').AsString := consultaCertidoes.FieldByName('nr_sentenca_autos').AsString;
        Dados.cdsFolhaCadEstadoCivilCert.FieldByName('juizo').AsString := consultaCertidoes.FieldByName('juizo').AsString;
        Dados.cdsFolhaCadEstadoCivilCert.FieldByName('possui_pacto_antenupcial').AsBoolean := consultaCertidoes.FieldByName('possui_pacto_antenupcial').AsBoolean;
        Dados.cdsFolhaCadEstadoCivilCert.FieldByName('uniao_estavel_desde').AsString := consultaCertidoes.FieldByName('uniao_estavel_desde').AsString;
        Dados.cdsFolhaCadEstadoCivilCert.Post;
      end
      );
    finally
      consultaCertidoes.Free;
    end;
  end;

begin
  consulta := TConsultaSQL.Create(nil);
  consulta.Connection := Conexao;

  try
    consulta.Open(SQl, [IdFolhaCadastral]);

    if consulta.IsEmpty then
      Exit;

    Dados.cdsFolhaCadEstadoCivil.Append;
    Dados.cdsFolhaCadEstadoCivil.FieldByName('id_geral').AsLargeInt := consulta.FieldByName('id_geral').AsLargeInt;
    Dados.cdsFolhaCadEstadoCivil.FieldByName('id_folha_cadastral').AsLargeInt := consulta.FieldByName('id_folha_cadastral').AsLargeInt;
    Dados.cdsFolhaCadEstadoCivil.FieldByName('cd_estado_civil').AsInteger := consulta.FieldByName('cd_estado_civil').AsInteger;
    Dados.cdsFolhaCadEstadoCivil.Post;

    CarregaFolhaCadastralDadosCivilCertidoes(Dados.cdsFolhaCadEstadoCivil.FieldByName('id_geral').AsLargeInt);
    CarregaFolhaCadastralEndereco(IdFolhaCadastral);
  finally
    consulta.Free;
  end;
end;

procedure TManipuladorFolhaCadastral.CarregaFolhaCadastralEndereco(IdFolhaCadastral: Int64);
const
  SQL = ' SELECT ' +
        ' 	id_geral, ' +
        ' 	id_folha_cadastral, ' +
        ' 	logradouro, ' +
        ' 	numero, ' +
        ' 	cd_cidade, ' +
        ' 	bairro ' +
        ' FROM ' +
        ' 	folha_cadastral_endereco ' +
        ' WHERE ' +
        ' 	id_folha_cadastral = :id_folha_cadastral ';
var
  consulta: TConsultaSQL;
begin
  consulta := TConsultaSQL.Create(nil);
  consulta.Connection := Conexao;

  try
    consulta.Open(SQL, [IdFolhaCadastral]);

    if consulta.IsEmpty then
      Exit;

    Dados.cdsFolhaCadastralEndereco.Append;
    Dados.cdsFolhaCadastralEndereco.FieldByName('id_geral').AsLargeInt := consulta.FieldByName('id_geral').AsLargeInt;
    Dados.cdsFolhaCadastralEndereco.FieldByName('id_folha_cadastral').AsLargeInt := consulta.FieldByName('id_folha_cadastral').AsLargeInt;
    Dados.cdsFolhaCadastralEndereco.FieldByName('logradouro').AsString := consulta.FieldByName('logradouro').AsString;
    Dados.cdsFolhaCadastralEndereco.FieldByName('numero').AsString := consulta.FieldByName('numero').AsString;
    Dados.cdsFolhaCadastralEndereco.FieldByName('cd_cidade').AsInteger := consulta.FieldByName('cd_cidade').AsInteger;
    Dados.cdsFolhaCadastralEndereco.FieldByName('bairro').AsString := consulta.FieldByName('bairro').AsString;
    Dados.cdsFolhaCadastralEndereco.Post;
  finally
    consulta.Free;
  end;
end;

constructor TManipuladorFolhaCadastral.Create;
begin
  FDados := TDmFolhaCadastral.Create(nil);
  FDadosComum := TDadosComum.Create;
end;

destructor TManipuladorFolhaCadastral.Destroy;
begin
  FDados.Free;
  FDadosComum.Free;
  inherited;
end;

function TManipuladorFolhaCadastral.GetNomeCidade(CodCidade: Integer): string;
begin
  Result := FDadosComum.GetNomeCidade(CodCidade);
end;

function TManipuladorFolhaCadastral.GetObra(CodObra: Integer): string;
begin
  Result := FDadosComum.GetObra(CodObra);
end;

function TManipuladorFolhaCadastral.GetUF(CodCidade: Integer): string;
begin
  Result := FDadosComum.GetUF(CodCidade);
end;

procedure TManipuladorFolhaCadastral.GravaFolhaCadastral;
var
  folhaCadastral: TFOLHA_CADASTRAL;
  novo: Boolean;
begin
  folhaCadastral := TFOLHA_CADASTRAL.Create(Conexao);

  try
    novo := not folhaCadastral.Pesquisar(Dados.cdsFolhaCadastral.FieldByName('id_geral').AsLargeInt);
    if Dados.cdsFolhaCadastral.FieldByName('id_geral').AsLargeInt > 0 then
      folhaCadastral.id_geral := Dados.cdsFolhaCadastral.FieldByName('id_geral').AsLargeInt;
    folhaCadastral.cd_cidade_naturalidade := Dados.cdsFolhaCadastral.FieldByName('cd_cidade_naturalidade').AsInteger;
    folhaCadastral.cd_municipio := Dados.cdsFolhaCadastral.FieldByName('cd_municipio').AsInteger;
    folhaCadastral.cpf_cnpj := Dados.cdsFolhaCadastral.FieldByName('cpf_cnpj').AsString;
    folhaCadastral.dt_cadastro := Dados.cdsFolhaCadastral.FieldByName('dt_cadastro').AsDateTime;
    folhaCadastral.dt_nascimento := Dados.cdsFolhaCadastral.FieldByName('dt_nascimento').AsDateTime;
    folhaCadastral.email := Dados.cdsFolhaCadastral.FieldByName('email').AsString;
    folhaCadastral.ie_rg := Dados.cdsFolhaCadastral.FieldByName('ie_rg').AsString;
    folhaCadastral.localidade := Dados.cdsFolhaCadastral.FieldByName('localidade').AsString;
    folhaCadastral.nm_cadastrador := Dados.cdsFolhaCadastral.FieldByName('nm_cadastrador').AsString;
    folhaCadastral.nome := Dados.cdsFolhaCadastral.FieldByName('nome').AsString;
    folhaCadastral.nome_mae := Dados.cdsFolhaCadastral.FieldByName('nome_mae').AsString;
    folhaCadastral.nome_pai := Dados.cdsFolhaCadastral.FieldByName('nome_pai').AsString;
    folhaCadastral.cd_obra := Dados.cdsFolhaCadastral.FieldByName('cd_obra').AsInteger;
    folhaCadastral.obs := Dados.cdsFolhaCadastral.FieldByName('obs').AsString;
    folhaCadastral.profissao := Dados.cdsFolhaCadastral.FieldByName('profissao').AsString;
    folhaCadastral.sabe_assinar := Dados.cdsFolhaCadastral.FieldByName('sabe_assinar').AsBoolean;
    folhaCadastral.sequencia := Dados.cdsFolhaCadastral.FieldByName('sequencia').AsString;
    folhaCadastral.tp_documento := Dados.cdsFolhaCadastral.FieldByName('tp_documento').AsString;
    folhaCadastral.tp_pessoa := Dados.cdsFolhaCadastral.FieldByName('tp_pessoa').AsString;
    folhaCadastral.orgao_expedidor := Dados.cdsFolhaCadastral.FieldByName('orgao_expedidor').AsString;
    folhaCadastral.folha_proprietario := Dados.cdsFolhaCadastral.FieldByName('folha_proprietario').AsBoolean;
    folhaCadastral.Persistir(novo);

    if not Dados.cdsFolhaCadastral.FieldByName('folha_proprietario').AsBoolean and novo then
    begin
      GravaVinculoFolhaCadastralConjuge(Dados.cdsFolhaCadastral.FieldByName('id_geral').AsLargeInt);
      Exit;
    end;
    GravaFolhaCadastralEstadoCivil(folhaCadastral.id_geral);
    GravaFolhaCadastralEndereco(folhaCadastral.id_geral);
//    Conexao.Commit;
  finally
    folhaCadastral.Free;
  end;
end;

procedure TManipuladorFolhaCadastral.GravaFolhaCadastralEndereco(IdFolhaCadastral: Int64);
var
  persistencia: TFOLHA_CADASTRAL_ENDERECO;
  novo: Boolean;
begin
  persistencia := TFOLHA_CADASTRAL_ENDERECO.Create(Conexao);

  try
    novo := not persistencia.Pesquisar(Dados.cdsFolhaCadastralEndereco.FieldByName('id_geral').AsLargeInt);
    persistencia.bairro := Dados.cdsFolhaCadastralEndereco.FieldByName('bairro').AsString;
    persistencia.cd_cidade := Dados.cdsFolhaCadastralEndereco.FieldByName('cd_cidade').AsInteger;
    persistencia.id_folha_cadastral := IdFolhaCadastral;
    persistencia.logradouro := Dados.cdsFolhaCadastralEndereco.FieldByName('logradouro').AsString;
    persistencia.numero := Dados.cdsFolhaCadastralEndereco.FieldByName('numero').AsString;
    persistencia.Persistir(novo);
  finally
    persistencia.Free;
  end;
end;

procedure TManipuladorFolhaCadastral.GravaFolhaCadastralEstadoCivil(IdFolhaCadastral: Int64);
var
  persistencia: TFOLHA_CADASTRAL_ESTADO_CIVIL;
  novo: Boolean;
begin
  persistencia := TFOLHA_CADASTRAL_ESTADO_CIVIL.Create(Conexao);
  try
    novo := not persistencia.Buscar('id_folha_cadastral', IdFolhaCadastral.ToString);
    persistencia.id_folha_cadastral := IdFolhaCadastral;
    persistencia.cd_estado_civil := Dados.cdsFolhaCadEstadoCivil.FieldByName('cd_estado_civil').AsInteger;
    persistencia.Persistir(novo);
    GravaFolhaCadastralEstadoCivilCertidoes(persistencia.id_geral);
  finally
    persistencia.Free;
  end;
end;

procedure TManipuladorFolhaCadastral.GravaFolhaCadastralEstadoCivilCertidoes(IdFolhaEstadoCivil: Int64);
var
  persistencia: TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES;
  novo: Boolean;
begin
  persistencia := TFOLHA_CADASTRAL_ESTADO_CIVIL_CERTIDOES.Create(Conexao);
  try
    Dados.cdsFolhaCadEstadoCivilCert.LoopSimples(
    procedure
    begin
      novo := not persistencia.Pesquisar(IdFolhaEstadoCivil,
                                         Dados.cdsFolhaCadEstadoCivilCert.FieldByName('nr_certidao').AsString,
                                         Dados.cdsFolhaCadEstadoCivilCert.FieldByName('folhas').AsString,
                                         Dados.cdsFolhaCadEstadoCivilCert.FieldByName('livro').AsString);

      persistencia.id_folha_cadastral_estado_civil := IdFolhaEstadoCivil;
      persistencia.nr_certidao := Dados.cdsFolhaCadEstadoCivilCert.FieldByName('nr_certidao').AsString;
      persistencia.folhas := Dados.cdsFolhaCadEstadoCivilCert.FieldByName('folhas').AsString;
      persistencia.livro := Dados.cdsFolhaCadEstadoCivilCert.FieldByName('livro').AsString;
      persistencia.data := Dados.cdsFolhaCadEstadoCivilCert.FieldByName('data').AsDateTime;
      persistencia.cartorio := Dados.cdsFolhaCadEstadoCivilCert.FieldByName('cartorio').AsString;
      persistencia.nr_sentenca_autos := Dados.cdsFolhaCadEstadoCivilCert.FieldByName('nr_sentenca_autos').AsString;
      persistencia.juizo := Dados.cdsFolhaCadEstadoCivilCert.FieldByName('juizo').AsString;
      persistencia.possui_pacto_antenupcial := Dados.cdsFolhaCadEstadoCivilCert.FieldByName('possui_pacto_antenupcial').AsBoolean;
      persistencia.uniao_estavel_desde := Dados.cdsFolhaCadEstadoCivilCert.FieldByName('uniao_estavel_desde').AsString;

      persistencia.Persistir(novo);
    end);
  finally
    persistencia.Free;
  end;
end;

procedure TManipuladorFolhaCadastral.GravaVinculoFolhaCadastralConjuge(IdFolhaCadastral: Int64);
var
  persistencia: TFOLHA_CADASTRAL_CONJUGE;
  novo: Boolean;
begin
  persistencia := TFOLHA_CADASTRAL_CONJUGE.Create(Conexao);

  try
    novo := not persistencia.Pesquisar(Dados.cdsConjuge.FieldByName('id_geral').AsLargeInt);
    persistencia.id_folha_cadastral := IdFolhaCadastral;
    persistencia.Persistir(novo);
  finally
    persistencia.Free;
  end;
end;

procedure TManipuladorFolhaCadastral.SetDados(const Value: TDmFolhaCadastral);
begin
  FDados := Value;
end;

end.
