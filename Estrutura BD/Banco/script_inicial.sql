CREATE DATABASE avaliacao_imoveis;

CREATE OR REPLACE FUNCTION public.func_grava_dt_atz()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$ 
BEGIN 
	NEW.DT_ATZ = clock_timestamp(); 
	RETURN NEW; 
END;
$function$
;

CREATE OR REPLACE FUNCTION public.func_id_geral()
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
            DECLARE
              RESULTADO BIGINT;
            BEGIN
                /*Gera o id_geral */
                SELECT NEXTVAL(PG_CLASS.OID)
                INTO RESULTADO
                FROM PG_CLASS
                WHERE RELNAME = 'seq_id_geral';
            RETURN RESULTADO + 1000000000000;
            END
            $function$;
			
CREATE SEQUENCE public.seq_id_geral
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;			
           

CREATE TABLE estado(
	uf varchar(2) NOT NULL,
	nm_uf varchar(50) NOT NULL,
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_estados PRIMARY KEY (uf)
);
CREATE TRIGGER trg_estado BEFORE
INSERT
    OR
UPDATE
    ON
    public.estado FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE public.pais (
	cd_pais int4 NOT NULL,
	nm_pais varchar(80) NOT NULL,
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_pais PRIMARY KEY (cd_pais)
);
CREATE TRIGGER trg_pais BEFORE
INSERT
    OR
UPDATE
    ON
    public.pais FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE public.cidade (
	cd_cidade int4 NOT NULL,
	nm_cidade varchar(40) NOT NULL,
	uf varchar(2) NOT NULL,
	dt_atz timestamp(0) NULL DEFAULT now(),
	cep varchar(8) NULL,
	cd_ibge int4 NULL,
	cd_pais int4 NULL,
	CONSTRAINT pk_cidade PRIMARY KEY (cd_cidade),
	CONSTRAINT fk_cidade_cd_pais FOREIGN KEY (cd_pais) REFERENCES pais(cd_pais) ON UPDATE CASCADE,
	CONSTRAINT fk_cidade_estado FOREIGN KEY (uf) REFERENCES estado(uf) ON UPDATE CASCADE
);
CREATE TRIGGER trg_cidade BEFORE
INSERT
    OR
UPDATE
    ON
    public.cidade FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE public.folha_cadastral (
	id_geral int8 NOT NULL,
	nome varchar(100) NOT NULL,
	dt_nascimento date NOT NULL,
	cd_cidade_naturalidade int4 NOT NULL,
	profissao varchar(50) NOT NULL,
	tp_pessoa varchar(1) NOT NULL,
	cpf_cnpj varchar(15) NOT NULL,
	tp_documento varchar(5) NOT NULL,
	ie_rg varchar(18) NOT NULL,
	sabe_assinar bool NULL,
	nome_pai varchar(100) NOT NULL,
	nome_mae varchar(100) NOT NULL,
	email varchar(50) NULL DEFAULT ''::character varying,
	dt_cadastro date NOT NULL,
	obs text NULL DEFAULT ''::text,
	localidade varchar(50) NULL,
	nm_cadastrador varchar(50) NULL,
	obra varchar(10) NULL,
	sequencia varchar(10) NULL,
	cd_municipio int4 NULL,
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_folha_cadastral PRIMARY KEY (id_geral),
	CONSTRAINT fk_folha_cadastral FOREIGN KEY (cd_cidade_naturalidade) REFERENCES public.cidade(cd_cidade) ON UPDATE CASCADE,
	CONSTRAINT fk_folha_cadastral_cidade FOREIGN KEY (cd_municipio) REFERENCES public.cidade(cd_cidade)
);
CREATE TRIGGER trg_folha_cadastral BEFORE
INSERT
    OR
	UPDATE
    ON
    public.folha_cadastral FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();
COMMENT ON COLUMN folha_cadastral.tp_documento IS 'CI-Carteira Identidade; CT-CTPS; CP-Carteira Profissional; IE-Inscrição Estadual';
COMMENT ON COLUMN folha_cadastral.tp_pessoa IS 'F-Fisica; J-Juridica';

