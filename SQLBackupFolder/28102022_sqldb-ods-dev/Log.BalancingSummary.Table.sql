USE [sqldb-ods-dev]
GO
/****** Object:  Table [Log].[BalancingSummary]    Script Date: 28.10.2022 11:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Log].[BalancingSummary](
	[ProcessName] [nvarchar](200) NULL,
	[BatchID] [bigint] NULL,
	[MetricCategory] [nvarchar](200) NULL,
	[Source] [nvarchar](200) NULL,
	[Metric] [nvarchar](200) NULL,
	[MetricValue] [decimal](20, 6) NULL,
	[CreateTimestamp] [datetime] NULL
) ON [PRIMARY]
GO
