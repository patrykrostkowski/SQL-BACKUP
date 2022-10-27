USE [sqldb-ods-dev]
GO
/****** Object:  Table [Reins].[NonProportionalTreaty]    Script Date: 27.10.2022 12:27:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reins].[NonProportionalTreaty](
	[NonProportionalTreatySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[TreatySK] [int] NOT NULL,
 CONSTRAINT [PK_NonProportionalTreaty] PRIMARY KEY CLUSTERED 
(
	[NonProportionalTreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_NonProportionalTreaty]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_NonProportionalTreaty] ON [Reins].[NonProportionalTreaty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Reins].[NonProportionalTreaty]  WITH NOCHECK ADD  CONSTRAINT [FK_TreatySK_NonProportionalTreaty] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
ALTER TABLE [Reins].[NonProportionalTreaty] NOCHECK CONSTRAINT [FK_TreatySK_NonProportionalTreaty]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An example of non-propoertion is excess of loss as the amount of the claim paid by the reinsurer and the ceding company is dependent on the claim severity.' , @level0type=N'SCHEMA',@level0name=N'Reins', @level1type=N'TABLE',@level1name=N'NonProportionalTreaty'
GO
