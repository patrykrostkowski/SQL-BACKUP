USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[truncate_policy_staging]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   procedure [StgPolicy].[truncate_policy_staging] as 
IF NOT EXISTS ( SELECT  *
                FROM    sys.schemas
                WHERE   name = N'StgPolicy' )
    EXEC('CREATE SCHEMA [StgPolicy]');

IF object_id('StgPolicy.PolicyDataInput') is not null
    truncate table [StgPolicy].[PolicyDataInput];
ELSE
	CREATE TABLE [StgPolicy].[PolicyDataInput](
		[JsonLine] [nvarchar](max) NULL,
		[FileName] [nvarchar](500) NULL,
		[FilePath] [nvarchar](500) NULL,
		[BatchId] [uniqueidentifier] NULL,
		[LoadDate] [datetime] NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
