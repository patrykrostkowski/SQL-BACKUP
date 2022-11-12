USE [DataMagnifier]
GO
/****** Object:  Table [Party].[ContactPoint]    Script Date: 12.11.2022 09:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[ContactPoint]') AND type in (N'U'))
BEGIN
CREATE TABLE [Party].[ContactPoint](
	[ContactPointSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[PartySK] [int] NOT NULL,
	[PartyRoleSK] [int] NULL,
	[ContactPointTypeSK] [int] NOT NULL,
	[IsContactActiveInd] [tinyint] NULL,
 CONSTRAINT [PK_ContactPoint] PRIMARY KEY CLUSTERED 
(
	[ContactPointSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_ContactPointTypeSK_ContactPoint]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPoint]'))
ALTER TABLE [Party].[ContactPoint]  WITH CHECK ADD  CONSTRAINT [FK_ContactPointTypeSK_ContactPoint] FOREIGN KEY([ContactPointTypeSK])
REFERENCES [TypeList].[ContactPointType] ([ContactPointTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_ContactPointTypeSK_ContactPoint]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPoint]'))
ALTER TABLE [Party].[ContactPoint] CHECK CONSTRAINT [FK_ContactPointTypeSK_ContactPoint]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartyRoleSK_ContactPoint]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPoint]'))
ALTER TABLE [Party].[ContactPoint]  WITH CHECK ADD  CONSTRAINT [FK_PartyRoleSK_ContactPoint] FOREIGN KEY([PartyRoleSK])
REFERENCES [TypeList].[PartyRole] ([PartyRoleSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartyRoleSK_ContactPoint]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPoint]'))
ALTER TABLE [Party].[ContactPoint] CHECK CONSTRAINT [FK_PartyRoleSK_ContactPoint]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_ContactPoint]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPoint]'))
ALTER TABLE [Party].[ContactPoint]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_ContactPoint] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_ContactPoint]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPoint]'))
ALTER TABLE [Party].[ContactPoint] CHECK CONSTRAINT [FK_PartySK_ContactPoint]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_ContactPoint]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPoint]'))
ALTER TABLE [Party].[ContactPoint]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPoint] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_ContactPoint]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPoint]'))
ALTER TABLE [Party].[ContactPoint] CHECK CONSTRAINT [FK_SourceSystemSK_ContactPoint]
GO
