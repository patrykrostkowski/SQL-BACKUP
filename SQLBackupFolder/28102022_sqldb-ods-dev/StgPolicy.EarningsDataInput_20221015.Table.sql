USE [sqldb-ods-dev]
GO
/****** Object:  Table [StgPolicy].[EarningsDataInput_20221015]    Script Date: 28.10.2022 13:37:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StgPolicy].[EarningsDataInput_20221015](
	[JsonLine] [nvarchar](max) NULL,
	[FileName] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL,
	[BatchId] [uniqueidentifier] NULL,
	[LoadDate] [datetime] NULL,
	[IsValidInd] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
