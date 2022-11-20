USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[CatastropheZone]    Script Date: 20.11.2022 19:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Claim].[CatastropheZone]  WITH CHECK ADD  CONSTRAINT [FK_CatastropheSK_CatastropheZone] FOREIGN KEY([CatastropheSK])
REFERENCES [Claim].[Catastrophe] ([CatastropheSK])
GO
ALTER TABLE [Claim].[CatastropheZone] CHECK CONSTRAINT [FK_CatastropheSK_CatastropheZone]
GO
ALTER TABLE [Claim].[CatastropheZone]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_CatastropheZone] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Claim].[CatastropheZone] CHECK CONSTRAINT [FK_CountrySK_CatastropheZone]
GO
ALTER TABLE [Claim].[CatastropheZone]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CatastropheZone] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[CatastropheZone] CHECK CONSTRAINT [FK_SourceSystemSK_CatastropheZone]
GO
ALTER TABLE [Claim].[CatastropheZone]  WITH CHECK ADD  CONSTRAINT [FK_ZoneTypeSK_CatastropheZone] FOREIGN KEY([ZoneTypeSK])
REFERENCES [TypeList].[ZoneType] ([ZoneTypeSK])
GO
ALTER TABLE [Claim].[CatastropheZone] CHECK CONSTRAINT [FK_ZoneTypeSK_CatastropheZone]
GO
