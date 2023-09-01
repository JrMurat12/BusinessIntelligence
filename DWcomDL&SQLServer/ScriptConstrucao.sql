
CREATE TABLE dbo.dim_tempo (
                id_dia INT IDENTITY(1,1) NOT NULL,
                cod_dia VARCHAR(25) NOT NULL,
                data DATETIME NOT NULL,
                atr_dia_semana VARCHAR(50) NOT NULL,
                atr_fim_de_semana BIT NOT NULL,
                cod_mes VARCHAR(25) NOT NULL,
                desc_mes VARCHAR(200) NOT NULL,
                cod_trimestre VARCHAR(25) NOT NULL,
                desc_trimestre VARCHAR(200) NOT NULL,
                cod_semestre VARCHAR(25) NOT NULL,
                desc_semestre VARCHAR(200) NOT NULL,
                cod_ano VARCHAR(25) NOT NULL,
                CONSTRAINT dim_tempo_pk PRIMARY KEY (id_dia)
)

CREATE TABLE dbo.dim_departamento (
                cod_setor VARCHAR(25) NOT NULL,
                desc_setor VARCHAR(200) NOT NULL,
                CONSTRAINT dim_departamento_pk PRIMARY KEY (cod_setor)
)

CREATE TABLE dbo.dim_fornecedor (
                cod_fornecedor VARCHAR(25) NOT NULL,
                desc_fornecedor VARCHAR(200) NOT NULL,
                CONSTRAINT dim_fornecedor_pk PRIMARY KEY (cod_fornecedor)
)

CREATE TABLE dbo.dim_produto (
                id_produto INT IDENTITY(1,1) NOT NULL,
                cod_produto VARCHAR(25) NOT NULL,
                desc_produto VARCHAR(200) NOT NULL,
                atr_unidade_medida VARCHAR(50) NOT NULL,
                cod_fornecedor VARCHAR(25) NOT NULL,
                cod_setor VARCHAR(25) NOT NULL,
                CONSTRAINT dim_produto_pk PRIMARY KEY (id_produto)
)

CREATE TABLE dbo.dim_cliente (
                id_cliente INT IDENTITY(1,1) NOT NULL,
                cod_cliente VARCHAR(25) NOT NULL,
                desc_cliente VARCHAR(200) NOT NULL,
                atr_tamanho_cliente VARCHAR(50) NOT NULL,
                cod_cidade VARCHAR(25) NOT NULL,
                desc_cidade VARCHAR(200) NOT NULL,
                cod_estado VARCHAR(25) NOT NULL,
                desc_estado VARCHAR(200) NOT NULL,
                cod_regiao VARCHAR(25) NOT NULL,
                desc_regiao VARCHAR(200) NOT NULL,
                cod_segmento VARCHAR(25) NOT NULL,
                desc_segmento VARCHAR(200) NOT NULL,
                CONSTRAINT dim_cliente_pk PRIMARY KEY (id_cliente)
)

CREATE TABLE dbo.dim_empresa (
                id_loja INT IDENTITY(1,1) NOT NULL,
                cod_loja VARCHAR(25) NOT NULL,
                desc_loja VARCHAR(200) NOT NULL,
                atr_tipo_loja VARCHAR(50) NOT NULL,
                cod_empresa VARCHAR(25) NOT NULL,
                desc_empresa VARCHAR(200) NOT NULL,
                CONSTRAINT dim_empresa_pk PRIMARY KEY (id_loja)
)

CREATE TABLE dbo.fact_venda (
                id_loja INT NOT NULL,
                id_cliente INT NOT NULL,
                id_produto INT NOT NULL,
                id_dia INT NOT NULL,
                quantidade_vendida FLOAT NOT NULL,
                valor_venda FLOAT NOT NULL,
                custo_venda FLOAT NOT NULL,
                CONSTRAINT fact_venda_pk PRIMARY KEY (id_loja, id_cliente, id_produto, id_dia)
)

