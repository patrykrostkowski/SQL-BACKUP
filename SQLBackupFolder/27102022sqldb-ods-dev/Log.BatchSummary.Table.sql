USE [sqldb-ods-dev]
GO
/****** Object:  Table [Log].[BatchSummary]    Script Date: 27.10.2022 12:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Log].[BatchSummary](
	[BatchId] [nvarchar](200) NULL,
	[BatchLoadDate] [datetime] NULL,
	[LoadDate] [datetime] NULL,
	[TotalFileCount] [int] NULL,
	[ValidFileCount] [int] NULL,
	[ValidFileLineCount] [int] NULL,
	[InValidFileCount] [int] NULL,
	[StageLineCount] [int] NULL,
	[CreateTimestamp] [timestamp] NULL
) ON [PRIMARY]
GO
