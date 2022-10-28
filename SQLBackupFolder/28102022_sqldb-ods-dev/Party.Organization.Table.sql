USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[Organization]    Script Date: 28.10.2022 13:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[Organization](
	[OrganizationSK] [int] IDENTITY(2,1) NOT NULL,
	[PartySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[OwnershipTypeSK] [int] NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Organization]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Organization] ON [Party].[Organization]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[Organization]  WITH NOCHECK ADD  CONSTRAINT [FK_OwnershipTypeSK_Organization] FOREIGN KEY([OwnershipTypeSK])
REFERENCES [Typelist].[OwnershipType] ([OwnershipTypeSK])
GO
ALTER TABLE [Party].[Organization] NOCHECK CONSTRAINT [FK_OwnershipTypeSK_Organization]
GO
ALTER TABLE [Party].[Organization]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_Organization] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Organization] NOCHECK CONSTRAINT [FK_PartySK_Organization]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A Party who''s type is a business concern or group  that are systematically bound by a common purpose, with or without a legal status. Organizations may be legal entities in their own right.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'Organization'
GO
