USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Broker]    Script Date: 31.10.2022 11:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Party].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_BrokerStatusSK_Broker] FOREIGN KEY([BrokerStatusSK])
REFERENCES [TypeList].[BrokerStatus] ([BrokerStatusSK])
GO
ALTER TABLE [Party].[Broker] CHECK CONSTRAINT [FK_BrokerStatusSK_Broker]
GO
ALTER TABLE [Party].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Broker] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Broker] CHECK CONSTRAINT [FK_PartySK_Broker]
GO
ALTER TABLE [Party].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Broker] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Broker] CHECK CONSTRAINT [FK_SourceSystemSK_Broker]
GO
