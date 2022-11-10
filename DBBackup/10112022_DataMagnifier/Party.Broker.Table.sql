USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Broker]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[Broker]') AND type in (N'U'))
BEGIN
CREATE TABLE [Party].[Broker](
	[BrokerSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PartySK] [int] NOT NULL,
	[LicenseNum] [varchar](20) NULL,
	[OrganizationName] [varchar](100) NULL,
	[BranchNum] [varchar](20) NULL,
	[BrokerStatusSK] [int] NOT NULL,
	[NewBusinessCommissionPct] [decimal](8, 2) NULL,
	[RenewalCommissionPct] [decimal](8, 2) NULL,
	[IsAppointedInd] [tinyint] NULL,
	[IsActiveInd] [tinyint] NULL,
 CONSTRAINT [PK_Broker] PRIMARY KEY CLUSTERED 
(
	[BrokerSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_BrokerStatusSK_Broker]') AND parent_object_id = OBJECT_ID(N'[Party].[Broker]'))
ALTER TABLE [Party].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_BrokerStatusSK_Broker] FOREIGN KEY([BrokerStatusSK])
REFERENCES [TypeList].[BrokerStatus] ([BrokerStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_BrokerStatusSK_Broker]') AND parent_object_id = OBJECT_ID(N'[Party].[Broker]'))
ALTER TABLE [Party].[Broker] CHECK CONSTRAINT [FK_BrokerStatusSK_Broker]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Broker]') AND parent_object_id = OBJECT_ID(N'[Party].[Broker]'))
ALTER TABLE [Party].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Broker] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Broker]') AND parent_object_id = OBJECT_ID(N'[Party].[Broker]'))
ALTER TABLE [Party].[Broker] CHECK CONSTRAINT [FK_PartySK_Broker]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_Broker]') AND parent_object_id = OBJECT_ID(N'[Party].[Broker]'))
ALTER TABLE [Party].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Broker] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_Broker]') AND parent_object_id = OBJECT_ID(N'[Party].[Broker]'))
ALTER TABLE [Party].[Broker] CHECK CONSTRAINT [FK_SourceSystemSK_Broker]
GO
