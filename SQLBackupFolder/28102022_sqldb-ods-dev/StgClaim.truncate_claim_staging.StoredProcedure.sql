USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgClaim].[truncate_claim_staging]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   procedure [StgClaim].[truncate_claim_staging] as 
IF NOT EXISTS ( SELECT  *
                FROM    sys.schemas
                WHERE   name = N'StgClaim' )
    EXEC('CREATE SCHEMA [StgClaim]');

IF object_id('StgClaim.ClaimDataInput') is not null
    truncate table [StgClaim].[ClaimDataInput];
ELSE
	CREATE TABLE [StgClaim].[ClaimDataInput](
		[JsonLine] [nvarchar](max) NULL,
		[FileName] [nvarchar](500) NULL,
		[FilePath] [nvarchar](500) NULL,
		[BatchId] [uniqueidentifier] NULL,
		[LoadDate] [datetime] NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