CREATE TABLE folha_cadastral_endereco(
	id_geral int8 NOT NULL,
	id_folha_cadastral int8 NOT NULL,
	logradouro varchar(100) NOT NULL,
	numero varchar(10) NOT NULL,
	cd_cidade int4 NOT NULL,
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_folha_cadastral_endereco PRIMARY KEY (id_geral),
	CONSTRAINT fk_folha_cadastral_endereco_folha_cadastral FOREIGN KEY (id_folha_cadastral) REFERENCES folha_cadastral(id_geral) ON DELETE CASCADE,
	CONSTRAINT fk_folha_cadastral_endereco_cidade FOREIGN KEY (cd_cidade) REFERENCES cidade(cd_cidade) ON UPDATE CASCADE
);
CREATE TRIGGER trg_folha_cadastral_endereco BEFORE
INSERT
    OR
UPDATE
    ON
    public.folha_cadastral_endereco FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE folha_cadastral_telefone(
	id_geral int8 NOT NULL,
	id_folha_cadastral int8 NOT NULL,
	nr_telefone varchar(20) DEFAULT '',
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_folha_cadastral_telefone PRIMARY KEY (id_geral),
	CONSTRAINT fk_folha_cadastral_telefone FOREIGN KEY (id_folha_cadastral) REFERENCES folha_cadastral(id_geral) ON DELETE CASCADE
);
CREATE TRIGGER trg_folha_cadastral_telefone BEFORE
INSERT
    OR
UPDATE
    ON
    public.folha_cadastral_telefone FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE estado_civil(
	cd_estado_civil int4 NOT NULL,
	nm_estado_civil varchar(50) NOT NULL,
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_estado_civil PRIMARY KEY (cd_estado_civil)
);
CREATE TRIGGER trg_estado_civil BEFORE
INSERT
    OR
UPDATE
    ON
    public.estado_civil FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

INSERT INTO estado_civil (cd_estado_civil, nm_estado_civil) VALUES (1, 'Solteiro'), (2, 'Casado Regime Comunhão Universal de Bens'),(3, 'Casado Regime Comunhão Parcial de Bens'),(4, 'Casado Regime Separação de Bens'),(5, 'Separado Judicialmente'),(6, 'Divorciado'),
(7, 'União Estável'), (8, 'Viúvo');


CREATE TABLE folha_cadastral_estado_civil(
	id_geral int8 NOT NULL,
	id_folha_cadastral int8 NOT NULL,
	cd_estado_civil int4 NOT NULL,
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_folha_cadastral_estado_civil PRIMARY KEY (id_geral),
	CONSTRAINT fk_folha_cadastral_estado_civil FOREIGN KEY (id_folha_cadastral) REFERENCES folha_cadastral(id_geral) ON DELETE CASCADE
);
CREATE TRIGGER trg_folha_cadastral_estado_civil BEFORE
INSERT
    OR
UPDATE
    ON
    public.folha_cadastral_estado_civil FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE folha_cadastral_estado_civil_certidoes(
	id_geral int8 NOT NULL,
	id_folha_cadastral_estado_civil int8 NOT NULL,
	nr_certidao varchar(15),
	folhas varchar(10),
	livro varchar(5),
	DATA date,
	cartorio varchar(100),
	nr_sentenca_autos varchar(100),
	juizo varchar(100),
	possui_pacto_antenupcial bool DEFAULT FALSE,
	uniao_estavel_desde varchar(10),
	dt_atz timestamp(0) NULL DEFAULT now(),	
	CONSTRAINT pk_folha_cadastral_estado_civil_certidoes PRIMARY KEY (id_geral),
	CONSTRAINT fk_folha_cadastral_estado_civil_certidoes_folha_cadastral FOREIGN KEY (id_folha_cadastral_estado_civil) REFERENCES folha_cadastral_estado_civil(id_geral) ON DELETE CASCADE
);
CREATE TRIGGER trg_folha_cadastral_estado_civil_certidoes BEFORE
INSERT
    OR
