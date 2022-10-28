USE [sqldb-ods-dev]
GO
/****** Object:  Table [Reins].[ProportionalTreaty]    Script Date: 28.10.2022 13:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reins].[ProportionalTreaty](
	[ProportionalTreatySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[TreatySK] [int] NOT NULL,
	[FrequencyPeriodCode] [varchar](20) NULL,
	[CommisionPct] [decimal](8, 2) NULL,
 CONSTRAINT [PK_ProportionalTreaty] PRIMARY KEY CLUSTERED 
(
	[ProportionalTreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ProportionalTreaty]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ProportionalTreaty] ON [Reins].[ProportionalTreaty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Reins].[ProportionalTreaty]  WITH NOCHECK ADD  CONSTRAINT [FK_TreatySK_ProportionalTreaty] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
ALTER TABLE [Reins].[ProportionalTreaty] NOCHECK CONSTRAINT [FK_TreatySK_ProportionalTreaty]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An example of proportional is quota share treaty''s. 
Under proportional reinsurance, the cedant and the reinsurer share the original risk on pro rata basis, and they also share the premiums and claims in the same proportion. This concept could be applied to an individual risk (facultative) or to a number of risks covered by a single contract (treaty). There is thus a complete community of interest between the parties to the contract.' , @level0type=N'SCHEMA',@level0name=N'Reins', @level1type=N'TABLE',@level1name=N'ProportionalTreaty'
GO
