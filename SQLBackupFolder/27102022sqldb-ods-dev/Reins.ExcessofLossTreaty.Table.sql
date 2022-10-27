USE [sqldb-ods-dev]
GO
/****** Object:  Table [Reins].[ExcessofLossTreaty]    Script Date: 27.10.2022 12:27:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reins].[ExcessofLossTreaty](
	[ExcessofLossTreatySK] [int] IDENTITY(2,1) NOT NULL,
	[NonProportionalTreatySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[CessionRatePct] [decimal](8, 2) NOT NULL,
	[RetentionRatePct] [decimal](8, 2) NULL,
 CONSTRAINT [PK_QuotaShareTreaty_1] PRIMARY KEY CLUSTERED 
(
	[NonProportionalTreatySK] ASC,
	[ExcessofLossTreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuotaShareTreaty_1]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuotaShareTreaty_1] ON [Reins].[ExcessofLossTreaty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Reins].[ExcessofLossTreaty]  WITH NOCHECK ADD  CONSTRAINT [RefNonProportionalTreaty1047] FOREIGN KEY([NonProportionalTreatySK])
REFERENCES [Reins].[NonProportionalTreaty] ([NonProportionalTreatySK])
GO
ALTER TABLE [Reins].[ExcessofLossTreaty] NOCHECK CONSTRAINT [RefNonProportionalTreaty1047]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An example of non-propoertion is excess of loss as the amount of the claim paid by the reinsurer and the ceding company is dependent on the claim severity.' , @level0type=N'SCHEMA',@level0name=N'Reins', @level1type=N'TABLE',@level1name=N'ExcessofLossTreaty'
GO