UPDATE
    ON
    public.folha_cadastral_estado_civil_certidoes FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE folha_cadastral_conjuge(
	id_geral int8 NOT NULL,
	id_folha_cadastral int8 NOT NULL,
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_folha_cadastral_conjuge PRIMARY KEY (id_geral),
	CONSTRAINT fk_folha_cadastral_conjuge_folha_cadastral FOREIGN KEY (id_folha_cadastral) REFERENCES folha_cadastral(id_geral) ON DELETE CASCADE
);
CREATE TRIGGER trg_folha_cadastral_conjuge BEFORE
INSERT
    OR
UPDATE
    ON
    public.folha_cadastral_conjuge FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE folha_cadastral_outras_informacoes(
	id_geral int8 NOT NULL,
	id_folha_cadastral int8 NOT NULL,
	proprietario_ocupante_unico bool DEFAULT FALSE,
	nr_proprietarios_ocupantes int4,
	tempo_ocupacao int4,
	espolio bool DEFAULT FALSE,
	nm_inventariante varchar(100),
	juizo varchar(100),
	nm_advogado varchar(100),
	endereco varchar(100),
	telefone varchar(15),
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_folha_cadastral_outras_informacoes PRIMARY KEY (id_geral),
	CONSTRAINT fk_folha_cadastral_outras_informacoes_folha_cadastral FOREIGN KEY (id_folha_cadastral) REFERENCES folha_cadastral(id_geral) ON DELETE CASCADE
);
CREATE TRIGGER trg_folha_cadastral_outras_informacoes BEFORE
INSERT
    OR
UPDATE
    ON
    public.folha_cadastral_outras_informacoes FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE folha_cadastral_dados_imovel(
	id_geral int8 NOT NULL,
	id_folha_cadastral int8 NOT NULL,
	localizacao TEXT,
	distrito varchar(100),
	cd_municipio int4,
	cd_comarca int4,
	denominacao_regiao TEXT,
	identificacao_fundiaria TEXT,
	latitude varchar(15),
	longitude varchar(15),
	area_total numeric(12, 4) DEFAULT 0,
	area_atingida numeric(12, 4) DEFAULT 0,
	proprietario_anterior varchar(100),
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_folha_cadastral_dados_imovel PRIMARY KEY (id_geral),
	CONSTRAINT fk_folha_cadastral_dados_imovel_folha_cadastral FOREIGN KEY (id_folha_cadastral) REFERENCES folha_cadastral(id_geral) ON DELETE CASCADE,
	CONSTRAINT fk_folha_cadastral_dados_imovel_cidade FOREIGN KEY (cd_municipio) REFERENCES cidade(cd_cidade) ON UPDATE CASCADE,
	CONSTRAINT fk_folha_cadastral_dados_imovel_cidade2 FOREIGN KEY (cd_comarca) REFERENCES cidade(cd_cidade) ON UPDATE CASCADE 
);
CREATE TRIGGER trg_folha_cadastral_dados_imovel BEFORE
INSERT
    OR
UPDATE
    ON
    public.folha_cadastral_dados_imovel FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();
   
CREATE TABLE folha_cadastral_dados_imovel_documentos(
	id_geral int8 NOT NULL,
	id_folha_cadastral_dados_imovel int8 NOT NULL,
	cd_comarca int4,
	oficio int4,
	nr_matricula varchar(15),
	nr_livro varchar(5),
	nr_folha varchar(10),
	area_total numeric(12, 4) DEFAULT 0,
	area_reserva_averbada numeric(12, 4) DEFAULT 0,
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_folha_cadastral_dados_imovel_documentos PRIMARY KEY (id_geral),
	CONSTRAINT fk_folha_cadastral_dados_imovel_documentos_folha_cadastral FOREIGN KEY (id_folha_cadastral_dados_imovel) REFERENCES folha_cadastral_dados_imovel(id_geral) ON DELETE CASCADE,
	CONSTRAINT fk_folha_cadastral_dados_imovel_documentos_cidade2 FOREIGN KEY (cd_comarca) REFERENCES cidade(cd_cidade) ON UPDATE CASCADE 
);
CREATE TRIGGER trg_folha_cadastral_dados_imovel_documentos BEFORE
INSERT
    OR
