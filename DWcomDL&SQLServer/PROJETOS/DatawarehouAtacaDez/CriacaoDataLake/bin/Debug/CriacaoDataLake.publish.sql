/*
Script de implantação para DL_ATACADEZ

Este código foi gerado por uma ferramenta.
As alterações feitas nesse arquivo poderão causar comportamento incorreto e serão perdidas se
o código for gerado novamente.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DL_ATACADEZ"
:setvar DefaultFilePrefix "DL_ATACADEZ"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detecta o modo SQLCMD e desabilita a execução do script se o modo SQLCMD não tiver suporte.
Para reabilitar o script após habilitar o modo SQLCMD, execute o comando a seguir:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'O modo SQLCMD deve ser habilitado para executar esse script com êxito.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'A operação de refatoração Renomear com chave 47105262-b619-4777-a929-1958a78f6a86 foi ignorada; o elemento [dbo].[tbl_empresa].[Id] (SqlSimpleColumn) não será renomeado para cod_loja';


GO
PRINT N'A operação de refatoração Renomear com chave a098e945-4e12-42a8-8bc9-22b524df61e7 foi ignorada; o elemento [dbo].[tbl_cliente].[Id] (SqlSimpleColumn) não será renomeado para cod_cliente';


GO
PRINT N'A operação de refatoração Renomear com chave 084864c1-bbb8-4301-9a5a-9146780314cc foi ignorada; o elemento [dbo].[tbl_produto].[Id] (SqlSimpleColumn) não será renomeado para cod_produto';


GO
PRINT N'Criando Tabela [dbo].[tbl_cliente]...';


GO
CREATE TABLE [dbo].[tbl_cliente] (
    [cod_cliente]    VARCHAR (25)  NOT NULL,
    [desc_cliente]   VARCHAR (200) NULL,
    [endereco]       VARCHAR (200) NULL,
    [faturamento]    FLOAT (53)    NULL,
    [desc_segmento]  VARCHAR (200) NULL,
    [desc_cidade]    VARCHAR (200) NULL,
    [cod_estado]     VARCHAR (25)  NULL,
    [desc_estado]    VARCHAR (200) NULL,
    [desc_regiao]    VARCHAR (200) NULL,
    [arquivo_origem] VARCHAR (200) NULL,
    [data_carga]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([cod_cliente] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[tbl_empresa]...';


GO
CREATE TABLE [dbo].[tbl_empresa] (
    [cod_loja]       VARCHAR (25)  NOT NULL,
    [desc_loja]      VARCHAR (200) NULL,
    [desc_empresa]   VARCHAR (200) NULL,
    [cod_empresa]    VARCHAR (25)  NULL,
    [tamanho_loja]   FLOAT (53)    NULL,
    [arquivo_origem] VARCHAR (200) NULL,
    [data_carga]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([cod_loja] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[tbl_produto]...';


GO
CREATE TABLE [dbo].[tbl_produto] (
    [cod_produto]        VARCHAR (25)  NOT NULL,
    [desc_produto]       VARCHAR (200) NULL,
    [desc_departamento]  VARCHAR (200) NULL,
    [atr_unidade_medida] VARCHAR (50)  NULL,
    [cod_fornecedor]     VARCHAR (25)  NULL,
    [desc_fornecedor]    VARCHAR (200) NULL,
    [arquivo_origem]     VARCHAR (200) NULL,
    [data_carga]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([cod_produto] ASC)
);


GO
-- Etapa de refatoração para atualizar o servidor de destino com logs de transação implantados

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '47105262-b619-4777-a929-1958a78f6a86')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('47105262-b619-4777-a929-1958a78f6a86')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a098e945-4e12-42a8-8bc9-22b524df61e7')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a098e945-4e12-42a8-8bc9-22b524df61e7')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '084864c1-bbb8-4301-9a5a-9146780314cc')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('084864c1-bbb8-4301-9a5a-9146780314cc')

GO

GO
PRINT N'Atualização concluída.';


GO
