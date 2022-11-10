USE [DataMagnifier]
GO
/****** Object:  Table [Party].[PartyRoleInTreatyRelationship]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[PartyRoleInTreatyRelationship]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartyRoleSK_PartyRoleInTreatyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInTreatyRelationship]'))
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartyRoleSK_PartyRoleInTreatyRelationship] FOREIGN KEY([PartyRoleSK])
REFERENCES [TypeList].[PartyRole] ([PartyRoleSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartyRoleSK_PartyRoleInTreatyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInTreatyRelationship]'))
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] CHECK CONSTRAINT [FK_PartyRoleSK_PartyRoleInTreatyRelationship]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_PartyRoleInTreatyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInTreatyRelationship]'))
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_PartyRoleInTreatyRelationship] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_PartyRoleInTreatyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInTreatyRelationship]'))
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] CHECK CONSTRAINT [FK_PartySK_PartyRoleInTreatyRelationship]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_PartyRoleInTreatyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInTreatyRelationship]'))
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleInTreatyRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_PartyRoleInTreatyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInTreatyRelationship]'))
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] CHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleInTreatyRelationship]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_TreatySK_PartyRoleInTreatyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInTreatyRelationship]'))
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_TreatySK_PartyRoleInTreatyRelationship] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_TreatySK_PartyRoleInTreatyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInTreatyRelationship]'))
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] CHECK CONSTRAINT [FK_TreatySK_PartyRoleInTreatyRelationship]
GO
