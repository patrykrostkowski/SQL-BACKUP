USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[PolicyPremiumCoverageDetail]    Script Date: 28.10.2022 15:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[PolicyPremiumCoverageDetail](
	[PolicyPremiumCoverageDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[FinancialSourceTransactionTypeSK] [int] NOT NULL,
	[TransactionDate] [date] NOT NULL,
	[EntryDate] [date] NOT NULL,
	[SettlementDate] [date] NULL,
	[LastAllocationDate] [date] NULL,
	[WritingCompanySK] [int] NULL,
	[PolicyPremiumHeaderSK] [int] NOT NULL,
	[PolicyTransTypeSK] [int] NOT NULL,
	[TransStartDateTime] [datetime] NULL,
	[TransEndDateTime] [datetime] NULL,
	[PolicyTransNum] [int] NULL,
	[LineofBusinessSK] [int] NOT NULL,
	[SublineSK] [int] NULL,
	[RiskStateSK] [int] NULL,
	[InsurableObjectTypeSK] [int] NULL,
	[CoverageSK] [int] NULL,
	[SubCoverageSK] [int] NULL,
	[PolicyPremiumTransactionDetailSK] [int] NULL,
	[ProfitCenterSK] [int] NULL,
	[PolicyPremiumlLineofBusinessDetailSK] [int] NULL,
	[PolicyPremiumGeographyDetailSK] [int] NULL,
	[AnnualStatementLineofBusinessSK] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[EstimatedWrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[EstimatedWrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[EstimatedWrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[AddlRetPremiumBaseAmt] [decimal](19, 4) NULL,
	[AddlRetPremiumOriginalAmt] [decimal](19, 4) NULL,
	[AddlRetPremiumReportingAmt] [decimal](19, 4) NULL,
	[PolicyDiscountBaseAmt] [decimal](19, 4) NULL,
	[PolicyDiscountOriginalAmt] [decimal](19, 4) NULL,
	[PolicyDiscountReportingAmt] [decimal](19, 4) NULL,
	[DirectWrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[DirectWrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[DirectWrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[DirectTaxBaseAmt] [decimal](19, 4) NULL,
	[DirectTaxOriginalAmt] [decimal](19, 4) NULL,
	[DirectTaxReportingAmt] [decimal](19, 4) NULL,
	[DirectSurchargeBaseAmt] [decimal](19, 4) NULL,
	[DirectSurchargeOriginalAmt] [decimal](19, 4) NULL,
	[DirectSurchargeReportingAmt] [decimal](19, 4) NULL,
	[DirectFeeBaseAmt] [decimal](19, 4) NULL,
	[DirectFeeOriginalAmt] [decimal](19, 4) NULL,
	[DirectFeeReportingAmt] [decimal](19, 4) NULL,
	[AssumedWrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[AssumedWrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[AssumedWrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[AssumedTaxBaseAmt] [decimal](19, 4) NULL,
	[AssumedTaxOriginalAmt] [decimal](19, 4) NULL,
	[AssumedTaxReportingAmt] [decimal](19, 4) NULL,
	[AssumedSurchargeBaseAmt] [decimal](19, 4) NULL,
	[AssumedSurchargeOriginalAmt] [decimal](19, 4) NULL,
	[AssumedSurchargeReportingAmt] [decimal](19, 4) NULL,
	[AssumedFeeBaseAmt] [decimal](19, 4) NULL,
	[AssumedFeeOriginalAmt] [decimal](19, 4) NULL,
	[AssumedFeeReportingAmt] [decimal](19, 4) NULL,
	[CommissionBaseAmt] [decimal](19, 4) NULL,
	[CommissionOriginalAmt] [decimal](19, 4) NULL,
	[CommissionReportingAmt] [decimal](19, 4) NULL,
	[CommissionPct] [decimal](6, 4) NULL,
	[IsPremiumWaivedInd] [tinyint] NULL,
 CONSTRAINT [PK305_1_1_1] PRIMARY KEY CLUSTERED 
(
	[PolicyPremiumCoverageDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageSK_PolicyPremiumCoverageDetail] FOREIGN KEY([CoverageSK])
REFERENCES [Typelist].[Coverage] ([CoverageSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [FK_CoverageSK_PolicyPremiumCoverageDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_LineofBusiness_PolicyPremiumCoverageDetail] FOREIGN KEY([LineofBusinessSK])
REFERENCES [Typelist].[LineofBusiness] ([LineofBusinessSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [FK_LineofBusiness_PolicyPremiumCoverageDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyPremiumGeographyDetailSK_PolicyPremiumCoverageDetail] FOREIGN KEY([PolicyPremiumGeographyDetailSK])
REFERENCES [Finance].[PolicyPremiumGeographyDetail] ([PolicyPremiumGeographyDetailSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [FK_PolicyPremiumGeographyDetailSK_PolicyPremiumCoverageDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyPremiumHeaderSK_PolicyPremiumCoverageDetail] FOREIGN KEY([PolicyPremiumHeaderSK])
REFERENCES [Finance].[PolicyPremiumHeader] ([PolicyPremiumHeaderSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [FK_PolicyPremiumHeaderSK_PolicyPremiumCoverageDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyPremiumLineofBusinessDetailSK_PolicyPremiumCoverageDetail] FOREIGN KEY([PolicyPremiumlLineofBusinessDetailSK])
REFERENCES [Finance].[PolicyPremiumlLineofBusinessDetail] ([PolicyPremiumlLineofBusinessDetailSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [FK_PolicyPremiumLineofBusinessDetailSK_PolicyPremiumCoverageDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyPremiumTransactionDetailSK_PolicyPremiumCoverageDetail] FOREIGN KEY([PolicyPremiumTransactionDetailSK])
REFERENCES [Finance].[PolicyPremiumTransactionDetail] ([PolicyPremiumTransactionDetailSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [FK_PolicyPremiumTransactionDetailSK_PolicyPremiumCoverageDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfitCenterSK_.PolicyPremiumCoverageDetail] FOREIGN KEY([ProfitCenterSK])
REFERENCES [Typelist].[ProfitCenter] ([ProfitCenterSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [FK_ProfitCenterSK_.PolicyPremiumCoverageDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_.PolicyPremiumCoverageDetail] FOREIGN KEY([PolicyTransTypeSK])
REFERENCES [Typelist].[PolicyTransType] ([PolicyTransTypeSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [FK_StateSK_.PolicyPremiumCoverageDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_PolicyPremiumCoverageDetail] FOREIGN KEY([RiskStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [FK_StateSK_PolicyPremiumCoverageDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SubcoverageSK_PolicyPremiumCoverageDetail] FOREIGN KEY([SubCoverageSK])
REFERENCES [Typelist].[SubCoverage] ([SubCoverageSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [FK_SubcoverageSK_PolicyPremiumCoverageDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [RefAnnualStatementLineofBusiness1009] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [Typelist].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [RefAnnualStatementLineofBusiness1009]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [RefCurrency1017] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [RefCurrency1017]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [RefCurrency1021] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [RefCurrency1021]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [RefCurrency1025] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [RefCurrency1025]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [RefFinancialSourceTransactionType986] FOREIGN KEY([FinancialSourceTransactionTypeSK])
REFERENCES [Typelist].[FinancialSourceTransactionType] ([FinancialSourceTransactionTypeSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [RefFinancialSourceTransactionType986]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [RefInsurableObjectType1012] FOREIGN KEY([InsurableObjectTypeSK])
REFERENCES [Typelist].[InsurableObjectType] ([InsurableObjectTypeSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [RefInsurableObjectType1012]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem992] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [RefSourceSystem992]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [RefSubline1033] FOREIGN KEY([SublineSK])
REFERENCES [Typelist].[Subline] ([SublineSK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [RefSubline1033]
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail]  WITH NOCHECK ADD  CONSTRAINT [RefWritingCompany1003] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[PolicyPremiumCoverageDetail] NOCHECK CONSTRAINT [RefWritingCompany1003]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Following the PolicyGeography  Detail, the Coverage  detail is the  next level of Premiums.  It contains all measures for the stated policy transaction line of business geographies and insurables,  having 1 or more coverages.  Coverages may be at different levels  (Policy, Line of Business, insurables... ) Includes the premium balances along with the delta  return premiums' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'PolicyPremiumCoverageDetail'
GO
