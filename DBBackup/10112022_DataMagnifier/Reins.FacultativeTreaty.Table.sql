USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[FacultativeTreaty]    Script Date: 10.11.2022 14:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Reins].[FacultativeTreaty]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_PolicySK_FacultativeTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[FacultativeTreaty]'))
ALTER TABLE [Reins].[FacultativeTreaty]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_FacultativeTreaty] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_PolicySK_FacultativeTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[FacultativeTreaty]'))
ALTER TABLE [Reins].[FacultativeTreaty] CHECK CONSTRAINT [FK_PolicySK_FacultativeTreaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_ProfitAnalysisSK_FacultativeTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[FacultativeTreaty]'))
ALTER TABLE [Reins].[FacultativeTreaty]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_FacultativeTreaty] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_ProfitAnalysisSK_FacultativeTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[FacultativeTreaty]'))
ALTER TABLE [Reins].[FacultativeTreaty] CHECK CONSTRAINT [FK_ProfitAnalysisSK_FacultativeTreaty]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatySK_FacultativeTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[FacultativeTreaty]'))
ALTER TABLE [Reins].[FacultativeTreaty]  WITH CHECK ADD  CONSTRAINT [FK_TreatySK_FacultativeTreaty] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Reins].[FK_TreatySK_FacultativeTreaty]') AND parent_object_id = OBJECT_ID(N'[Reins].[FacultativeTreaty]'))
ALTER TABLE [Reins].[FacultativeTreaty] CHECK CONSTRAINT [FK_TreatySK_FacultativeTreaty]
GO
