USE [DataMagnifier]
GO
/****** Object:  Table [Party].[PartyRoleinCommissionRelationship]    Script Date: 31.10.2022 12:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[PartyRoleinCommissionRelationship](
	[PartyRoleinCommissionRelationshipSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[AgencySK] [int] NOT NULL,
	[WritingCompanySK] [int] NOT NULL,
	[NewBusinessCommissionPct] [decimal](8, 2) NULL,
	[RenewalCommissionPct] [decimal](8, 2) NULL,
	[LicenseNum] [varchar](20) NULL,
	[LicenseName] [varchar](50) NULL,
	[SurplusLicenseNum] [varchar](20) NULL,
	[BranchNum] [varchar](20) NULL,
	[IsAppointedInd] [tinyint] NULL,
	[IsActiveInd] [tinyint] NULL,
 CONSTRAINT [PK_PartyRoleinCommissionRelationship] PRIMARY KEY CLUSTERED 
(
	[PartyRoleinCommissionRelationshipSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[PartyRoleinCommissionRelationship]  WITH CHECK ADD  CONSTRAINT [FK_AgencySK_PartyRoleinCommissionRelationship] FOREIGN KEY([AgencySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleinCommissionRelationship] CHECK CONSTRAINT [FK_AgencySK_PartyRoleinCommissionRelationship]
GO
ALTER TABLE [Party].[PartyRoleinCommissionRelationship]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleinCommissionRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyRoleinCommissionRelationship] CHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleinCommissionRelationship]
GO
ALTER TABLE [Party].[PartyRoleinCommissionRelationship]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_PartyRoleinCommissionRelationship] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleinCommissionRelationship] CHECK CONSTRAINT [FK_WritingCompanySK_PartyRoleinCommissionRelationship]
GO
