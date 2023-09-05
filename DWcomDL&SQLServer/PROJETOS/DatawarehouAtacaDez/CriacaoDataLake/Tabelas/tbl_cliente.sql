CREATE TABLE [dbo].[tbl_cliente]
(
	[cod_cliente] VARCHAR(25) NOT NULL PRIMARY KEY, 
    [desc_cliente] VARCHAR(200) NULL, 
    [endereco] VARCHAR(200) NULL, 
    [faturamento] FLOAT NULL, 
    [desc_segmento] VARCHAR(200) NULL, 
    [desc_cidade] VARCHAR(200) NULL, 
    [cod_estado] VARCHAR(25) NULL, 
    [desc_estado] VARCHAR(200) NULL, 
    [desc_regiao] VARCHAR(200) NULL, 
    [arquivo_origem] VARCHAR(200) NULL, 
    [data_carga] DATETIME NULL
)
