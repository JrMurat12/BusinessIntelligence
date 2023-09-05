CREATE TABLE [dbo].[tbl_empresa]
(
	[cod_loja] VARCHAR(25) NOT NULL PRIMARY KEY, 
    [desc_loja] VARCHAR(200) NULL, 
    [desc_empresa] VARCHAR(200) NULL, 
    [cod_empresa] VARCHAR(25) NULL, 
    [tamanho_loja] FLOAT NULL, 
    [arquivo_origem] VARCHAR(200) NULL, 
    [data_carga] DATETIME NULL
)