UPDATE
    ON
    public.folha_cadastral_dados_imovel_documentos FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE folha_cadastral_dados_imovel_documentos_federal(
	id_geral int8 NOT NULL,
	id_folha_cadastral_dados_imovel int8 NOT NULL,
	nirf varchar(13),
	ccir varchar(13),
	nr_modulos int4,
	modulo varchar(15),
	fmp numeric(8,4),
	area_ha numeric(12,4),
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_folha_cadastral_dados_imovel_documentos_federal PRIMARY KEY (id_geral),
	CONSTRAINT fk_folha_cadastral_dados_imovel_documentos_federal_folha_cadastral_dados_imovel FOREIGN KEY (id_folha_cadastral_dados_imovel) REFERENCES folha_cadastral_dados_imovel(id_geral) ON DELETE CASCADE
);
CREATE TRIGGER trg_folha_cadastral_dados_imovel_documentos_federal BEFORE
INSERT
    OR
UPDATE
    ON
    public.folha_cadastral_dados_imovel_documentos_federal FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE folha_cadastral_dados_imovel_documentos_ocupante(
	id_geral int8 NOT NULL,
	id_folha_cadastral_dados_imovel int8 NOT NULL,
	tipo_documento varchar(50),
	nm_transmitente varchar(100),
	nm_testemunhas varchar(100),
	dt_compra date,
	area_ha numeric(12,4),
	dt_atz timestamp(0) NULL DEFAULT now(),
	CONSTRAINT pk_folha_cadastral_dados_imovel_documentos_ocupante PRIMARY KEY (id_geral),
	CONSTRAINT fk_folha_cadastral_dados_imovel_documentos_ocupante_folha_cadastral_dados_imovel FOREIGN KEY (id_folha_cadastral_dados_imovel) REFERENCES folha_cadastral_dados_imovel(id_geral) ON DELETE CASCADE
);
CREATE TRIGGER trg_folha_cadastral_dados_imovel_documentos_ocupante BEFORE
INSERT
    OR
UPDATE
    ON
    public.folha_cadastral_dados_imovel_documentos_ocupante FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();
	
	
ALTER TABLE public.folha_cadastral_estado_civil_certidoes ADD CONSTRAINT folha_cadastral_estado_civil_certidoes_un UNIQUE (id_folha_cadastral_estado_civil,nr_certidao,folhas,livro);	

CREATE TABLE obras (
	cd_obra int4 NOT NULL,
	nm_obra varchar(100),
	dt_atz timestamp,
	CONSTRAINT pk_obras PRIMARY KEY (cd_obra));
	
CREATE TRIGGER trg_obras BEFORE
INSERT
    OR
UPDATE
    ON
    public.obras FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();
	
ALTER TABLE public.folha_cadastral RENAME COLUMN obra TO cd_obra;
ALTER TABLE public.folha_cadastral ALTER COLUMN cd_obra TYPE int4 USING cd_obra::int4;
ALTER TABLE public.folha_cadastral ALTER COLUMN cd_obra SET NOT NULL;
ALTER TABLE public.folha_cadastral ADD CONSTRAINT folha_cadastral_fk FOREIGN KEY (cd_obra) REFERENCES public.obras(cd_obra);

ALTER TABLE public.folha_cadastral_endereco ADD bairro varchar(100) NULL;
ALTER TABLE folha_cadastral ADD COLUMN orgao_expedidor varchar(10) DEFAULT '';
ALTER TABLE folha_cadastral ADD COLUMN folha_proprietario Bool;

