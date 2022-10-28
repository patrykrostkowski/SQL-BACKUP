USE [sqldb-ods-dev]
GO
/****** Object:  Table [Reins].[TreatyLimit]    Script Date: 28.10.2022 12:27:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reins].[TreatyLimit](
	[TreatyLimitSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ProportionalTreatySK] [int] NULL,
	[NonProportionalTreatySK] [int] NULL,
	[LevelTypeSK] [int] NOT NULL,
	[LimitDeductibleTypeSK] [int] NOT NULL,
	[LimitValue] [decimal](18, 2) NULL,
	[LimitDesc] [varchar](255) NULL,
	[TreatySectionSK] [int] NULL,
 CONSTRAINT [PK_TreatyLimit] PRIMARY KEY CLUSTERED 
(
	[TreatyLimitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_TreatyLimit]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_TreatyLimit] ON [Reins].[TreatyLimit]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Reins].[TreatyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_LevelTypeSK_TreatyLimit] FOREIGN KEY([LevelTypeSK])
REFERENCES [Typelist].[LevelType] ([LevelTypeSK])
GO
ALTER TABLE [Reins].[TreatyLimit] NOCHECK CONSTRAINT [FK_LevelTypeSK_TreatyLimit]
GO
ALTER TABLE [Reins].[TreatyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_LimitDeductibleTypeSK_TreatyLimit] FOREIGN KEY([LimitDeductibleTypeSK])
REFERENCES [Typelist].[LimitDeductibleType] ([LimitDeductibleTypeSK])
GO
ALTER TABLE [Reins].[TreatyLimit] NOCHECK CONSTRAINT [FK_LimitDeductibleTypeSK_TreatyLimit]
GO
ALTER TABLE [Reins].[TreatyLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_NonProportionalTreatySK_TreatyLimit] FOREIGN KEY([NonProportionalTreatySK])
REFERENCES [Reins].[NonProportionalTreaty] ([NonProportionalTreatySK])
GO
ALTER TABLE [Reins].[TreatyLimit] NOCHECK CONSTRAINT [FK_NonProportionalTreatySK_TreatyLimit]
GO
ALTER TABLE [Reins].[TreatyLimit]  WITH NOCHECK ADD  CONSTRAINT [RefProportionalTreaty1048] FOREIGN KEY([ProportionalTreatySK])
REFERENCES [Reins].[ProportionalTreaty] ([ProportionalTreatySK])
GO
ALTER TABLE [Reins].[TreatyLimit] NOCHECK CONSTRAINT [RefProportionalTreaty1048]
GO
ALTER TABLE [Reins].[TreatyLimit]  WITH NOCHECK ADD  CONSTRAINT [RefTreatySection1049] FOREIGN KEY([TreatySectionSK])
REFERENCES [Reins].[TreatySection] ([TreatySectionSK])
GO
ALTER TABLE [Reins].[TreatyLimit] NOCHECK CONSTRAINT [RefTreatySection1049]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Treaty Limit' , @level0type=N'SCHEMA',@level0name=N'Reins', @level1type=N'TABLE',@level1name=N'TreatyLimit'
GO
