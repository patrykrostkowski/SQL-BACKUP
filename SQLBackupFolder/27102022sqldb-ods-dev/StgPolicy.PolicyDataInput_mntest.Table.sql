USE [sqldb-ods-dev]
GO
/****** Object:  Table [StgPolicy].[PolicyDataInput_mntest]    Script Date: 27.10.2022 12:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StgPolicy].[PolicyDataInput_mntest](
	[JsonLine] [nvarchar](max) NULL,
	[FileName] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL,
	[BatchId] [uniqueidentifier] NULL,
	[LoadDate] [datetime] NULL,
	[IsValidInd] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [StgPolicy].[PolicyDataInput_mntest] ADD  CONSTRAINT [DF_PolicyDataInput_IsValidInd]  DEFAULT ((1)) FOR [IsValidInd]
GO