CREATE TABLE levantamento_fisico_benfeitorias(
	id_geral int8 NOT NULL,
	cd_obra int4 NOT NULL,
    id_folha_cadastral_proprietario int8 NOT NULL,
    id_folha_cadastral_beneficiario int8 NOT NULL,
    sequencia varchar(10) NOT NULL,
    localizacao varchar(10),
    nr_laudo varchar(20),
    dt_levantamento date,
    acessibilidade int4,
    cd_centro_consumidor int4,
    distancia_centro_consumidor int4,
    nivel_manejo int4,
    dt_atz timestamp,
    CONSTRAINT pk_levantamento_fisico_benfeitorias PRIMARY KEY (id_geral),
    CONSTRAINT fk_levantamento_fisico_benfeitorias_obra FOREIGN KEY (cd_obra) REFERENCES obras(cd_obra) ON UPDATE CASCADE,
    CONSTRAINT fk_levantamento_fisico_benfeitorias_cidade FOREIGN KEY (cd_centro_consumidor) REFERENCES cidade(cd_cidade) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_levantamento_fisico_benfeitorias_folha_cad FOREIGN KEY (id_folha_cadastral_proprietario) REFERENCES folha_cadastral (id_geral),
    CONSTRAINT fk_levantamento_fisico_benfeitorias_folha_cad2 FOREIGN KEY (id_folha_cadastral_beneficiario) REFERENCES folha_cadastral (id_geral)
);
CREATE TRIGGER trg_levantamento_fisico_benfeitorias BEFORE
INSERT
    OR
UPDATE
    ON
    public.levantamento_fisico_benfeitorias FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();
COMMENT ON COLUMN levantamento_fisico_benfeitorias.acessibilidade IS '0-Ótima; 1-Muito Boa; 2-Boa; 3-Regular; 4-Ruim';
COMMENT ON COLUMN levantamento_fisico_benfeitorias.distancia_centro_consumidor IS '0-Muito Próximo(Até 5 KM); 1-Próximo (de 6 a 15 Km); 2-Distante (de 6 a 15 Km); 3-Muito Distante (acima de 30 Km)';
COMMENT ON COLUMN levantamento_fisico_benfeitorias.nivel_manejo IS '0-Avançado; 1-Semi-Avançado; 2-Tradicional; 3-Primitivo; 4-Improdutivo';


CREATE TABLE public.benfeitorias_reprodutivas (
	id_benfeitoria int4 not NULL,
	cd_benfeitoria varchar(100) NOT NULL,
	nm_benfeitoria varchar(100) NOT NULL,
	un_medida_padrao varchar(10) NOT NULL,
	dt_atz timestamp NULL,
	CONSTRAINT pk_benfeitorias_reprodutivas PRIMARY KEY (id_benfeitoria)
);

CREATE TRIGGER trg_benfeitorias_reprodutivas BEFORE
INSERT
    OR
UPDATE
    ON
    public.benfeitorias_reprodutivas FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();


