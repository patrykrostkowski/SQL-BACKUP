USE [sqldb-ods-dev]
GO
/****** Object:  Table [Log].[LoadBalancingOLD]    Script Date: 28.10.2022 15:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Log].[LoadBalancingOLD](
	[ProcessName] [nvarchar](200) NULL,
	[BatchID] [bigint] NULL,
	[LoadDate] [datetime] NULL,
	[MetricCategory] [nvarchar](200) NULL,
	[Source] [nvarchar](200) NULL,
	[Metric] [nvarchar](200) NULL,
	[MetricValue] [int] NULL,
	[CreateTimestamp] [timestamp] NULL
) ON [PRIMARY]
GO
