USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[Agency]    Script Date: 27.10.2022 12:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[Agency](
	[AgencySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[AgencyNum] [varchar](20) NULL,
	[NewBusinessCommissionPct] [decimal](8, 2) NULL,
	[RenewalCommissionPct] [decimal](8, 2) NULL,
	[PartySK] [int] NOT NULL,
	[BrokerSK] [int] NULL,
	[LicenseNum] [varchar](20) NULL,
	[AppointmentEffectiveDate] [date] NULL,
	[AppointmentExpirationDate] [date] NULL,
	[LicenseName] [varchar](50) NULL,
	[SurplusLicenseNum] [varchar](20) NULL,
	[OrganizationName] [varchar](100) NULL,
	[BranchNum] [varchar](20) NULL,
	[IsAppointedInd] [tinyint] NULL,
	[IsActiveInd] [tinyint] NULL,
 CONSTRAINT [PK_Agency] PRIMARY KEY CLUSTERED 
(
	[AgencySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Agency]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Agency] ON [Party].[Agency]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[Agency]  WITH NOCHECK ADD  CONSTRAINT [FK_BrokerSK_Agency] FOREIGN KEY([BrokerSK])
REFERENCES [Party].[Broker] ([BrokerSK])
GO
ALTER TABLE [Party].[Agency] NOCHECK CONSTRAINT [FK_BrokerSK_Agency]
GO
ALTER TABLE [Party].[Agency]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_Agency] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Agency] NOCHECK CONSTRAINT [FK_PartySK_Agency]
GO
ALTER TABLE [Party].[Agency]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Agency] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Agency] NOCHECK CONSTRAINT [FK_SourceSystemSK_Agency]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A Party playing the role of an insurance Agent/agency. An insurance Agent/agency is a party who may or may not be directly employed by an insurance company that sells and services insurance policies for more than one insurance company. An Agency representative/contact is an  intermediary who acts on behalf of the client rather than the insurance company;' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'Agency'
GO
