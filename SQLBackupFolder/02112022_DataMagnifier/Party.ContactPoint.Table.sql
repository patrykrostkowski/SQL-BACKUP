USE [DataMagnifier]
GO
/****** Object:  Table [Party].[ContactPoint]    Script Date: 02.11.2022 12:54:10 ******/
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
ALTER TABLE [Party].[ContactPoint]  WITH CHECK ADD  CONSTRAINT [FK_ContactPointTypeSK_ContactPoint] FOREIGN KEY([ContactPointTypeSK])
REFERENCES [TypeList].[ContactPointType] ([ContactPointTypeSK])
GO
ALTER TABLE [Party].[ContactPoint] CHECK CONSTRAINT [FK_ContactPointTypeSK_ContactPoint]
GO
ALTER TABLE [Party].[ContactPoint]  WITH CHECK ADD  CONSTRAINT [FK_PartyRoleSK_ContactPoint] FOREIGN KEY([PartyRoleSK])
REFERENCES [TypeList].[PartyRole] ([PartyRoleSK])
GO
ALTER TABLE [Party].[ContactPoint] CHECK CONSTRAINT [FK_PartyRoleSK_ContactPoint]
GO
ALTER TABLE [Party].[ContactPoint]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_ContactPoint] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[ContactPoint] CHECK CONSTRAINT [FK_PartySK_ContactPoint]
GO
ALTER TABLE [Party].[ContactPoint]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPoint] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[ContactPoint] CHECK CONSTRAINT [FK_SourceSystemSK_ContactPoint]
GO
