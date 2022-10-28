USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[ClaimTransaction]    Script Date: 28.10.2022 12:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[ClaimTransaction](
	[ClaimTransactionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[FinancialReportingPeriodSK] [int] NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[ClaimPolicySK] [int] NOT NULL,
	[PolicySK] [int] NULL,
	[TreatySK] [int] NULL,
	[LossEventSK] [int] NOT NULL,
	[LossOccurrenceSK] [int] NOT NULL,
	[ClaimCoverageSK] [int] NULL,
	[WritingCompanySK] [int] NOT NULL,
	[AuthorizationStatusSK] [int] NULL,
	[ClaimTransactionTypeSK] [int] NOT NULL,
	[CostTypeSK] [int] NOT NULL,
	[ClaimTransactionCategoryTypeSK] [int] NULL,
	[PaymentTypeSK] [int] NULL,
	[RecoveryCategoryTypeSK] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[TransactionBaseAmt] [decimal](19, 4) NULL,
	[TransactionOriginalAmt] [decimal](19, 4) NULL,
	[TransactionReportingAmt] [decimal](19, 4) NULL,
	[TransactionDate] [date] NULL,
 CONSTRAINT [PK_ClaimTransaction] PRIMARY KEY CLUSTERED 
(
	[ClaimTransactionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimTransaction]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimTransaction] ON [Finance].[ClaimTransaction]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_AuthorizationStatusSK_ClaimTransaction] FOREIGN KEY([AuthorizationStatusSK])
REFERENCES [Typelist].[AuthorizationStatus] ([AuthorizationStatusSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_AuthorizationStatusSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_ClaimTransaction] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_BaseCurrencySK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimCoverageSK_ClaimTransaction] FOREIGN KEY([ClaimCoverageSK])
REFERENCES [Claim].[ClaimCoverage] ([ClaimCoverageSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_ClaimCoverageSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimPolicy_ClaimTransaction] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_ClaimPolicy_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimTransaction] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_ClaimSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimTransactionCategoryTypeSK_ClaimTransaction] FOREIGN KEY([ClaimTransactionCategoryTypeSK])
REFERENCES [Typelist].[ClaimTransactionCategoryType] ([ClaimTransactionCategoryTypeSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_ClaimTransactionCategoryTypeSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimTransactionTypeSK_ClaimTransaction] FOREIGN KEY([ClaimTransactionTypeSK])
REFERENCES [Typelist].[ClaimTransactionType] ([ClaimTransactionTypeSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_ClaimTransactionTypeSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_CostTypeSK_ClaimTransaction] FOREIGN KEY([CostTypeSK])
REFERENCES [Typelist].[CostType] ([CostTypeSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_CostTypeSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_LossOccurrenceSK_ClaimTransaction] FOREIGN KEY([LossOccurrenceSK])
REFERENCES [Claim].[LossOccurrence] ([LossOccurrenceSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_LossOccurrenceSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_ClaimTransaction] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_PaymentTypeSK_ClaimTransaction] FOREIGN KEY([PaymentTypeSK])
REFERENCES [Typelist].[PaymentType] ([PaymentTypeSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_PaymentTypeSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_RecoveryCategoryTypeSK_ClaimTransaction] FOREIGN KEY([RecoveryCategoryTypeSK])
REFERENCES [Typelist].[RecoveryCategoryType] ([RecoveryCategoryTypeSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_RecoveryCategoryTypeSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_ClaimTransaction] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_WritingCompanySK_ClaimTransaction] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [FK_WritingCompanySK_ClaimTransaction]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [RefFinancialReportingPeriod1061] FOREIGN KEY([FinancialReportingPeriodSK])
REFERENCES [Typelist].[FinancialReportingPeriod] ([FinancialReportingPeriodSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [RefFinancialReportingPeriod1061]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [RefLossEvent1088] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [RefLossEvent1088]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [RefPolicy1056] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [RefPolicy1056]
GO
ALTER TABLE [Finance].[ClaimTransaction]  WITH NOCHECK ADD  CONSTRAINT [RefTreaty1057] FOREIGN KEY([TreatySK])
REFERENCES [Reins].[Treaty] ([TreatySK])
GO
ALTER TABLE [Finance].[ClaimTransaction] NOCHECK CONSTRAINT [RefTreaty1057]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Payments made to claimants and other payees of claim expenses.   Examples, allocated claim expenses; court costs, fees, and expenses paid  that can be charged to specific claims.  May also include unallocated claim expenses that represent salaries and other overhead expenses that are incurred in adjusting and recording claims but that cannot be charged against specific claims.' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'ClaimTransaction'
GO
