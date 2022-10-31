USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[BrokerStatus]    Script Date: 31.10.2022 12:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[BrokerStatus](
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
ALTER TABLE [TypeList].[BrokerStatus]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_BrokerStatus] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[BrokerStatus] CHECK CONSTRAINT [FK_SourceSystemSK_BrokerStatus]
GO
