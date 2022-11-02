USE [DataMagnifier]
GO
/****** Object:  Table [Party].[PartyRoleInPolicyRelationship]    Script Date: 02.11.2022 14:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartyRoleSK_PartyRoleInPolicyRelationship] FOREIGN KEY([PartyRoleSK])
REFERENCES [TypeList].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] CHECK CONSTRAINT [FK_PartyRoleSK_PartyRoleInPolicyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_PartyRoleInPolicyRelationship] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] CHECK CONSTRAINT [FK_PartySK_PartyRoleInPolicyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_PartyRoleInPolicyRelationship] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] CHECK CONSTRAINT [FK_PolicySK_PartyRoleInPolicyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PartyRoleInPolicyRelationship] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] CHECK CONSTRAINT [FK_PolicyTransSK_PartyRoleInPolicyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleInPolicyRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] CHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleInPolicyRelationship]
GO
