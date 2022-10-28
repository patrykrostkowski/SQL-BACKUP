USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[Agent]    Script Date: 28.10.2022 12:26:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[Agent](
	[AgentSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PartySK] [int] NOT NULL,
	[AgencySK] [int] NOT NULL,
	[LicenseNum] [varchar](20) NULL,
	[LicenseName] [varchar](50) NULL,
	[SurplusLicenseNum] [varchar](20) NULL,
	[FirstName] [varchar](255) NULL,
	[MiddleName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[FullName] [varchar](50) NULL,
	[OrganizationName] [varchar](100) NULL,
	[BranchNum] [varchar](20) NULL,
	[IsAppointedInd] [tinyint] NULL,
	[IsActiveInd] [tinyint] NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[AgentSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Agent]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Agent] ON [Party].[Agent]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[Agent]  WITH NOCHECK ADD  CONSTRAINT [FK_AgencySK_Agent] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
ALTER TABLE [Party].[Agent] NOCHECK CONSTRAINT [FK_AgencySK_Agent]
GO
ALTER TABLE [Party].[Agent]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_Agent] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Agent] NOCHECK CONSTRAINT [FK_PartySK_Agent]
GO
ALTER TABLE [Party].[Agent]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Agent] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Agent] NOCHECK CONSTRAINT [FK_SourceSystemSK_Agent]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A Party playing the role of an insurance Agenct/agency. An insurance Agenct/agency is a party who may or may not be directly employed by an insurance company that sells and services insurance policies for more than one insurance company. An Agency representative/contact is an  intermediary who acts on behalf of the client rather than the insurance company;' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'Agent'
GO
