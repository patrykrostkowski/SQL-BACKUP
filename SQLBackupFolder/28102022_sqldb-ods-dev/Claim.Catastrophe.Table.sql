USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[Catastrophe]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[Catastrophe](
	[CatastropheSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[CatastropheName] [varchar](60) NULL,
	[CatastropheNum] [varchar](60) NULL,
	[CatastropheValidFromDate] [date] NULL,
	[CatastropheValidToDate] [date] NULL,
	[CatastropheTypeSK] [int] NULL,
	[CatastropheDesc] [varchar](255) NULL,
	[IsActiveInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_Catastrophe] PRIMARY KEY CLUSTERED 
(
	[CatastropheSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Catastrophe]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Catastrophe] ON [Claim].[Catastrophe]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[Catastrophe]  WITH NOCHECK ADD  CONSTRAINT [FK_CatastropheTypeSK_Catastrophe] FOREIGN KEY([CatastropheTypeSK])
REFERENCES [Typelist].[CatastropheType] ([CatastropheTypeSK])
GO
ALTER TABLE [Claim].[Catastrophe] NOCHECK CONSTRAINT [FK_CatastropheTypeSK_Catastrophe]
GO
ALTER TABLE [Claim].[Catastrophe]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Catastrophe] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[Catastrophe] NOCHECK CONSTRAINT [FK_SourceSystemSK_Catastrophe]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A cataclysmic, disastrous event.  Any natural or man-made incident which results in extraordinary levels of mass casualties, damage, or disruption severely affecting the population, infrastructure, environment, economy, national morale, and/or government functions.' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'Catastrophe'
GO
