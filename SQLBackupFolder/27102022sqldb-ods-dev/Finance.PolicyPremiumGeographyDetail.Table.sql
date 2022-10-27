USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[PolicyPremiumGeographyDetail]    Script Date: 27.10.2022 12:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[PolicyPremiumGeographyDetail](
	[PolicyPremiumGeographyDetailSK] [int] IDENTITY(2,1) NOT NULL,
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
	[PolicyPremiumTransactionDetailSK] [int] NULL,
	[PolicyPremiumlLineofBusinessDetailSK] [int] NULL,
	[PolicyTransTypeSK] [int] NOT NULL,
	[TransStartDateTime] [datetime] NULL,
	[TransEndDateTime] [datetime] NULL,
	[PolicyTransNum] [int] NULL,
	[LineofBusinessSK] [int] NOT NULL,
	[SublineSK] [int] NOT NULL,
	[RiskStateSK] [int] NOT NULL,
	[AnnualStatementLineofBusinessSK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
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
 CONSTRAINT [PK305_1_1] PRIMARY KEY CLUSTERED 
(
	[PolicyPremiumGeographyDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_LineofBusiness_PolicyPremiumGeographyDetail] FOREIGN KEY([LineofBusinessSK])
REFERENCES [Typelist].[LineofBusiness] ([LineofBusinessSK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [FK_LineofBusiness_PolicyPremiumGeographyDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyPremiumHeaderSK_PolicyPremiumGeographyDetail] FOREIGN KEY([PolicyPremiumHeaderSK])
REFERENCES [Finance].[PolicyPremiumHeader] ([PolicyPremiumHeaderSK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [FK_PolicyPremiumHeaderSK_PolicyPremiumGeographyDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyPremiumLineofBusinessDetailSK_PolicyPremiumGeographyDetail] FOREIGN KEY([PolicyPremiumlLineofBusinessDetailSK])
REFERENCES [Finance].[PolicyPremiumlLineofBusinessDetail] ([PolicyPremiumlLineofBusinessDetailSK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [FK_PolicyPremiumLineofBusinessDetailSK_PolicyPremiumGeographyDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyPremiumTransactionDetailSK_PolicyPremiumGeographyDetail] FOREIGN KEY([PolicyPremiumTransactionDetailSK])
REFERENCES [Finance].[PolicyPremiumTransactionDetail] ([PolicyPremiumTransactionDetailSK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [FK_PolicyPremiumTransactionDetailSK_PolicyPremiumGeographyDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_.PolicyPremiumGeographyDetail] FOREIGN KEY([RiskStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [FK_StateSK_.PolicyPremiumGeographyDetail]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [RefAnnualStatementLineofBusiness1010] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [Typelist].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [RefAnnualStatementLineofBusiness1010]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [RefCurrency1016] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [RefCurrency1016]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [RefCurrency1020] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [RefCurrency1020]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [RefCurrency1024] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [RefCurrency1024]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [RefFinancialSourceTransactionType987] FOREIGN KEY([FinancialSourceTransactionTypeSK])
REFERENCES [Typelist].[FinancialSourceTransactionType] ([FinancialSourceTransactionTypeSK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [RefFinancialSourceTransactionType987]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [RefPolicyTransType1038] FOREIGN KEY([PolicyTransTypeSK])
REFERENCES [Typelist].[PolicyTransType] ([PolicyTransTypeSK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [RefPolicyTransType1038]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem993] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [RefSourceSystem993]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [RefSubline1037] FOREIGN KEY([SublineSK])
REFERENCES [Typelist].[Subline] ([SublineSK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [RefSubline1037]
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail]  WITH NOCHECK ADD  CONSTRAINT [RefWritingCompany1004] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[PolicyPremiumGeographyDetail] NOCHECK CONSTRAINT [RefWritingCompany1004]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Folloiwng the Policy Line of Business Detail, the Geography detail is the  next level of Premiums.  It contains all measures for the stated policy transaction aline of business nd its 1 or more risk  states,  Includes the premium balances along with the delta  return premiums' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'PolicyPremiumGeographyDetail'
GO
