USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[PartyRoleInTreatyRelationship]    Script Date: 28.10.2022 12:26:36 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PartyRoleInTreatyRelationship]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PartyRoleInTreatyRelationship] ON [Party].[PartyRoleInTreatyRelationship]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PartyRoleSK_PartyRoleInTreatyRelationship] FOREIGN KEY([PartyRoleSK])
REFERENCES [Typelist].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] NOCHECK CONSTRAINT [FK_PartyRoleSK_PartyRoleInTreatyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_PartyRoleInTreatyRelationship] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] NOCHECK CONSTRAINT [FK_PartySK_PartyRoleInTreatyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleInTreatyRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] NOCHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleInTreatyRelationship]
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_TreatySK_PartyRoleInTreatyRelationship] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
ALTER TABLE [Party].[PartyRoleInTreatyRelationship] NOCHECK CONSTRAINT [FK_TreatySK_PartyRoleInTreatyRelationship]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A party playing the role in the context of a reinsurance treaty or  treaty financial transaction.  For example, the party identifier  playing the role of broker in a treaty identifier.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'PartyRoleInTreatyRelationship'
GO