ALTER TABLE dbo.fact_venda ADD CONSTRAINT dim_tempo_fact_venda_fk
FOREIGN KEY (id_dia)
REFERENCES dbo.dim_tempo (id_dia)

ALTER TABLE dbo.dim_produto ADD CONSTRAINT dim_departamento_dim_produto_fk
FOREIGN KEY (cod_setor)
REFERENCES dbo.dim_departamento (cod_setor)

ALTER TABLE dbo.dim_produto ADD CONSTRAINT dim_fornecedor_dim_produto_fk
FOREIGN KEY (cod_fornecedor)
REFERENCES dbo.dim_fornecedor (cod_fornecedor)

ALTER TABLE dbo.fact_venda ADD CONSTRAINT dim_produto_fact_venda_fk
FOREIGN KEY (id_produto)
REFERENCES dbo.dim_produto (id_produto)

ALTER TABLE dbo.fact_venda ADD CONSTRAINT dim_cliente_fact_venda_fk
FOREIGN KEY (id_cliente)
REFERENCES dbo.dim_cliente (id_cliente)

ALTER TABLE dbo.fact_venda ADD CONSTRAINT dim_empresa_fact_venda_fk
FOREIGN KEY (id_loja)
REFERENCES dbo.dim_empresa (id_loja)

SET IDENTITY_INSERT dim_cliente ON
GO

USE [DW_ATACADEZ]
GO

INSERT INTO [dbo].[dim_cliente]
           ([id_cliente]
           ,[cod_cliente]
           ,[desc_cliente]
           ,[atr_tamanho_cliente]
           ,[cod_cidade]
           ,[desc_cidade]
           ,[cod_estado]
           ,[desc_estado]
           ,[cod_regiao]
           ,[desc_regiao]
           ,[cod_segmento]
           ,[desc_segmento])
     VALUES
           (0
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND')
GO

SET IDENTITY_INSERT dim_cliente OFF
GO

USE [DW_ATACADEZ]
GO

INSERT INTO [dbo].[dim_departamento]
           ([cod_setor]
           ,[desc_setor])
     VALUES
           ('ND'
           ,'ND')
GO

USE [DW_ATACADEZ]
GO

INSERT INTO [dbo].[dim_fornecedor]
           ([cod_fornecedor]
           ,[desc_fornecedor])
     VALUES
           ('ND'
           ,'ND')
GO

SET IDENTITY_INSERT dim_produto ON
GO

USE [DW_ATACADEZ]
GO

INSERT INTO [dbo].[dim_produto]
           ([id_produto]
           ,[cod_produto]
           ,[desc_produto]
           ,[atr_unidade_medida]
           ,[cod_fornecedor]
           ,[cod_setor])
     VALUES
           (0
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND')
GO

SET IDENTITY_INSERT dim_produto OFF
GO

SET IDENTITY_INSERT dim_empresa ON
GO

USE [DW_ATACADEZ]
GO

INSERT INTO [dbo].[dim_empresa]
           ([id_loja]
           ,[cod_loja]
           ,[desc_loja]
           ,[atr_tipo_loja]
           ,[cod_empresa]
           ,[desc_empresa])
     VALUES
           (0
           ,'ND'
           ,'ND'
		   ,'ND'
           ,'ND'
           ,'ND')
GO

SET IDENTITY_INSERT dim_empresa OFF
GO

SET IDENTITY_INSERT dim_tempo ON
GO

USE [DW_ATACADEZ]
GO

INSERT INTO [dbo].[dim_tempo]
           ([id_dia]
           ,[cod_dia]
           ,[data]
           ,[atr_dia_semana]
           ,[atr_fim_de_semana]
           ,[cod_mes]
           ,[desc_mes]
           ,[cod_trimestre]
           ,[desc_trimestre]
           ,[cod_semestre]
           ,[desc_semestre]
           ,[cod_ano])
     VALUES
           (0
           ,'ND'
           ,'1900-01-01 00:00:00'
           ,'ND'
           ,0
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND'
           ,'ND')
GO

SET IDENTITY_INSERT dim_tempo OFF
GO










