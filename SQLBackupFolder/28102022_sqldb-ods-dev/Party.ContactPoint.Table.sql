USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[ContactPoint]    Script Date: 28.10.2022 13:36:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[ContactPoint](
	[ContactPointSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PartySK] [int] NOT NULL,
	[PartyRoleSK] [int] NULL,
	[ContactPointTypeSK] [int] NOT NULL,
	[IsContactActiveInd] [tinyint] NULL,
 CONSTRAINT [PK_ContactPoint] PRIMARY KEY CLUSTERED 
(
	[ContactPointSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ContactPoint]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ContactPoint] ON [Party].[ContactPoint]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[ContactPoint]  WITH NOCHECK ADD  CONSTRAINT [FK_ContactPointTypeSK_ContactPoint] FOREIGN KEY([ContactPointTypeSK])
REFERENCES [Typelist].[ContactPointType] ([ContactPointTypeSK])
GO
ALTER TABLE [Party].[ContactPoint] NOCHECK CONSTRAINT [FK_ContactPointTypeSK_ContactPoint]
GO
ALTER TABLE [Party].[ContactPoint]  WITH NOCHECK ADD  CONSTRAINT [FK_PartyRoleSK_ContactPoint] FOREIGN KEY([PartyRoleSK])
REFERENCES [Typelist].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[ContactPoint] NOCHECK CONSTRAINT [FK_PartyRoleSK_ContactPoint]
GO
ALTER TABLE [Party].[ContactPoint]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_ContactPoint] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[ContactPoint] NOCHECK CONSTRAINT [FK_PartySK_ContactPoint]
GO
ALTER TABLE [Party].[ContactPoint]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPoint] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[ContactPoint] NOCHECK CONSTRAINT [FK_SourceSystemSK_ContactPoint]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This identifies  the method and destination of a communication  with a party or party role. The sub-types relate to specific communication media: postal address, telephone number, and electronic address.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'ContactPoint'
GO
