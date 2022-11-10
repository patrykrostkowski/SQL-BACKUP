USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[Policy]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[Policy]') AND type in (N'U'))
BEGIN
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
	[TermNum] [int] NULL,
	[DirectAssumedSK] [int] NOT NULL,
	[QuoteNum] [varchar](100) NULL,
	[QuoteVersionNum] [int] NULL,
	[EffectiveDate] [date] NULL,
	[OriginalEffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[TailDate] [date] NULL,
	[UnderwritingYear] [varchar](4) NULL,
	[IssuanceDateTime] [datetime] NOT NULL,
	[CancellationDate] [date] NULL,
	[CancellationTypeSK] [int] NULL,
	[CancellationRateSK] [int] NULL,
	[AgencySK] [int] NOT NULL,
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
	[ProfessionSK] [int] NULL,
	[DepartmentSK] [int] NULL,
	[CoverageTriggerSK] [int] NULL,
	[AuditTransactionSK] [int] NULL,
	[PayPlanSK] [int] NULL,
	[BillTypeSK] [int] NULL,
	[UniqueMarketReferenceNum] [varchar](40) NULL,
	[SharePct] [decimal](8, 2) NULL,
	[IsNewYorkFreeTradeZoneInd] [tinyint] NULL,
	[NewYorkFreeTradeZoneDesc] [varchar](30) NULL,
	[IsFacultativeReinsurancePurchasedInd] [tinyint] NULL,
	[IsMultiStateInd] [tinyint] NULL,
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AccountSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_AccountSK_Policy] FOREIGN KEY([AccountSK])
REFERENCES [Party].[Account] ([AccountSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AccountSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_AccountSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AgencySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_AgencySK_Policy] FOREIGN KEY([AgencySK])
REFERENCES [Party].[Agency] ([AgencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AgencySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_AgencySK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AttachmentTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_AttachmentTypeSK_Policy] FOREIGN KEY([AttachmentTypeSK])
REFERENCES [TypeList].[AttachmentType] ([AttachmentTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AttachmentTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_AttachmentTypeSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AuditTransactionSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_AuditTransactionSK_Policy] FOREIGN KEY([AuditTransactionSK])
REFERENCES [TypeList].[AuditTransaction] ([AuditTransactionSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AuditTransactionSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_AuditTransactionSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_Policy] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_BaseCurrencySK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BillTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_BillTypeSK_Policy] FOREIGN KEY([BillTypeSK])
REFERENCES [TypeList].[BillType] ([BillTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BillTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_BillTypeSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BusinessTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_BusinessTypeSK_Policy] FOREIGN KEY([BusinessTypeSK])
REFERENCES [TypeList].[BusinessType] ([BusinessTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BusinessTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_BusinessTypeSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BusinessUnitSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_BusinessUnitSK_Policy] FOREIGN KEY([BusinessUnitSK])
REFERENCES [TypeList].[BusinessUnit] ([BusinessUnitSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BusinessUnitSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_BusinessUnitSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CancellationRateSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_CancellationRateSK_Policy] FOREIGN KEY([CancellationRateSK])
REFERENCES [TypeList].[CancellationRate] ([CancellationRateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CancellationRateSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_CancellationRateSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CancellationTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_CancellationTypeSK_Policy] FOREIGN KEY([CancellationTypeSK])
REFERENCES [TypeList].[CancellationType] ([CancellationTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CancellationTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_CancellationTypeSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CoverageTriggerSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_Policy] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [TypeList].[CoverageTrigger] ([CoverageTriggerSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CoverageTriggerSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_CoverageTriggerSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DepartmentSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentSK_Policy] FOREIGN KEY([DepartmentSK])
REFERENCES [TypeList].[Department] ([DepartmentSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DepartmentSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_DepartmentSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DomicileCountrySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_DomicileCountrySK_Policy] FOREIGN KEY([DomicileCountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DomicileCountrySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_DomicileCountrySK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DomicileStateSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_DomicileStateSK_Policy] FOREIGN KEY([DomicileStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DomicileStateSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_DomicileStateSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_GoverningStateSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_GoverningStateSK_Policy] FOREIGN KEY([GoverningStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_GoverningStateSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_GoverningStateSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_InsuredSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_InsuredSK_Policy] FOREIGN KEY([InsuredSK])
REFERENCES [Party].[Insured] ([InsuredSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_InsuredSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_InsuredSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_LeadExcessQuotaSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_LeadExcessQuotaSK_Policy] FOREIGN KEY([LeadExcessQuotaSK])
REFERENCES [TypeList].[LeadExcessQuota] ([LeadExcessQuotaSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_LeadExcessQuotaSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_LeadExcessQuotaSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_NorthAmericanIndustryClassificationSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Policy] FOREIGN KEY([NorthAmericanIndustryClassificationSK])
REFERENCES [TypeList].[NorthAmericanIndustryClassification] ([NorthAmericanIndustryClassificationSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_NorthAmericanIndustryClassificationSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_NorthAmericanIndustryClassificationSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_Policy] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_OriginalCurrencySK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PayPlanSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_PayPlanSK_Policy] FOREIGN KEY([PayPlanSK])
REFERENCES [TypeList].[PayPlan] ([PayPlanSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PayPlanSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_PayPlanSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyStatusSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_PolicyStatusSK_Policy] FOREIGN KEY([PolicyStatusSK])
REFERENCES [TypeList].[PolicyStatus] ([PolicyStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyStatusSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_PolicyStatusSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTypeSK_Policy] FOREIGN KEY([PolicyTypeSK])
REFERENCES [TypeList].[PolicyType] ([PolicyTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_PolicyTypeSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ProductSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_ProductSK_Policy] FOREIGN KEY([ProductSK])
REFERENCES [TypeList].[Product] ([ProductSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ProductSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_ProductSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ProfessionSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionSK_Policy] FOREIGN KEY([ProfessionSK])
REFERENCES [TypeList].[Profession] ([ProfessionSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ProfessionSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_ProfessionSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ProgramSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSK_Policy] FOREIGN KEY([ProgramSK])
REFERENCES [Policy].[Program] ([ProgramSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ProgramSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_ProgramSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ProjectTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeSK_Policy] FOREIGN KEY([ProjectTypeSK])
REFERENCES [TypeList].[ProjectType] ([ProjectTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ProjectTypeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_ProjectTypeSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_Policy] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_ReportingCurrencySK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Policy] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_SourceSystemSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_StandardIndustryCodeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_StandardIndustryCodeSK_Policy] FOREIGN KEY([StandardIndustryCodeSK])
REFERENCES [TypeList].[StandardIndustryCode] ([StandardIndustryCodeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_StandardIndustryCodeSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_StandardIndustryCodeSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_UnderwritingStatusSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_UnderwritingStatusSK_Policy] FOREIGN KEY([UnderwritingStatusSK])
REFERENCES [TypeList].[UnderwritingStatus] ([UnderwritingStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_UnderwritingStatusSK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_UnderwritingStatusSK_Policy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_WritingCompanySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_Policy] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_WritingCompanySK_Policy]') AND parent_object_id = OBJECT_ID(N'[Policy].[Policy]'))
ALTER TABLE [Policy].[Policy] CHECK CONSTRAINT [FK_WritingCompanySK_Policy]
GO
