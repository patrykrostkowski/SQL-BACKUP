USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[PartyRoleInPolicyRelationship]    Script Date: 28.10.2022 13:36:40 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PartyRoleInPolicyRelationship]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PartyRoleInPolicyRelationship] ON [Party].[PartyRoleInPolicyRelationship]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PartyRoleSK_PartyRoleInPolicyRelationship] FOREIGN KEY([PartyRoleSK])
REFERENCES [Typelist].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] NOCHECK CONSTRAINT [FK_PartyRoleSK_PartyRoleInPolicyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_PartyRoleInPolicyRelationship] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] NOCHECK CONSTRAINT [FK_PartySK_PartyRoleInPolicyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_PartyRoleInPolicyRelationship] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] NOCHECK CONSTRAINT [FK_PolicySK_PartyRoleInPolicyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PartyRoleInPolicyRelationship] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] NOCHECK CONSTRAINT [FK_PolicyTransSK_PartyRoleInPolicyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleInPolicyRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyRoleInPolicyRelationship] NOCHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleInPolicyRelationship]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A party playing the role in the context of a policy contract .  For example, the party identifier  playing the role of insured or account holder or head of household for a particular policy identifier.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'PartyRoleInPolicyRelationship'
GO
