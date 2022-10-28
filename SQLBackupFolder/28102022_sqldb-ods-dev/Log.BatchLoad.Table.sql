USE [sqldb-ods-dev]
GO
/****** Object:  Table [Log].[BatchLoad]    Script Date: 28.10.2022 13:36:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Log].[BatchLoad](
	[Batchid] [bigint] IDENTITY(1,1) NOT NULL,
	[ProcessName] [nvarchar](200) NULL,
	[BatchStartDate] [datetime] NULL,
	[BatchEndDate] [datetime] NULL,
	[PriorCutOffDate] [datetime] NULL,
	[CutOffDate] [datetime] NULL,
	[BatchStatus] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Batchid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
