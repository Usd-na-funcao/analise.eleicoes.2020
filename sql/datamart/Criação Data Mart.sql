
USE Eleicoes2020;
GO

-- =========================================
-- DIMENSÕES
-- =========================================

-- 1. DIMENSÃO MUNICÍPIO
IF OBJECT_ID('dm.dim_municipio', 'U') IS NULL
BEGIN
    CREATE TABLE dm.dim_municipio (
        id_municipio INT IDENTITY(1,1) PRIMARY KEY,
        cd_municipio INT,
        nm_municipio NVARCHAR(150),
        sg_uf NVARCHAR(2)
    );
END;
GO

-- 2. DIMENSÃO SEÇÃO
IF OBJECT_ID('dm.dim_secao', 'U') IS NULL
BEGIN
    CREATE TABLE dm.dim_secao (
        id_secao INT IDENTITY(1,1) PRIMARY KEY,
        id_municipio INT NOT NULL,
        nr_zona INT,
        nr_secao INT,
        nr_local_votacao INT,
        nm_local_votacao NVARCHAR(200),

        FOREIGN KEY (id_municipio)
        REFERENCES dm.dim_municipio(id_municipio)
    );
END;
GO

-- 3. DIMENSÃO CANDIDATO
IF OBJECT_ID('dm.dim_candidato', 'U') IS NULL
BEGIN
    CREATE TABLE dm.dim_candidato (
        id_candidato INT IDENTITY(1,1) PRIMARY KEY,
        sq_candidato BIGINT,
        nr_candidato INT,
        nm_candidato NVARCHAR(200),
        nm_urna_candidato NVARCHAR(200),
        ds_genero NVARCHAR(100),
        ds_grau_instrucao NVARCHAR(150),
        ds_cor_raca NVARCHAR(100),
        id_partido INT NULL
    );
END;
GO

-- 4. DIMENSÃO PARTIDO
IF OBJECT_ID('dm.dim_partido', 'U') IS NULL
BEGIN
    CREATE TABLE dm.dim_partido (
        id_partido INT IDENTITY(1,1) PRIMARY KEY,
        nr_partido INT,
        sg_partido NVARCHAR(20),
        nm_partido NVARCHAR(150)
    );
END;
GO

-- 5. DIMENSÃO CARGO
IF OBJECT_ID('dm.dim_cargo', 'U') IS NULL
BEGIN
    CREATE TABLE dm.dim_cargo (
        id_cargo INT IDENTITY(1,1) PRIMARY KEY,
        cd_cargo INT,
        ds_cargo NVARCHAR(150)
    );
END;
GO

-- 6. DIMENSÃO PERFIL DO ELEITOR
IF OBJECT_ID('dm.dim_perfil_eleitor', 'U') IS NULL
BEGIN
    CREATE TABLE dm.dim_perfil_eleitor (
        id_perfil INT IDENTITY(1,1) PRIMARY KEY,
        ds_genero NVARCHAR(100),
        ds_estado_civil NVARCHAR(100),
        ds_faixa_etaria NVARCHAR(100),
        ds_grau_escolaridade NVARCHAR(150),
        ds_raca_cor NVARCHAR(100),
        ds_identidade_genero NVARCHAR(100)
    );
END;
GO

-- RELACIONAMENTO ENTRE CANDIDATO E PARTIDO
IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_dim_candidato_partido'
)
BEGIN
    ALTER TABLE dm.dim_candidato
    ADD CONSTRAINT FK_dim_candidato_partido
    FOREIGN KEY (id_partido)
    REFERENCES dm.dim_partido(id_partido);
END;
GO

-- =========================================
-- TABELAS DE FATOS
-- =========================================

-- 7. FATO VOTOS
IF OBJECT_ID('dm.fato_votos', 'U') IS NULL
BEGIN
    CREATE TABLE dm.fato_votos (
        id_fato_voto BIGINT IDENTITY(1,1) PRIMARY KEY,
        id_secao INT NOT NULL,
        id_municipio INT NOT NULL,
        id_candidato INT NULL,
        id_partido INT NULL,
        id_cargo INT NOT NULL,
        nr_turno INT,
        cd_tipo_votavel INT,
        nr_votavel INT,
        nm_votavel NVARCHAR(200),
        qt_votos INT,

        FOREIGN KEY (id_secao)
        REFERENCES dm.dim_secao(id_secao),

        FOREIGN KEY (id_municipio)
        REFERENCES dm.dim_municipio(id_municipio),

        FOREIGN KEY (id_candidato)
        REFERENCES dm.dim_candidato(id_candidato),

        FOREIGN KEY (id_partido)
        REFERENCES dm.dim_partido(id_partido),

        FOREIGN KEY (id_cargo)
        REFERENCES dm.dim_cargo(id_cargo)
    );
END;
GO

-- 8. FATO COMPARECIMENTO
IF OBJECT_ID('dm.fato_comparecimento', 'U') IS NULL
BEGIN
    CREATE TABLE dm.fato_comparecimento (
        id_fato_comparecimento BIGINT IDENTITY(1,1) PRIMARY KEY,
        id_secao INT NOT NULL,
        id_municipio INT NOT NULL,
        nr_turno INT,
        qt_aptos INT,
        qt_comparecimento INT,
        qt_abstencoes INT,

        FOREIGN KEY (id_secao)
        REFERENCES dm.dim_secao(id_secao),

        FOREIGN KEY (id_municipio)
        REFERENCES dm.dim_municipio(id_municipio)
    );
END;
GO

-- 9. FATO ELEITORADO
IF OBJECT_ID('dm.fato_eleitorado', 'U') IS NULL
BEGIN
    CREATE TABLE dm.fato_eleitorado (
        id_fato_eleitorado BIGINT IDENTITY(1,1) PRIMARY KEY,
        id_secao INT NOT NULL,
        id_municipio INT NOT NULL,
        id_perfil INT NOT NULL,
        qt_eleitores_perfil INT,
        qt_eleitores_biometria INT,
        qt_eleitores_deficiencia INT,
        qt_eleitores_inc_nm_social INT,

        FOREIGN KEY (id_secao)
        REFERENCES dm.dim_secao(id_secao),

        FOREIGN KEY (id_municipio)
        REFERENCES dm.dim_municipio(id_municipio),

        FOREIGN KEY (id_perfil)
        REFERENCES dm.dim_perfil_eleitor(id_perfil)
    );
END;
GO
