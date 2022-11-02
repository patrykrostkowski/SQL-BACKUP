USE [DataMagnifier]
GO
/****** Object:  Table [Party].[PartyRoleRelationship]    Script Date: 02.11.2022 14:38:28 ******/
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
ALTER TABLE [Party].[PartyRoleRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartyPrimarySK_PartyRoleRelationship] FOREIGN KEY([PartyPrimarySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleRelationship] CHECK CONSTRAINT [FK_PartyPrimarySK_PartyRoleRelationship]
GO
ALTER TABLE [Party].[PartyRoleRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PartySecondarySK_PartyRoleRelationship] FOREIGN KEY([PartySecondarySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyRoleRelationship] CHECK CONSTRAINT [FK_PartySecondarySK_PartyRoleRelationship]
GO
ALTER TABLE [Party].[PartyRoleRelationship]  WITH CHECK ADD  CONSTRAINT [FK_RelationshipRoleSK_PartyRoleRelationship] FOREIGN KEY([RelationshipRoleSK])
REFERENCES [TypeList].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[PartyRoleRelationship] CHECK CONSTRAINT [FK_RelationshipRoleSK_PartyRoleRelationship]
GO
ALTER TABLE [Party].[PartyRoleRelationship]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyRoleRelationship] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyRoleRelationship] CHECK CONSTRAINT [FK_SourceSystemSK_PartyRoleRelationship]
GO
