USE [sqldb-ods-dev]
GO
/****** Object:  Table [StgClaim].[ClaimDataInput_20221015]    Script Date: 27.10.2022 12:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StgClaim].[ClaimDataInput_20221015](
	[JsonLine] [varchar](max) NULL,
	[FileName] [varchar](500) NULL,
	[FilePath] [varchar](500) NULL,
	[BatchId] [varchar](500) NULL,
	[LoadDate] [datetime] NULL,
	[IsValidInd] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
