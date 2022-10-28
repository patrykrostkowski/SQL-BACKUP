USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[Policy]    Script Date: 28.10.2022 15:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[Policy](
	[PolicySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[EffectiveJobNum] [varchar](20) NOT NULL,
	[AccountSK] [int] NOT NULL,
	[InsuredSK] [int] NOT NULL,
	[PolicyNum] [varchar](100) NOT NULL,
	[LegacyPolicyNum] [varchar](60) NULL,
	[TermNum] [varchar](10) NULL,
	[DirectAssumedSK] [int] NOT NULL,
	[QuoteNum] [varchar](100) NULL,
	[QuoteVersionNum] [int] NULL,
	[EffectiveDate] [date] NULL,
	[OriginalEffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[TailDate] [date] NULL,
	[UnderwritingYear] [varchar](4) NULL,
	[IssuanceDateTime] [datetime] NOT NULL,
	[AuditFrequencyCode] [varchar](25) NULL,
	[AuditFrequencyDesc] [varchar](50) NULL,
	[GovernClassCodeSK] [int] NULL,
	[GovernClassCode] [varchar](25) NULL,
	[CancellationDate] [date] NULL,
	[CancellationTypeSK] [int] NULL,
	[CancellationRateSK] [int] NULL,
	[AgencySK] [int] NOT NULL,
	[ProducingBranchNum] [varchar](20) NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[WrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[WrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[WrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[AnnualPremiumBaseAmt] [decimal](19, 4) NULL,
	[AnnualPremiumOriginalAmt] [decimal](19, 4) NULL,
	[AnnualPremiumReportingAmt] [decimal](19, 4) NULL,
	[TermPremiumBaseAmt] [decimal](19, 4) NULL,
	[TermPremiumOriginalAmt] [decimal](19, 4) NULL,
	[TermPremiumReportingAmt] [decimal](19, 4) NULL,
	[ManualPremBaseAmt] [decimal](19, 4) NULL,
	[ManualPremOriginalAmt] [decimal](19, 4) NULL,
	[ManualPremReportingAmt] [decimal](19, 4) NULL,
	[IsPremiumWaivedInd] [tinyint] NULL,
	[CommissionPct] [decimal](8, 2) NULL,
	[CommissionBaseAmt] [decimal](19, 4) NULL,
	[CommissionOriginalAmt] [decimal](19, 4) NULL,
	[CommissionReportingAmt] [decimal](19, 4) NULL,
	[PolicyTypeSK] [int] NOT NULL,
	[LeadExcessQuotaSK] [int] NULL,
	[ProductSK] [int] NULL,
	[ProgramSK] [int] NULL,
	[WritingCompanySK] [int] NOT NULL,
	[BusinessUnitSK] [int] NOT NULL,
	[BusinessTypeSK] [int] NULL,
	[UnderwritingStatusSK] [int] NULL,
	[AttachmentTypeSK] [int] NULL,
	[ProjectTypeSK] [int] NULL,
	[PolicyStatusSK] [int] NULL,
	[GoverningStateSK] [int] NULL,
	[DomicileStateSK] [int] NULL,
	[DomicileCountrySK] [int] NOT NULL,
	[StandardIndustryCodeSK] [int] NULL,
	[NorthAmericanIndustryClassificationSK] [int] NULL,
	[AnnualStatementLineofBusinessSK] [int] NULL,
	[ProfessionSK] [int] NULL,
	[DepartmentSK] [int] NULL,
	[CoverageTriggerSK] [int] NULL,
	[AuditTransactionSK] [int] NULL,
	[PayPlanSK] [int] NULL,
	[PlanGroupCode] [varchar](25) NULL,
	[BillTypeSK] [int] NULL,
	[UniqueMarketReferenceNum] [varchar](40) NULL,
	[SharePct] [decimal](8, 2) NULL,
	[IsNewYorkFreeTradeZoneInd] [tinyint] NULL,
	[NewYorkFreeTradeZoneDesc] [varchar](30) NULL,
	[IsFacultativeReinsurancePurchasedInd] [tinyint] NULL,
	[IsMultiStateInd] [tinyint] NULL,
	[IsRetroPolicyInd] [tinyint] NULL,
	[ProjectName] [varchar](255) NULL,
	[IsRunoffERPInd] [tinyint] NULL,
	[RunoffERPDate] [date] NULL,
	[IsPremiumAuditableInd] [tinyint] NULL,
	[DaysNoticeOfCancellationNum] [int] NULL,
 CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED 
(
	[PolicySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Policy]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Policy] ON [Policy].[Policy]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_AccountSK_Policy] FOREIGN KEY([AccountSK])
REFERENCES [Party].[Account] ([AccountSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_AccountSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_AgencySK_Policy] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_AgencySK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_AnnualStatementLineofBusinessSK_Policy] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [Typelist].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_AnnualStatementLineofBusinessSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_AttachmentTypeSK_Policy] FOREIGN KEY([AttachmentTypeSK])
REFERENCES [Typelist].[AttachmentType] ([AttachmentTypeSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_AttachmentTypeSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_AuditTransactionSK_Policy] FOREIGN KEY([AuditTransactionSK])
REFERENCES [Typelist].[AuditTransaction] ([AuditTransactionSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_AuditTransactionSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_Policy] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_BaseCurrencySK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_BillTypeSK_Policy] FOREIGN KEY([BillTypeSK])
REFERENCES [Typelist].[BillType] ([BillTypeSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_BillTypeSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_BusinessTypeSK_Policy] FOREIGN KEY([BusinessTypeSK])
REFERENCES [Typelist].[BusinessType] ([BusinessTypeSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_BusinessTypeSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_BusinessUnitSK_Policy] FOREIGN KEY([BusinessUnitSK])
REFERENCES [Typelist].[BusinessUnit] ([BusinessUnitSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_BusinessUnitSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_CancellationRateSK_Policy] FOREIGN KEY([CancellationRateSK])
REFERENCES [Typelist].[CancellationRate] ([CancellationRateSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_CancellationRateSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_CancellationTypeSK_Policy] FOREIGN KEY([CancellationTypeSK])
REFERENCES [Typelist].[CancellationType] ([CancellationTypeSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_CancellationTypeSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_ClassCodeSK_Policy] FOREIGN KEY([GovernClassCodeSK])
REFERENCES [Typelist].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_ClassCodeSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_Policy] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [Typelist].[CoverageTrigger] ([CoverageTriggerSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_CoverageTriggerSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_DepartmentSK_Policy] FOREIGN KEY([DepartmentSK])
REFERENCES [Typelist].[Department] ([DepartmentSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_DepartmentSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_DomicileCountrySK_Policy] FOREIGN KEY([DomicileCountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_DomicileCountrySK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_DomicileStateSK_Policy] FOREIGN KEY([DomicileStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_DomicileStateSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_GoverningStateSK_Policy] FOREIGN KEY([GoverningStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_GoverningStateSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_InsuredSK_Policy] FOREIGN KEY([InsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_InsuredSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_LeadExcessQuotaSK_Policy] FOREIGN KEY([LeadExcessQuotaSK])
REFERENCES [Typelist].[LeadExcessQuota] ([LeadExcessQuotaSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_LeadExcessQuotaSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Policy] FOREIGN KEY([NorthAmericanIndustryClassificationSK])
REFERENCES [Typelist].[NorthAmericanIndustryClassification] ([NorthAmericanIndustryClassificationSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_Policy] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_PayPlanSK_Policy] FOREIGN KEY([PayPlanSK])
REFERENCES [Typelist].[PayPlan] ([PayPlanSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_PayPlanSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyStatusSK_Policy] FOREIGN KEY([PolicyStatusSK])
REFERENCES [Typelist].[PolicyStatus] ([PolicyStatusSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_PolicyStatusSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTypeSK_Policy] FOREIGN KEY([PolicyTypeSK])
REFERENCES [Typelist].[PolicyType] ([PolicyTypeSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_PolicyTypeSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductSK_Policy] FOREIGN KEY([ProductSK])
REFERENCES [Typelist].[Product] ([ProductSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_ProductSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_ProfessionSK_Policy] FOREIGN KEY([ProfessionSK])
REFERENCES [Typelist].[Profession] ([ProfessionSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_ProfessionSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_ProgramSK_Policy] FOREIGN KEY([ProgramSK])
REFERENCES [Policy].[Program] ([ProgramSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_ProgramSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_ProjectTypeSK_Policy] FOREIGN KEY([ProjectTypeSK])
REFERENCES [Typelist].[ProjectType] ([ProjectTypeSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_ProjectTypeSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_Policy] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Policy] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_SourceSystemSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_StandardIndustryCodeSK_Policy] FOREIGN KEY([StandardIndustryCodeSK])
REFERENCES [Typelist].[StandardIndustryCode] ([StandardIndustryCodeSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_StandardIndustryCodeSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_UnderwritingStatusSK_Policy] FOREIGN KEY([UnderwritingStatusSK])
REFERENCES [Typelist].[UnderwritingStatus] ([UnderwritingStatusSK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_UnderwritingStatusSK_Policy]
GO
ALTER TABLE [Policy].[Policy]  WITH NOCHECK ADD  CONSTRAINT [FK_WritingCompanySK_Policy] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Policy].[Policy] NOCHECK CONSTRAINT [FK_WritingCompanySK_Policy]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A contract / agreement between an insured and writing company each committing themselves to fulfill one or more obligations as outlined in a policy declaration.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'Policy'
GO
