USE [sqldb-ods-dev]
GO
/****** Object:  Table [Log].[BatchSummary]    Script Date: 28.10.2022 11:09:46 ******/
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
