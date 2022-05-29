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