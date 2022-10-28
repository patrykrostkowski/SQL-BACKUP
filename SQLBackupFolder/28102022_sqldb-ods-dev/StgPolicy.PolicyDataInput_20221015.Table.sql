USE [sqldb-ods-dev]
GO
/****** Object:  Table [StgPolicy].[PolicyDataInput_20221015]    Script Date: 28.10.2022 13:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StgPolicy].[PolicyDataInput_20221015](
	[JsonLine] [nvarchar](max) NULL,
	[FileName] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL,
	[BatchId] [uniqueidentifier] NULL,
	[LoadDate] [datetime] NULL,
	[IsValidInd] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
