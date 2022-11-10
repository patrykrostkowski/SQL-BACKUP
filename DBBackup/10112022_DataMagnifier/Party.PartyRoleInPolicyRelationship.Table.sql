USE [DataMagnifier]
GO
/****** Object:  Table [Party].[PartyRoleInPolicyRelationship]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[PartyRoleInPolicyRelationship]') AND type in (N'U'))
BEGIN
CREATE TABLE [Party].[PartyRoleInPolicyRelationship](
	[PartyRoleInPolicyRelationshipSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PartySK] [int] NOT NULL,
	[SourceCode] [varchar](254) NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PartyRoleSK] [int] NOT NULL,
	[PolicySK] [int] NULL,
	[PolicyTransSK] [int] NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[IsPrimaryObligeeInd] [tinyint] NULL,
	[IsActiveInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_PartyRoleInPolicyRelationship] PRIMARY KEY CLUSTERED 
(
	[PartyRoleInPolicyRelationshipSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartyRoleSK_PartyRoleInPolicyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInPolicyRelationship]'))
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartyRoleSK_PartyRoleInPolicyRelationship] FOREIGN KEY([PartyRoleSK])
REFERENCES [TypeList].[PartyRole] ([PartyRoleSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartyRoleSK_PartyRoleInPolicyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInPolicyRelationship]'))
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] CHECK CONSTRAINT [FK_PartyRoleSK_PartyRoleInPolicyRelationship]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_PartyRoleInPolicyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInPolicyRelationship]'))
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_PartyRoleInPolicyRelationship] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_PartyRoleInPolicyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInPolicyRelationship]'))
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] CHECK CONSTRAINT [FK_PartySK_PartyRoleInPolicyRelationship]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PolicySK_PartyRoleInPolicyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInPolicyRelationship]'))
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_PartyRoleInPolicyRelationship] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PolicySK_PartyRoleInPolicyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInPolicyRelationship]'))
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] CHECK CONSTRAINT [FK_PolicySK_PartyRoleInPolicyRelationship]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PolicyTransSK_PartyRoleInPolicyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInPolicyRelationship]'))
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PartyRoleInPolicyRelationship] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PolicyTransSK_PartyRoleInPolicyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInPolicyRelationship]'))
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] CHECK CONSTRAINT [FK_PolicyTransSK_PartyRoleInPolicyRelationship]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_PartyRoleInPolicyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInPolicyRelationship]'))
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleInPolicyRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_PartyRoleInPolicyRelationship]') AND parent_object_id = OBJECT_ID(N'[Party].[PartyRoleInPolicyRelationship]'))
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] CHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleInPolicyRelationship]
GO
