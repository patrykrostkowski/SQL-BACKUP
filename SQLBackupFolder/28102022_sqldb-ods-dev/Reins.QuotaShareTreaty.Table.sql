USE [sqldb-ods-dev]
GO
/****** Object:  Table [Reins].[QuotaShareTreaty]    Script Date: 28.10.2022 15:05:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reins].[QuotaShareTreaty](
	[QuotaShareTreatySK] [int] IDENTITY(2,1) NOT NULL,
	[ProportionalTreatySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[CessionRatePct] [decimal](8, 2) NOT NULL,
	[RetentionRatePct] [decimal](8, 2) NULL,
	[CommissionPct] [decimal](9, 4) NULL,
	[ReinstatementTypeDesc] [varchar](50) NULL,
 CONSTRAINT [PK_QuotaShareTreaty] PRIMARY KEY CLUSTERED 
(
	[ProportionalTreatySK] ASC,
	[QuotaShareTreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuotaShareTreaty]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuotaShareTreaty] ON [Reins].[QuotaShareTreaty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Reins].[QuotaShareTreaty]  WITH NOCHECK ADD  CONSTRAINT [FK_ProportionalTreatySK_QuotaShareTreaty] FOREIGN KEY([ProportionalTreatySK])
REFERENCES [Reins].[ProportionalTreaty] ([ProportionalTreatySK])
GO
ALTER TABLE [Reins].[QuotaShareTreaty] NOCHECK CONSTRAINT [FK_ProportionalTreatySK_QuotaShareTreaty]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' Quota share reinsurance is considered proportional.  A quota share treaty is a pro-rata reinsurance contract in which the insurer and the list of reinsurers share premiums and losses according to a fixed percentage.' , @level0type=N'SCHEMA',@level0name=N'Reins', @level1type=N'TABLE',@level1name=N'QuotaShareTreaty'
GO
