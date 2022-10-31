USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Agency]    Script Date: 31.10.2022 12:30:52 ******/
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
	[SourceCide] [varchar](254) NULL,
	[AgencyNum] [varchar](20) NULL,
	[NewBusinessCommissionPct] [decimal](8, 2) NULL,
	[RenewalCommissionPct] [decimal](8, 2) NULL,
	[PartySK] [int] NOT NULL,
	[BrokerSK] [int] NOT NULL,
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
ALTER TABLE [Party].[Agency]  WITH CHECK ADD  CONSTRAINT [FK_BrokerSK_Agency] FOREIGN KEY([BrokerSK])
REFERENCES [Party].[Broker] ([BrokerSK])
GO
ALTER TABLE [Party].[Agency] CHECK CONSTRAINT [FK_BrokerSK_Agency]
GO
ALTER TABLE [Party].[Agency]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Agency] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Agency] CHECK CONSTRAINT [FK_PartySK_Agency]
GO
ALTER TABLE [Party].[Agency]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Agency] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Agency] CHECK CONSTRAINT [FK_SourceSystemSK_Agency]
GO
