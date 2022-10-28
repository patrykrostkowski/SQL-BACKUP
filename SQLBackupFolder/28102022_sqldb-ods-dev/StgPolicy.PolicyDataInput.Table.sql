USE [sqldb-ods-dev]
GO
/****** Object:  Table [StgPolicy].[PolicyDataInput]    Script Date: 28.10.2022 12:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StgPolicy].[PolicyDataInput](
	[JsonLine] [nvarchar](max) NULL,
	[FileName] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL,
	[BatchId] [uniqueidentifier] NULL,
	[LoadDate] [datetime] NULL,
	[IsValidInd] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
