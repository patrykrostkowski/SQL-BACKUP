USE [DataMagnifier]
GO
/****** Object:  Table [Reins].[FacultativeTreaty]    Script Date: 18.11.2022 16:40:21 ******/
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
ALTER TABLE [Reins].[FacultativeTreaty]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_FacultativeTreaty] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Reins].[FacultativeTreaty] CHECK CONSTRAINT [FK_PolicySK_FacultativeTreaty]
GO
ALTER TABLE [Reins].[FacultativeTreaty]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_FacultativeTreaty] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
ALTER TABLE [Reins].[FacultativeTreaty] CHECK CONSTRAINT [FK_ProfitAnalysisSK_FacultativeTreaty]
GO
ALTER TABLE [Reins].[FacultativeTreaty]  WITH CHECK ADD  CONSTRAINT [FK_TreatySK_FacultativeTreaty] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
ALTER TABLE [Reins].[FacultativeTreaty] CHECK CONSTRAINT [FK_TreatySK_FacultativeTreaty]
GO