INSERT INTO benfeitorias_reprodutivas (id_benfeitoria, cd_benfeitoria, nm_benfeitoria, un_medida_padrao)
VALUES (1,'1', 'Abacateiro', 'UN'),
(2,'2', 'Abacaxizeiro','UN'),
(3,'3', 'Açaizeiro','UN'),
(4,'4', 'Acerola','UN'),
(5,'5', 'Amoreira','UN'),
(6,'6', 'Araçazeiro','UN'),
(7,'7', 'Araticum','UN'),
(8,'8', 'Bananeira','UN'),
(9,'9', 'Cacaueiro','UN'),
(10,'10', 'Cafeeiro','UN'),
(11,'11', 'Cajueiro','UN'),
(12,'12', 'Caramboleira','UN'),
(13,'13', 'Cerejeira','UN'),
(14,'14', 'Citricas','UN'),
(15,'15', 'Coqueiro','UN'),
(16,'16', 'Cupuaçu','UN'),
(17,'17', 'Goiabeira','UN'),
(18,'18', 'Grupo 1','UN'),
(19,'19', 'Grupo 2','UN'),
(20,'20', 'Grupo 3','UN'),
(21,'21', 'Ingazeiro','UN'),
(22,'22', 'Jaboticabeiro','UN'),
(23,'23', 'Mamoeiro','UN'),
(24,'24', 'Mangueira','UN'),
(25,'25', 'Maracujazeiro','UN'),
(26,'26', 'Pitombeira','UN'),
(27,'27', 'Pupunheira','UN'),
(28,'28', 'Tucumã/Jambo/Jamelão','UN'),
(29,'29', 'Uxi','UN'),
(30,'30', 'Videira','UN'),
(31,'31', 'Cana-de-Açucar Tradicional','ha'),
(32,'32', 'Cana-de-Açucar Tecnificada','ha'),
(33,'33', 'Planta Ornamental Porte Baixo/Medio - Muda','UN'),
(34,'34', 'Planta Ornamental Porte Baixo/Medio - Adulta','UN'),
(35,'35', 'Planta Ornamental Porte Alto - Muda','UN'),
(36,'36', 'Planta Ornamental Porte Alto - Adulta','UN'),
(37,'37', 'Desmatamento Manual','ha'),
(38,'38', 'Desmatamento Mecanizado','ha'),
(39,'39', 'Capineira','ha'),
(40,'40', 'Estrela Africana','ha'),
(41,'41', 'Grama Jesuita','ha'),
(42,'42', 'Capim Colonhão','ha'),
(43,'43', 'Brachiaria','ha'),
(44,'44', 'Quicuiu','ha'),
(45,'45', 'Andropogon','ha'),
(46,'46', 'Tanzania','ha'),
(47,'47', 'Mombaça','ha'),
(48,'48', 'Cedro/Louro - Beneficiamento','m3'),
(49,'49', 'Pinheiro - Beneficiamento','m3'),
(50,'50', 'Imbuia - Beneficiamento','m3'),
(51,'51', 'Madeira de Lei - Beneficiamento','m3'),
(52,'52', 'Madeira Branca - Beneficiamento','m3'),
(53,'53', 'Lenha - Beneficiamento','m3'),
(54,'54', 'Pinus - Beneficiamento','m3'),
(55,'55', 'Eucalipto - Beneficiamento','m3'),
(56,'56', 'Lenha Reflorestamento - Beneficiamento','m3'),
(57,'57', 'Pinheiro Nativo','UN'),
(58,'58', 'Pinheiro Reflorestamento','UN'),
(59,'59', 'Madeira de Lei - Reflorestamento','UN'),
(60,'60', 'Madeira Branca - Reflorestamento','UN'),
(61,'61', 'Pinus - Reflorestamento','UN'),
(62,'62', 'Eucalipto - Reflorestamento','UN');

   
CREATE TABLE tabela_preco(
	cd_tabela int4 NOT NULL,
	nm_tabela varchar(100) NOT NULL,
	cd_obra int4 NOT NULL,
	ativo bool,
	dt_inicial date,
	dt_final date,
	dt_atz timestamp,
	CONSTRAINT pk_tabela_preco PRIMARY KEY (cd_tabela),
	CONSTRAINT fk_tabela_preco_obra FOREIGN KEY (cd_obra) REFERENCES obras (cd_obra)
);

CREATE TRIGGER trg_tabela_preco BEFORE
INSERT
    OR
UPDATE
    ON
    public.tabela_preco FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE tabela_preco_benfeitorias(
	id_geral int8 NOT NULL,
	cd_tabela int4 NOT NULL,
	id_benfeitoria int4 NOT NULL,
	preco NUMERIC(12,4) DEFAULT 0,
	un_medida varchar(10),
	dt_atz timestamp,
	CONSTRAINT pk_tabela_preco_benfeitorias PRIMARY KEY (id_geral),
	CONSTRAINT fk_tabela_preco_benfeitorias FOREIGN KEY (cd_tabela) REFERENCES tabela_preco (cd_tabela) ON DELETE CASCADE,
	CONSTRAINT uk_tabela_preco_benfeitorias UNIQUE (cd_tabela, id_benfeitoria, un_medida)
);
ALTER TABLE public.tabela_preco_benfeitorias ADD CONSTRAINT tabela_preco_benfeitorias_fk FOREIGN KEY (id_benfeitoria) REFERENCES public.benfeitorias_reprodutivas(id_benfeitoria);

