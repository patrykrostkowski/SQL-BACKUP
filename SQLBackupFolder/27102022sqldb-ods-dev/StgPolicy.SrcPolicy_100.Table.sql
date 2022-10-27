﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [StgPolicy].[SrcPolicy_100]    Script Date: 27.10.2022 12:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StgPolicy].[SrcPolicy_100](
	[rn] [bigint] NULL,
	[SourceSystemCode] [nvarchar](max) NULL,
	[ProcessDateTime] [datetime] NULL,
	[SourceCode] [nvarchar](max) NULL,
	[EffectiveJobNum] [nvarchar](max) NULL,
	[AnnualStatementLineofBusinessCode] [nvarchar](max) NULL,
	[IsPremiumWaivedInd] [int] NULL,
	[PolicyTypeCode] [nvarchar](max) NULL,
	[PolicyTypeDesc] [nvarchar](max) NULL,
	[LeadExcessQuotaCode] [nvarchar](max) NULL,
	[LeadExcessQuotaDesc] [nvarchar](max) NULL,
	[IsMGAInd] [int] NULL,
	[FrontingCompanyName] [nvarchar](max) NULL,
	[BusinessUnitCode] [nvarchar](max) NULL,
	[BusinessUnitDesc] [nvarchar](max) NULL,
	[BusinessTypeCode] [nvarchar](max) NULL,
	[BusinessTypeDesc] [nvarchar](max) NULL,
	[UnderwritingStatusCode] [nvarchar](max) NULL,
	[UnderwritingStatusDesc] [nvarchar](max) NULL,
	[AttachmentTypeCode] [nvarchar](max) NULL,
	[AttachmentTypeDesc] [nvarchar](max) NULL,
	[ProjectTypeCode] [nvarchar](max) NULL,
	[ProjectTypeDesc] [nvarchar](max) NULL,
	[PolicyStatusCode] [nvarchar](max) NULL,
	[PolicyStatusDesc] [nvarchar](max) NULL,
	[GoverningStateCode] [nvarchar](max) NULL,
	[GoverningStateDesc] [nvarchar](max) NULL,
	[DomicileStateCode] [nvarchar](max) NULL,
	[DomicileStateDesc] [nvarchar](max) NULL,
	[DomicileCountryCode] [nvarchar](max) NULL,
	[DomicileCountryDesc] [nvarchar](max) NULL,
	[StandardIndustryCode] [nvarchar](max) NULL,
	[StandardIndustryCodeDesc] [nvarchar](max) NULL,
	[NorthAmericanIndustryClassificationCode] [nvarchar](max) NULL,
	[NorthAmericanIndustryClassificationDesc] [nvarchar](max) NULL,
	[ProfessionCode] [nvarchar](max) NULL,
	[ProfessionDesc] [nvarchar](max) NULL,
	[DepartmentCode] [nvarchar](max) NULL,
	[DepartmentDesc] [nvarchar](max) NULL,
	[CoverageTriggerCode] [nvarchar](max) NULL,
	[CoverageTriggerDesc] [nvarchar](max) NULL,
	[AuditTransactionCode] [nvarchar](max) NULL,
	[AuditTransactionDesc] [nvarchar](max) NULL,
	[PayPlanCode] [nvarchar](max) NULL,
	[PayPlanDesc] [nvarchar](max) NULL,
	[BillTypeCode] [nvarchar](max) NULL,
	[BillTypeDesc] [nvarchar](max) NULL,
	[UniqueMarketReferenceNum] [nvarchar](max) NULL,
	[SharePct] [decimal](20, 6) NULL,
	[IsNewYorkFreeTradeZoneInd] [int] NULL,
	[NewYorkFreeTradeZoneDesc] [nvarchar](max) NULL,
	[IsFacultativeReinsurancePurchasedInd] [int] NULL,
	[IsMultiStateInd] [int] NULL,
	[ProjectName] [nvarchar](max) NULL,
	[IsRunoffERPInd] [int] NULL,
	[RunoffERPDate] [datetime] NULL,
	[IsPremiumAuditableInd] [int] NULL,
	[DaysNoticeOfCancellationNum] [int] NULL,
	[PolicyNum] [nvarchar](max) NULL,
	[LegacyPolicyNum] [nvarchar](max) NULL,
	[TermNum] [nvarchar](max) NULL,
	[QuoteNum] [nvarchar](max) NULL,
	[QuoteVersionNum] [int] NULL,
	[AuditFrequencyCode] [nvarchar](max) NULL,
	[AuditFrequencyDesc] [nvarchar](max) NULL,
	[GovernClassCode] [nvarchar](max) NULL,
	[GovernClassCodeDescription] [nvarchar](max) NULL,
	[ProducingBranchNum] [nvarchar](max) NULL,
	[PlanGroupCode] [nvarchar](max) NULL,
	[EffectiveDate] [datetime] NULL,
	[OriginalEffectiveDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[TailDate] [datetime] NULL,
	[UnderwritingYear] [nvarchar](max) NULL,
	[IssuanceDateTime] [datetime] NULL,
	[CancellationDate] [datetime] NULL,
	[CancellationTypeCode] [nvarchar](max) NULL,
	[CancellationTypeDesc] [nvarchar](max) NULL,
	[CancellationRateCode] [nvarchar](max) NULL,
	[CancellationRateDesc] [nvarchar](max) NULL,
	[DirectAssumedCode] [nvarchar](max) NULL,
	[InsuredSourceCode] [nvarchar](max) NULL,
	[AgencySourceCode] [nvarchar](max) NULL,
	[AccountSourceCode] [nvarchar](max) NULL,
	[WritingCompanySourceCode] [nvarchar](max) NULL,
	[BaseCurrencyCode] [nvarchar](max) NULL,
	[OriginalCurrencyCode] [nvarchar](max) NULL,
	[ReportingCurrencyCode] [nvarchar](max) NULL,
	[WrittenPremiumBaseAmt] [decimal](20, 6) NULL,
	[WrittenPremiumOriginalAmt] [decimal](20, 6) NULL,
	[WrittenPremiumReportingAmt] [decimal](20, 6) NULL,
	[AnnualPremiumBaseAmt] [decimal](20, 6) NULL,
	[AnnualPremiumOriginalAmt] [decimal](20, 6) NULL,
	[AnnualPremiumReportingAmt] [decimal](20, 6) NULL,
	[TermPremiumBaseAmt] [decimal](20, 6) NULL,
	[TermPremiumOriginalAmt] [decimal](20, 6) NULL,
	[TermPremiumReportingAmt] [decimal](20, 6) NULL,
	[ManualPremBaseAmt] [decimal](20, 6) NULL,
	[ManualPremOriginalAmt] [decimal](20, 6) NULL,
	[ManualPremReportingAmt] [decimal](20, 6) NULL,
	[CommissionPct] [decimal](20, 6) NULL,
	[CommissionBaseAmt] [decimal](20, 6) NULL,
	[CommissionOriginalAmt] [decimal](20, 6) NULL,
	[CommissionReportingAmt] [decimal](20, 6) NULL,
	[ProgramSourceCode] [nvarchar](max) NULL,
	[ProductCode] [nvarchar](max) NULL,
	[IsValidInd] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
