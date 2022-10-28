USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[truncate_policy_staging_financialdata]    Script Date: 28.10.2022 13:37:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [StgPolicy].[truncate_policy_staging_financialdata] as 
IF NOT EXISTS ( SELECT  *
                FROM    sys.schemas
                WHERE   name = N'StgPolicy' )
    EXEC('CREATE SCHEMA [StgPolicy]');

IF object_id('StgPolicy.FinancialData') is not null
    truncate table [StgPolicy].[FinancialData];
ELSE
	CREATE TABLE [StgPolicy].[FinancialData](
		[JsonLine] [nvarchar](max) NULL,
		[FileName] [nvarchar](500) NULL,
		[FilePath] [nvarchar](500) NULL,
		[BatchId] [uniqueidentifier] NULL,
		[LoadDate] [datetime] NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
