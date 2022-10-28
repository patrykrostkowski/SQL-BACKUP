USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[BrokerStatus]    Script Date: 28.10.2022 13:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[BrokerStatus](
	[BrokerStatusSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[BrokerStatusCode] [varchar](20) NOT NULL,
	[BrokerStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BrokerStatus] PRIMARY KEY CLUSTERED 
(
	[BrokerStatusSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_BrokerStatus]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_BrokerStatus] ON [Typelist].[BrokerStatus]
(
	[SourceSystemSK] ASC,
	[BrokerStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[BrokerStatus]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_BrokerStatus] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[BrokerStatus] NOCHECK CONSTRAINT [FK_SourceSystemSK_BrokerStatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples appointed, active, closed' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'BrokerStatus'
GO
