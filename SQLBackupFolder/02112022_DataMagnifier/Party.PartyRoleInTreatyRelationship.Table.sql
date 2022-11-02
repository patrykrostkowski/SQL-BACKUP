USE [DataMagnifier]
GO
/****** Object:  Table [Party].[PartyRoleInTreatyRelationship]    Script Date: 02.11.2022 14:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[PartyRoleInTreatyRelationship](
	[PartyRoleInRelationshipId] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PartySK] [int] NOT NULL,
	[PartyRoleSK] [int] NOT NULL,
	[TreatySK] [int] NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[IsActiveInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_PartyRoleInTreatyRelationship] PRIMARY KEY CLUSTERED 
(
	[PartyRoleInRelationshipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartyRoleSK_PartyRoleInTreatyRelationship] FOREIGN KEY([PartyRoleSK])
REFERENCES [TypeList].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] CHECK CONSTRAINT [FK_PartyRoleSK_PartyRoleInTreatyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_PartyRoleInTreatyRelationship] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] CHECK CONSTRAINT [FK_PartySK_PartyRoleInTreatyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleInTreatyRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] CHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleInTreatyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_TreatySK_PartyRoleInTreatyRelationship] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] CHECK CONSTRAINT [FK_TreatySK_PartyRoleInTreatyRelationship]
GO
