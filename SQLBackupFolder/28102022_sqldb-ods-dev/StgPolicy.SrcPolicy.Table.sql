﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [StgPolicy].[SrcPolicy]    Script Date: 28.10.2022 12:27:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StgPolicy].[SrcPolicy](
	[rn] [bigint] NULL,
	[SourceSystemCode] [nvarchar](255) NULL,
	[ProcessDateTime] [datetime] NULL,
	[SourceCode] [nvarchar](255) NULL,
	[EffectiveJobNum] [nvarchar](255) NULL,
	[AnnualStatementLineofBusinessCode] [nvarchar](255) NULL,
	[IsPremiumWaivedInd] [int] NULL,
	[PolicyTypeCode] [nvarchar](255) NULL,
	[PolicyTypeDesc] [nvarchar](255) NULL,
	[LeadExcessQuotaCode] [nvarchar](255) NULL,
	[LeadExcessQuotaDesc] [nvarchar](255) NULL,
	[IsMGAInd] [int] NULL,
	[FrontingCompanyName] [nvarchar](255) NULL,
	[BusinessUnitCode] [nvarchar](255) NULL,
	[BusinessUnitDesc] [nvarchar](255) NULL,
	[BusinessTypeCode] [nvarchar](255) NULL,
	[BusinessTypeDesc] [nvarchar](255) NULL,
	[UnderwritingStatusCode] [nvarchar](255) NULL,
	[UnderwritingStatusDesc] [nvarchar](255) NULL,
	[AttachmentTypeCode] [nvarchar](255) NULL,
	[AttachmentTypeDesc] [nvarchar](255) NULL,
	[ProjectTypeCode] [nvarchar](255) NULL,
	[ProjectTypeDesc] [nvarchar](255) NULL,
	[PolicyStatusCode] [nvarchar](255) NULL,
	[PolicyStatusDesc] [nvarchar](255) NULL,
	[GoverningStateCode] [nvarchar](255) NULL,
	[GoverningStateDesc] [nvarchar](255) NULL,
	[DomicileStateCode] [nvarchar](255) NULL,
	[DomicileStateDesc] [nvarchar](255) NULL,
	[DomicileCountryCode] [nvarchar](255) NULL,
	[DomicileCountryDesc] [nvarchar](255) NULL,
	[StandardIndustryCode] [nvarchar](255) NULL,
	[StandardIndustryCodeDesc] [nvarchar](255) NULL,
	[NorthAmericanIndustryClassificationCode] [nvarchar](255) NULL,
	[NorthAmericanIndustryClassificationDesc] [nvarchar](255) NULL,
	[ProfessionCode] [nvarchar](255) NULL,
	[ProfessionDesc] [nvarchar](255) NULL,
	[DepartmentCode] [nvarchar](255) NULL,
	[DepartmentDesc] [nvarchar](255) NULL,
	[CoverageTriggerCode] [nvarchar](255) NULL,
	[CoverageTriggerDesc] [nvarchar](255) NULL,
	[AuditTransactionCode] [nvarchar](255) NULL,
	[AuditTransactionDesc] [nvarchar](255) NULL,
	[PayPlanCode] [nvarchar](255) NULL,
	[PayPlanDesc] [nvarchar](255) NULL,
	[BillTypeCode] [nvarchar](255) NULL,
	[BillTypeDesc] [nvarchar](255) NULL,
	[UniqueMarketReferenceNum] [nvarchar](255) NULL,
	[SharePct] [decimal](20, 6) NULL,
	[IsNewYorkFreeTradeZoneInd] [int] NULL,
	[NewYorkFreeTradeZoneDesc] [nvarchar](255) NULL,
	[IsFacultativeReinsurancePurchasedInd] [int] NULL,
	[IsMultiStateInd] [int] NULL,
	[ProjectName] [nvarchar](255) NULL,
	[IsRunoffERPInd] [int] NULL,
	[RunoffERPDate] [datetime] NULL,
	[IsPremiumAuditableInd] [int] NULL,
	[DaysNoticeOfCancellationNum] [int] NULL,
	[PolicyNum] [nvarchar](255) NULL,
	[LegacyPolicyNum] [nvarchar](255) NULL,
	[TermNum] [nvarchar](255) NULL,
	[QuoteNum] [nvarchar](255) NULL,
	[QuoteVersionNum] [int] NULL,
	[AuditFrequencyCode] [nvarchar](255) NULL,
	[AuditFrequencyDesc] [nvarchar](255) NULL,
	[GovernClassCode] [nvarchar](255) NULL,
	[GovernClassCodeDescription] [nvarchar](255) NULL,
	[ProducingBranchNum] [nvarchar](255) NULL,
	[PlanGroupCode] [nvarchar](255) NULL,
	[EffectiveDate] [datetime] NULL,
	[OriginalEffectiveDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[TailDate] [datetime] NULL,
	[UnderwritingYear] [nvarchar](255) NULL,
	[IssuanceDateTime] [datetime] NULL,
	[CancellationDate] [datetime] NULL,
	[CancellationTypeCode] [nvarchar](255) NULL,
	[CancellationTypeDesc] [nvarchar](255) NULL,
	[CancellationRateCode] [nvarchar](255) NULL,
	[CancellationRateDesc] [nvarchar](255) NULL,
	[DirectAssumedCode] [nvarchar](255) NULL,
	[InsuredSourceCode] [nvarchar](255) NULL,
	[AgencySourceCode] [nvarchar](255) NULL,
	[AccountSourceCode] [nvarchar](255) NULL,
	[WritingCompanySourceCode] [nvarchar](255) NULL,
	[BaseCurrencyCode] [nvarchar](255) NULL,
	[OriginalCurrencyCode] [nvarchar](255) NULL,
	[ReportingCurrencyCode] [nvarchar](255) NULL,
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
	[ProgramSourceCode] [nvarchar](255) NULL,
	[ProductCode] [nvarchar](255) NULL,
	[IsRetroPolicyInd] [int] NULL,
	[FileName] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL,
	[IsValidInd] [tinyint] NULL
) ON [PRIMARY]
GO
