USE [sqldb-ods-dev]
GO
/****** Object:  Table [Config].[BalancingConfig]    Script Date: 28.10.2022 13:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[BalancingConfig](
	[ProcessName] [varchar](200) NULL,
	[Source] [varchar](200) NULL,
	[MetricCategory] [varchar](200) NULL,
	[Metric] [varchar](200) NULL,
	[BalanceSQL] [varchar](max) NULL,
	[IsCurrentBatchInd] [tinyint] NULL,
	[IsActiveInd] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
