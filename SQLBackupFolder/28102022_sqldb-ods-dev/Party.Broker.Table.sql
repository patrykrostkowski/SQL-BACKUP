USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[Broker]    Script Date: 28.10.2022 15:04:44 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Broker]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Broker] ON [Party].[Broker]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[Broker]  WITH NOCHECK ADD  CONSTRAINT [FK_BrokerStatusSK_Broker] FOREIGN KEY([BrokerStatusSK])
REFERENCES [Typelist].[BrokerStatus] ([BrokerStatusSK])
GO
ALTER TABLE [Party].[Broker] NOCHECK CONSTRAINT [FK_BrokerStatusSK_Broker]
GO
ALTER TABLE [Party].[Broker]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_Broker] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Broker] NOCHECK CONSTRAINT [FK_PartySK_Broker]
GO
ALTER TABLE [Party].[Broker]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Broker] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Broker] NOCHECK CONSTRAINT [FK_SourceSystemSK_Broker]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Brokers are more aligned with Reinsurance Treaties as the party playing the role of an insurance brokerage. An insurance brokerage is a party who may or may not be directly employed by an insurance company that sells and services insurance policies for more than one insurance company. An broker representative/contact is an  intermediary who acts on behalf of the client rather than the insurance company.  Brokers are more aligned with Reinsurance Treaties,' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'Broker'
GO
