USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[CatastropheZone]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[CatastropheZone]') AND type in (N'U'))
BEGIN
CREATE TABLE [Claim].[CatastropheZone](
	[CatastropheZoneSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[CatastropheSK] [int] NOT NULL,
	[CountrySK] [int] NOT NULL,
	[ZoneTypeSK] [int] NOT NULL,
	[ZoneTypeValue] [varchar](256) NULL,
 CONSTRAINT [PK_CatastropheZone] PRIMARY KEY CLUSTERED 
(
	[CatastropheZoneSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CatastropheSK_CatastropheZone]') AND parent_object_id = OBJECT_ID(N'[Claim].[CatastropheZone]'))
ALTER TABLE [Claim].[CatastropheZone]  WITH CHECK ADD  CONSTRAINT [FK_CatastropheSK_CatastropheZone] FOREIGN KEY([CatastropheSK])
REFERENCES [Claim].[Catastrophe] ([CatastropheSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CatastropheSK_CatastropheZone]') AND parent_object_id = OBJECT_ID(N'[Claim].[CatastropheZone]'))
ALTER TABLE [Claim].[CatastropheZone] CHECK CONSTRAINT [FK_CatastropheSK_CatastropheZone]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CountrySK_CatastropheZone]') AND parent_object_id = OBJECT_ID(N'[Claim].[CatastropheZone]'))
ALTER TABLE [Claim].[CatastropheZone]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_CatastropheZone] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CountrySK_CatastropheZone]') AND parent_object_id = OBJECT_ID(N'[Claim].[CatastropheZone]'))
ALTER TABLE [Claim].[CatastropheZone] CHECK CONSTRAINT [FK_CountrySK_CatastropheZone]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_CatastropheZone]') AND parent_object_id = OBJECT_ID(N'[Claim].[CatastropheZone]'))
ALTER TABLE [Claim].[CatastropheZone]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CatastropheZone] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_CatastropheZone]') AND parent_object_id = OBJECT_ID(N'[Claim].[CatastropheZone]'))
ALTER TABLE [Claim].[CatastropheZone] CHECK CONSTRAINT [FK_SourceSystemSK_CatastropheZone]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ZoneTypeSK_CatastropheZone]') AND parent_object_id = OBJECT_ID(N'[Claim].[CatastropheZone]'))
ALTER TABLE [Claim].[CatastropheZone]  WITH CHECK ADD  CONSTRAINT [FK_ZoneTypeSK_CatastropheZone] FOREIGN KEY([ZoneTypeSK])
REFERENCES [TypeList].[ZoneType] ([ZoneTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ZoneTypeSK_CatastropheZone]') AND parent_object_id = OBJECT_ID(N'[Claim].[CatastropheZone]'))
ALTER TABLE [Claim].[CatastropheZone] CHECK CONSTRAINT [FK_ZoneTypeSK_CatastropheZone]
GO
