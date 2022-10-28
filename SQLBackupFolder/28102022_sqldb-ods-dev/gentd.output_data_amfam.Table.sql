USE [sqldb-ods-dev]
GO
/****** Object:  Table [gentd].[output_data_amfam]    Script Date: 28.10.2022 12:26:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gentd].[output_data_amfam](
	[JsonLine] [nvarchar](max) NULL,
	[FileName] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL,
	[BatchId] [uniqueidentifier] NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
