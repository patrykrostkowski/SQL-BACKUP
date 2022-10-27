USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[ClaimCoverage]    Script Date: 27.10.2022 12:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimCoverage]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimCoverage] ON [Claim].[ClaimCoverage]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[ClaimCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_AnnualStatementLineofBusinessSK_ClaimCoverage] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [Typelist].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
ALTER TABLE [Claim].[ClaimCoverage] NOCHECK CONSTRAINT [FK_AnnualStatementLineofBusinessSK_ClaimCoverage]
GO
ALTER TABLE [Claim].[ClaimCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_ClaimCoverage] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Claim].[ClaimCoverage] NOCHECK CONSTRAINT [FK_ClaimCurrencySK_ClaimCoverage]
GO
ALTER TABLE [Claim].[ClaimCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimPolicySK_ClaimCoverage] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
ALTER TABLE [Claim].[ClaimCoverage] NOCHECK CONSTRAINT [FK_ClaimPolicySK_ClaimCoverage]
GO
ALTER TABLE [Claim].[ClaimCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageClassSK_ClaimCoverage] FOREIGN KEY([CoverageClassSK])
REFERENCES [Typelist].[CoverageClass] ([CoverageClassSK])
GO
ALTER TABLE [Claim].[ClaimCoverage] NOCHECK CONSTRAINT [FK_CoverageClassSK_ClaimCoverage]
GO
ALTER TABLE [Claim].[ClaimCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageSK_ClaimCoverage] FOREIGN KEY([CoverageSK])
REFERENCES [Typelist].[Coverage] ([CoverageSK])
GO
ALTER TABLE [Claim].[ClaimCoverage] NOCHECK CONSTRAINT [FK_CoverageSK_ClaimCoverage]
GO
ALTER TABLE [Claim].[ClaimCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_ClaimCoverage] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [Typelist].[CoverageTrigger] ([CoverageTriggerSK])
GO
ALTER TABLE [Claim].[ClaimCoverage] NOCHECK CONSTRAINT [FK_CoverageTriggerSK_ClaimCoverage]
GO
ALTER TABLE [Claim].[ClaimCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyCurrencySK_ClaimCoverage] FOREIGN KEY([PolicyCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Claim].[ClaimCoverage] NOCHECK CONSTRAINT [FK_PolicyCurrencySK_ClaimCoverage]
GO
ALTER TABLE [Claim].[ClaimCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_ClaimCoverage] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [Typelist].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
ALTER TABLE [Claim].[ClaimCoverage] NOCHECK CONSTRAINT [FK_ProfitAnalysisSK_ClaimCoverage]
GO
ALTER TABLE [Claim].[ClaimCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[ClaimCoverage] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimCoverage]
GO
ALTER TABLE [Claim].[ClaimCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_SubCoverageSK_ClaimCoverage] FOREIGN KEY([SubCoverageSK])
REFERENCES [Typelist].[SubCoverage] ([SubCoverageSK])
GO
ALTER TABLE [Claim].[ClaimCoverage] NOCHECK CONSTRAINT [FK_SubCoverageSK_ClaimCoverage]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A policy risk management component detailing the circumstances under which a claim benefit will be paid.' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'ClaimCoverage'
GO