CREATE TRIGGER trg_tabela_preco_benfeitorias BEFORE
INSERT
    OR
UPDATE
    ON
    public.tabela_preco_benfeitorias FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();

CREATE TABLE levantamento_fisico_benfeitorias_reprodutivas(
	id_geral int8 NOT NULL,
	id_levantamento_fisico_benfeitorias int8 NOT NULL,
	id_benfeitoria int4 NOT NULL,
	un_medida varchar(10) NOT NULL,
	quantidade numeric(12,4) NOT NULL,
	idade numeric(8, 4) NOT NULL,
	tp_cultivo int4 NOT NULL,
	dt_atz timestamp,
	CONSTRAINT pk_levantamento_fisico_benfeitorias_reprodutivas PRIMARY KEY (id_geral),
	CONSTRAINT fk_levantamento_fisico_benfeitorias_reprodutivas_lf FOREIGN KEY (id_levantamento_fisico_benfeitorias) REFERENCES levantamento_fisico_benfeitorias(id_geral),
	CONSTRAINT fk_levantamento_fisico_benfeitorias_reprodutivas_benf FOREIGN KEY (id_benfeitoria) REFERENCES benfeitorias_reprodutivas(id_benfeitoria)
);

CREATE TRIGGER trg_levantamento_fisico_benfeitorias_reprodutivas BEFORE
INSERT
    OR
UPDATE
    ON
    public.levantamento_fisico_benfeitorias_reprodutivas FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();
COMMENT ON COLUMN levantamento_fisico_benfeitorias_reprodutivas.tp_cultivo IS '1-Nativo; 2-Tradicional; 3-Tecnificado';
   
CREATE TABLE avaliacao_terras(
	id_geral int8 NOT NULL,
	id_levantamento_fisico_benfeitorias int8 NOT NULL,
	desc_objetivo_laudo varchar(100),
	id_folha_cadastral_atribuido int4,
	nr_laudo varchar(20),
	fator_acessibilidade numeric(8,4),
	fator_manejo numeric(8,4),
	fator_distancia numeric(8,4),
	fator_homogeinizacao numeric(8,4),
	classe_solo varchar(5),
	area_classe numeric(12,4),
	area_total numeric(12,4),
	dt_avaliacao date,
	cd_usuario_avaliacao int4,
	dt_atz timestamp,
	CONSTRAINT pk_avaliacao_terras PRIMARY KEY (id_geral),
	CONSTRAINT fk_avaliacao_terras_levantamento_fisico_benfeitorias FOREIGN KEY (id_levantamento_fisico_benfeitorias) REFERENCES levantamento_fisico_benfeitorias(id_geral),
	CONSTRAINT fk_avaliacao_terras_folha_cadastral FOREIGN KEY (id_folha_cadastral_atribuido) REFERENCES folha_cadastral (id_geral)
);

CREATE TRIGGER trg_avaliacao_terras BEFORE
INSERT
    OR
UPDATE
    ON
    public.avaliacao_terras FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();
	
CREATE TABLE proprietarios_beneficiarios(
	cd_proprietario int4 NOT NULL,
	cd_beneficiario int4 NULL,
	nome varchar(100),
	id_folha_cadastral int8 NULL,
	dt_atz timestamp,
	CONSTRAINT pk_proprietarios_beneficiarios PRIMARY KEY (cd_proprietario),
	CONSTRAINT fk_proprietarios_beneficiarios_folha_cadastral FOREIGN KEY (id_folha_cadastral) REFERENCES folha_cadastral (id_geral)
);

CREATE TRIGGER trg_proprietarios_beneficiarios BEFORE
INSERT
    OR
UPDATE
    ON
    public.proprietarios_beneficiarios FOR EACH ROW EXECUTE FUNCTION func_grava_dt_atz();
	
ALTER TABLE public.levantamento_fisico_benfeitorias_reprodutivas ADD preco numeric(12, 4) DEFAULT 0;	