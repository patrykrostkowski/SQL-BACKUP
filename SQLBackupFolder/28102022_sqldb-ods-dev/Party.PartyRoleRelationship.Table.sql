USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[PartyRoleRelationship]    Script Date: 28.10.2022 12:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[PartyRoleRelationship](
	[PartyRoleRelationshipSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PartyPrimarySK] [int] NOT NULL,
	[PartySecondarySK] [int] NOT NULL,
	[RelationshipRoleSK] [int] NOT NULL,
	[CommentTxt] [varchar](1000) NULL,
 CONSTRAINT [PK_PartyRoleRelationship] PRIMARY KEY CLUSTERED 
(
	[PartyRoleRelationshipSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PartyRoleRelationship]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PartyRoleRelationship] ON [Party].[PartyRoleRelationship]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[PartyRoleRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PartyPrimarySK_PartyRoleRelationship] FOREIGN KEY([PartyPrimarySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleRelationship] NOCHECK CONSTRAINT [FK_PartyPrimarySK_PartyRoleRelationship]
GO
ALTER TABLE [Party].[PartyRoleRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySecondarySK_PartyRoleRelationship] FOREIGN KEY([PartySecondarySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleRelationship] NOCHECK CONSTRAINT [FK_PartySecondarySK_PartyRoleRelationship]
GO
ALTER TABLE [Party].[PartyRoleRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_RelationshipRoleSK_PartyRoleRelationship] FOREIGN KEY([RelationshipRoleSK])
REFERENCES [Typelist].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[PartyRoleRelationship] NOCHECK CONSTRAINT [FK_RelationshipRoleSK_PartyRoleRelationship]
GO
ALTER TABLE [Party].[PartyRoleRelationship]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyRoleRelationship] NOCHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleRelationship]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A party playing the role not aligned with any agreement (ex:  policy, claim, treaty).   For example, an employee identified as an underwriter.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'PartyRoleRelationship'
GO
