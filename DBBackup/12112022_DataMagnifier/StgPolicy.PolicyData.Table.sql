USE [DataMagnifier]
GO
/****** Object:  Table [StgPolicy].[PolicyData]    Script Date: 12.11.2022 09:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[StgPolicy].[PolicyData]') AND type in (N'U'))
BEGIN
CREATE TABLE [StgPolicy].[PolicyData](
	[JsonLine] [nvarchar](max) NULL,
	[FileName] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL,
	[BatchId] [uniqueidentifier] NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
