USE [sqldb-ods-dev]
GO
/****** Object:  Table [StgPolicy].[PolicyDataInputOld]    Script Date: 28.10.2022 13:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StgPolicy].[PolicyDataInputOld](
	[JsonLine] [nvarchar](max) NULL,
	[FileName] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL,
	[BatchId] [uniqueidentifier] NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
