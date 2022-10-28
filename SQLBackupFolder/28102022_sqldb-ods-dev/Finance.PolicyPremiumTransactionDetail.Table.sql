USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[PolicyPremiumTransactionDetail]    Script Date: 28.10.2022 11:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[PolicyPremiumTransactionDetail](
	[PolicyPremiumTransactionDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[FinancialSourceTransactionTypeSK] [int] NOT NULL,
	[PolicyPremiumHeaderSK] [int] NOT NULL,
	[TransactionDate] [date] NOT NULL,
	[EntryDate] [date] NOT NULL,
	[SettlementDate] [date] NULL,
	[LastAllocationDate] [date] NULL,
	[WritingCompanySK] [int] NULL,
	[PolicyTransTypeSK] [int] NOT NULL,
	[TransStartDateTime] [datetime] NULL,
	[TransEndDateTime] [datetime] NULL,
	[PolicyTransNum] [int] NULL,
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
 CONSTRAINT [PK305] PRIMARY KEY CLUSTERED 
(
	[PolicyPremiumTransactionDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyPremiumHeaderSK_PolicyPremiumTransactionDetail] FOREIGN KEY([PolicyPremiumHeaderSK])
REFERENCES [Finance].[PolicyPremiumHeader] ([PolicyPremiumHeaderSK])
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail] NOCHECK CONSTRAINT [FK_PolicyPremiumHeaderSK_PolicyPremiumTransactionDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_.PolicyPremiumTransactionDetail] FOREIGN KEY([PolicyTransTypeSK])
REFERENCES [Typelist].[PolicyTransType] ([PolicyTransTypeSK])
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail] NOCHECK CONSTRAINT [FK_StateSK_.PolicyPremiumTransactionDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail]  WITH NOCHECK ADD  CONSTRAINT [RefAnnualStatementLineofBusiness1008] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [Typelist].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail] NOCHECK CONSTRAINT [RefAnnualStatementLineofBusiness1008]
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail]  WITH NOCHECK ADD  CONSTRAINT [RefCurrency1014] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail] NOCHECK CONSTRAINT [RefCurrency1014]
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail]  WITH NOCHECK ADD  CONSTRAINT [RefCurrency1018] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail] NOCHECK CONSTRAINT [RefCurrency1018]
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail]  WITH NOCHECK ADD  CONSTRAINT [RefCurrency1022] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail] NOCHECK CONSTRAINT [RefCurrency1022]
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail]  WITH NOCHECK ADD  CONSTRAINT [RefFinancialSourceTransactionType990] FOREIGN KEY([FinancialSourceTransactionTypeSK])
REFERENCES [Typelist].[FinancialSourceTransactionType] ([FinancialSourceTransactionTypeSK])
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail] NOCHECK CONSTRAINT [RefFinancialSourceTransactionType990]
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail]  WITH NOCHECK ADD  CONSTRAINT [RefFinancialSourceTransactionType991] FOREIGN KEY([FinancialSourceTransactionTypeSK])
REFERENCES [Typelist].[FinancialSourceTransactionType] ([FinancialSourceTransactionTypeSK])
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail] NOCHECK CONSTRAINT [RefFinancialSourceTransactionType991]
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem996] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail] NOCHECK CONSTRAINT [RefSourceSystem996]
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail]  WITH NOCHECK ADD  CONSTRAINT [RefWritingCompany1006] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[PolicyPremiumTransactionDetail] NOCHECK CONSTRAINT [RefWritingCompany1006]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Folloiwng the Policy Financial Detail, the transaction detail is the  next level of financialsl.  It contains all measures for the stated policy transaction record,  Includes the premium balances along with the delta  return premiums' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'PolicyPremiumTransactionDetail'
GO
