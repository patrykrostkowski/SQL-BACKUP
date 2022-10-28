USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[CatastropheZone]    Script Date: 28.10.2022 15:04:23 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_CatastropheZone]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_CatastropheZone] ON [Claim].[CatastropheZone]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[CatastropheZone]  WITH NOCHECK ADD  CONSTRAINT [FK_CatastropheSK_CatastropheZone] FOREIGN KEY([CatastropheSK])
REFERENCES [Claim].[Catastrophe] ([CatastropheSK])
GO
ALTER TABLE [Claim].[CatastropheZone] NOCHECK CONSTRAINT [FK_CatastropheSK_CatastropheZone]
GO
ALTER TABLE [Claim].[CatastropheZone]  WITH NOCHECK ADD  CONSTRAINT [FK_CountrySK_CatastropheZone] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Claim].[CatastropheZone] NOCHECK CONSTRAINT [FK_CountrySK_CatastropheZone]
GO
ALTER TABLE [Claim].[CatastropheZone]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CatastropheZone] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[CatastropheZone] NOCHECK CONSTRAINT [FK_SourceSystemSK_CatastropheZone]
GO
ALTER TABLE [Claim].[CatastropheZone]  WITH NOCHECK ADD  CONSTRAINT [FK_ZoneTypeSK_CatastropheZone] FOREIGN KEY([ZoneTypeSK])
REFERENCES [Typelist].[ZoneType] ([ZoneTypeSK])
GO
ALTER TABLE [Claim].[CatastropheZone] NOCHECK CONSTRAINT [FK_ZoneTypeSK_CatastropheZone]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the geographic zones impacted by the catastrophic event.  May be identified by city, county, state, postal codes or other' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'CatastropheZone'
GO
