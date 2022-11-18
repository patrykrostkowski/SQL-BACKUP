USE [DataMagnifier]
GO
/****** Object:  Table [Party].[PartyAssociation]    Script Date: 18.11.2022 16:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[PartyAssociation](
	[PartyAssociationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ParentPartySK] [int] NOT NULL,
	[PartySK] [int] NOT NULL,
 CONSTRAINT [PK_PartyAssociation] PRIMARY KEY CLUSTERED 
(
	[PartyAssociationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[PartyAssociation]  WITH CHECK ADD  CONSTRAINT [FK_ParentPartySK_PartyAssociation] FOREIGN KEY([ParentPartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyAssociation] CHECK CONSTRAINT [FK_ParentPartySK_PartyAssociation]
GO
ALTER TABLE [Party].[PartyAssociation]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_PartyAssociation] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyAssociation] CHECK CONSTRAINT [FK_PartySK_PartyAssociation]
GO
ALTER TABLE [Party].[PartyAssociation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyAssociation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyAssociation] CHECK CONSTRAINT [FK_SourceSystemSK_PartyAssociation]
GO
