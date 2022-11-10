USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Agent]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[Agent]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_AgencySK_Agent]') AND parent_object_id = OBJECT_ID(N'[Party].[Agent]'))
ALTER TABLE [Party].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_AgencySK_Agent] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_AgencySK_Agent]') AND parent_object_id = OBJECT_ID(N'[Party].[Agent]'))
ALTER TABLE [Party].[Agent] CHECK CONSTRAINT [FK_AgencySK_Agent]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Agent]') AND parent_object_id = OBJECT_ID(N'[Party].[Agent]'))
ALTER TABLE [Party].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Agent] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Agent]') AND parent_object_id = OBJECT_ID(N'[Party].[Agent]'))
ALTER TABLE [Party].[Agent] CHECK CONSTRAINT [FK_PartySK_Agent]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_Agent]') AND parent_object_id = OBJECT_ID(N'[Party].[Agent]'))
ALTER TABLE [Party].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Agent] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_Agent]') AND parent_object_id = OBJECT_ID(N'[Party].[Agent]'))
ALTER TABLE [Party].[Agent] CHECK CONSTRAINT [FK_SourceSystemSK_Agent]
GO
