USE [sqldb-ods-dev]
GO
/****** Object:  Table [Reins].[FacultativeTreaty]    Script Date: 28.10.2022 12:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reins].[FacultativeTreaty](
	[FacultativeTreatySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[TreatySK] [int] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[CertificateNum] [varchar](20) NULL,
	[EffectiveDate] [date] NULL,
	[EexpirationDate] [date] NULL,
	[CessionRatePct] [decimal](8, 2) NULL,
	[ProfitAnalysisSK] [int] NULL,
 CONSTRAINT [PK_FacultativeTreaty] PRIMARY KEY CLUSTERED 
(
	[FacultativeTreatySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_FacultativeTreaty]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_FacultativeTreaty] ON [Reins].[FacultativeTreaty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Reins].[FacultativeTreaty]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_FacultativeTreaty] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Reins].[FacultativeTreaty] NOCHECK CONSTRAINT [FK_PolicySK_FacultativeTreaty]
GO
ALTER TABLE [Reins].[FacultativeTreaty]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_FacultativeTreaty] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [Typelist].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
ALTER TABLE [Reins].[FacultativeTreaty] NOCHECK CONSTRAINT [FK_ProfitAnalysisSK_FacultativeTreaty]
GO
ALTER TABLE [Reins].[FacultativeTreaty]  WITH NOCHECK ADD  CONSTRAINT [FK_TreatySK_FacultativeTreaty] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
ALTER TABLE [Reins].[FacultativeTreaty] NOCHECK CONSTRAINT [FK_TreatySK_FacultativeTreaty]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Facultative reinsurance is an optional method, under which the direct insurer (ceding company or cedant) offers each risk individually to the reinsurer for his consideration. The reinsurer consequently receives full details of each risk offered, as he would if he were to write it on a direct basis, and he has the option to reject the offer or to agree to acceptance on such terms and conditions as he may prescribe. The offer and acceptance are thus optional on both sides, and there is no valid contract until and unless the offer is accepted.' , @level0type=N'SCHEMA',@level0name=N'Reins', @level1type=N'TABLE',@level1name=N'FacultativeTreaty'
GO
