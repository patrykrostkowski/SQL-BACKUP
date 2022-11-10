USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimCoverage]    Script Date: 10.11.2022 14:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]') AND type in (N'U'))
BEGIN
CREATE TABLE [Claim].[ClaimCoverage](
	[ClaimCoverageSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[CoverageSequenceNum] [varchar](3) NULL,
	[ClaimPolicySK] [int] NULL,
	[CoverageSK] [int] NOT NULL,
	[SubCoverageSK] [int] NULL,
	[ProfitAnalysisSK] [int] NULL,
	[CoverageTriggerSK] [int] NULL,
	[CoverageClassSK] [int] NULL,
	[ClaimCurrencySK] [int] NULL,
	[PolicyCurrencySK] [int] NULL,
	[AnnualStatementLineofBusinessSK] [int] NULL,
	[TreatySharePct] [decimal](8, 2) NULL,
	[CoinsurancePct] [decimal](8, 2) NULL,
	[SharePct] [decimal](8, 2) NULL,
	[SignedLinePct] [decimal](8, 2) NULL,
	[SignedOrderPct] [decimal](8, 2) NULL,
	[WrittenLinePct] [decimal](8, 2) NULL,
	[WrittenOrderPct] [decimal](8, 2) NULL,
	[IncidentLimitAmt] [decimal](19, 4) NULL,
	[AttachmentPointAmt] [decimal](19, 4) NULL,
	[ExposureLimitAmt] [decimal](19, 4) NULL,
	[DeductibleAmt] [decimal](19, 4) NULL,
	[OccurrenceLimitAmt] [decimal](19, 4) NULL,
	[BondLimitAmt] [decimal](19, 4) NULL,
	[PartOfAmt] [decimal](19, 4) NULL,
	[LayerRetentionAmt] [decimal](19, 4) NULL,
	[NotesTxt] [varchar](255) NULL,
 CONSTRAINT [PK_ClaimCoverage] PRIMARY KEY CLUSTERED 
(
	[ClaimCoverageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AnnualStatementLineofBusinessSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage]  WITH CHECK ADD  CONSTRAINT [FK_AnnualStatementLineofBusinessSK_ClaimCoverage] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [TypeList].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AnnualStatementLineofBusinessSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage] CHECK CONSTRAINT [FK_AnnualStatementLineofBusinessSK_ClaimCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCurrencySK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_ClaimCoverage] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCurrencySK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage] CHECK CONSTRAINT [FK_ClaimCurrencySK_ClaimCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimPolicySK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage]  WITH CHECK ADD  CONSTRAINT [FK_ClaimPolicySK_ClaimCoverage] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimPolicySK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage] CHECK CONSTRAINT [FK_ClaimPolicySK_ClaimCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CoverageClassSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage]  WITH CHECK ADD  CONSTRAINT [FK_CoverageClassSK_ClaimCoverage] FOREIGN KEY([CoverageClassSK])
REFERENCES [TypeList].[CoverageClass] ([CoverageClassSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CoverageClassSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage] CHECK CONSTRAINT [FK_CoverageClassSK_ClaimCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CoverageSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage]  WITH CHECK ADD  CONSTRAINT [FK_CoverageSK_ClaimCoverage] FOREIGN KEY([CoverageSK])
REFERENCES [TypeList].[Coverage] ([CoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CoverageSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage] CHECK CONSTRAINT [FK_CoverageSK_ClaimCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CoverageTriggerSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage]  WITH CHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_ClaimCoverage] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [TypeList].[CoverageTrigger] ([CoverageTriggerSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CoverageTriggerSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage] CHECK CONSTRAINT [FK_CoverageTriggerSK_ClaimCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicyCurrencySK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCurrencySK_ClaimCoverage] FOREIGN KEY([PolicyCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicyCurrencySK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage] CHECK CONSTRAINT [FK_PolicyCurrencySK_ClaimCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ProfitAnalysisSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_ClaimCoverage] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ProfitAnalysisSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage] CHECK CONSTRAINT [FK_ProfitAnalysisSK_ClaimCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SubCoverageSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage]  WITH CHECK ADD  CONSTRAINT [FK_SubCoverageSK_ClaimCoverage] FOREIGN KEY([SubCoverageSK])
REFERENCES [TypeList].[SubCoverage] ([SubCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SubCoverageSK_ClaimCoverage]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimCoverage]'))
ALTER TABLE [Claim].[ClaimCoverage] CHECK CONSTRAINT [FK_SubCoverageSK_ClaimCoverage]
GO
