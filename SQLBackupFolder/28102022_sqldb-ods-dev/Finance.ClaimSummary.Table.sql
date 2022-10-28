USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[ClaimSummary]    Script Date: 28.10.2022 12:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[ClaimSummary](
	[ClaimSummarySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[Sourcecode] [varchar](254) NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[ClaimCoverageSK] [int] NOT NULL,
	[ClaimPolicySK] [int] NULL,
	[FinancialReportingPeriodSK] [int] NOT NULL,
	[ClassCodeSK] [int] NULL,
	[ClaimStatusSK] [int] NOT NULL,
	[DomicileStateSK] [int] NOT NULL,
	[WritingCompanySK] [int] NULL,
	[CauseCode] [varchar](15) NULL,
	[CauseDesc] [varchar](255) NULL,
	[AnnualStatementLineofBusinessSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[LossPaidBaseAmt] [decimal](14, 4) NULL,
	[LossPaidOriginalAmt] [decimal](19, 4) NULL,
	[LossPaidReportingAmt] [decimal](19, 4) NULL,
	[LossPaidExpenseBaseAmt] [decimal](19, 4) NULL,
	[LossPaidExpenseOriginalAmt] [decimal](19, 4) NULL,
	[LossPaidExpenseReportingAmt] [decimal](19, 4) NULL,
	[LossReserveBaseAmt] [decimal](19, 4) NULL,
	[LossReserveOriginalAmt] [decimal](19, 4) NULL,
	[LossReserveReportingAmt] [decimal](19, 4) NULL,
	[LossReserveExpenseBaseAmt] [decimal](19, 4) NULL,
	[LossReserveExpenseOriginalAmt] [decimal](19, 4) NULL,
	[LossReserveExpenseReportingAmt] [decimal](19, 4) NULL,
	[LossRecoveryBaseAmt] [decimal](19, 4) NULL,
	[LossRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[LossRecoveryReportingAmt] [decimal](19, 4) NULL,
	[LossRecoveryExpenseBaseAmt] [decimal](19, 4) NULL,
	[LossRecoveryExpenseOriginalAmt] [decimal](19, 4) NULL,
	[LossRecoveryExpenseReportingAmt] [decimal](19, 4) NULL,
	[LossExpectedRecoveryBaseAmt] [decimal](19, 4) NULL,
	[LossExpectedRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[LossExpectedRecoveryReportingAmt] [decimal](19, 4) NULL,
	[ALAEPaidBaseAmt] [decimal](19, 4) NULL,
	[ALAEPaidOriginalAmt] [decimal](19, 4) NULL,
	[ALAEPaidReportingAmt] [decimal](19, 4) NULL,
	[ALAEReserveBaseAmt] [decimal](19, 4) NULL,
	[ALAEReserveOriginalAmt] [decimal](19, 4) NULL,
	[ALAEReserveReportingAmt] [decimal](19, 4) NULL,
	[ALAERecoveryBaseAmt] [decimal](19, 4) NULL,
	[ALAERecoveryOriginalAmt] [decimal](19, 4) NULL,
	[ALAERecoveryReportingAmt] [decimal](19, 4) NULL,
	[ALAEExpectedRecoveryBaseAmt] [decimal](19, 4) NULL,
	[ALAEExpectedRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[ALAEExpectedRecoveryReportingAmt] [decimal](19, 4) NULL,
	[ULAEPaidBaseAmt] [decimal](19, 4) NULL,
	[ULAEPaidOriginalAmt] [decimal](19, 4) NULL,
	[ULAEPaidReportingAmt] [decimal](19, 4) NULL,
	[ULAEReserveBaseAmt] [decimal](19, 4) NULL,
	[ULAEReserveOriginalAmt] [decimal](19, 4) NULL,
	[ULAEReserveReportingAmt] [decimal](19, 4) NULL,
	[ULAERecoveryBaseAmt] [decimal](19, 4) NULL,
	[ULAERecoveryOriginalAmt] [decimal](19, 4) NULL,
	[ULAERecoveryReportingAmt] [decimal](19, 4) NULL,
	[ULAEExpectedRecoveryBaseAmt] [decimal](19, 4) NULL,
	[ULAEExpectedRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[ULAEExpectedRecoveryReportingAmt] [decimal](19, 4) NULL,
	[MedicalPaidBaseAmt] [decimal](19, 4) NULL,
	[MedicalPaidOriginalAmt] [decimal](19, 4) NULL,
	[MedicalPaidReportingAmt] [decimal](19, 4) NULL,
	[MedicalReserveBaseAmt] [decimal](19, 4) NULL,
	[MedicalReserveOriginalAmt] [decimal](19, 4) NULL,
	[MedicalReserveReportingAmt] [decimal](19, 4) NULL,
	[MedicalRecoveryBaseAmt] [decimal](19, 4) NULL,
	[MedicalRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[MedicalRecoveryReportingAmt] [decimal](19, 4) NULL,
	[MedicalExpectedRecoveryBaseAmt] [decimal](19, 4) NULL,
	[MedicalExpectedRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[MedicalExpectedRecoveryReportingAmt] [decimal](19, 4) NULL,
	[VocationRehabPaidBaseAmt] [decimal](19, 4) NULL,
	[VocationRehabPaidOriginalAmt] [decimal](19, 4) NULL,
	[VocationRehabPaidReportingAmt] [decimal](19, 4) NULL,
	[VocationRehabReserveBaseAmt] [decimal](19, 4) NULL,
	[VocationRehabReserveOriginalAmt] [decimal](19, 4) NULL,
	[VocationRehabReserveReportingAmt] [decimal](19, 4) NULL,
	[VocationRehabRecoveryBaseAmt] [decimal](19, 4) NULL,
	[VocationRehabRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[VocationRehabRecoveryReportingAmt] [decimal](19, 4) NULL,
	[VocationRehabExpectedRecoveryBaseAmt] [decimal](19, 4) NULL,
	[VocationRehabExpectedRecoveryOriginalAmt] [decimal](19, 4) NULL,
	[VocationRehabExpectedRecoveryReportingAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_ClaimSummary] PRIMARY KEY CLUSTERED 
(
	[ClaimSummarySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_AnnualStatementLineofBusinessSK_ClaimSummary] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [Typelist].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_AnnualStatementLineofBusinessSK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_ClaimSummary] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_BaseCurrencySK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimCoverageSK_ClaimSummary] FOREIGN KEY([ClaimCoverageSK])
REFERENCES [Claim].[ClaimCoverage] ([ClaimCoverageSK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_ClaimCoverageSK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimPolicy_ClaimSummary] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_ClaimPolicy_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimSummary] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_ClaimSK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimStatus_ClaimSummary] FOREIGN KEY([ClaimStatusSK])
REFERENCES [Typelist].[ClaimStatus] ([ClaimStatusSK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_ClaimStatus_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_ClassCode_ClaimSummary] FOREIGN KEY([ClassCodeSK])
REFERENCES [Typelist].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_ClassCode_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_DomicileStateSK_ClaimSummary] FOREIGN KEY([DomicileStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_DomicileStateSK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_FinancialReportingPeriod_ClaimSummary] FOREIGN KEY([FinancialReportingPeriodSK])
REFERENCES [Typelist].[FinancialReportingPeriod] ([FinancialReportingPeriodSK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_FinancialReportingPeriod_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_ClaimSummary] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_ClaimSummary] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimSummary] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimSummary]
GO
ALTER TABLE [Finance].[ClaimSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_WritingCompany_ClaimSummary] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[ClaimSummary] NOCHECK CONSTRAINT [FK_WritingCompany_ClaimSummary]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Claim Summary is a monthly (financial reporting period) snapshot of accumulated period claim transactions' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'ClaimSummary'
GO
