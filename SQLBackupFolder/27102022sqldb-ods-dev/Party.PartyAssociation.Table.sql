USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[PartyAssociation]    Script Date: 27.10.2022 12:26:54 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PartyAssociation]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PartyAssociation] ON [Party].[PartyAssociation]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[PartyAssociation]  WITH NOCHECK ADD  CONSTRAINT [FK_ParentPartySK_PartyAssociation] FOREIGN KEY([ParentPartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyAssociation] NOCHECK CONSTRAINT [FK_ParentPartySK_PartyAssociation]
GO
ALTER TABLE [Party].[PartyAssociation]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_PartyAssociation] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[PartyAssociation] NOCHECK CONSTRAINT [FK_PartySK_PartyAssociation]
GO
ALTER TABLE [Party].[PartyAssociation]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyAssociation] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[PartyAssociation] NOCHECK CONSTRAINT [FK_SourceSystemSK_PartyAssociation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A parent child relationship between 2 parties.  Supports the association between a Brokerage(organization) and the individaul broker representative/contact, or an insured and household named insured' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'PartyAssociation'
GO
