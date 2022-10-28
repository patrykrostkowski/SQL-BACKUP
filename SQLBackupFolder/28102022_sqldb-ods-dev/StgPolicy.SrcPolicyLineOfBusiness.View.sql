USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyLineOfBusiness]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgPolicy].[SrcPolicyLineOfBusiness]
AS
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,lob.LineofBusinessSourceCode AS SourceCode
	,lob.LineofBusinessCode
	,ptr.PolicyTransSourceCode
	,ptr.BaseCurrencyCode
	,ptr.OriginalCurrencyCode
	,ptr.ReportingCurrencyCode
	,ltc.AddlRetPremBaseAmt
	,ltc.AddlRetPremOriginalAmt
	,ltc.AddlRetPremReportingAmt
	,ltc.WrittenPremiumBaseAmt
	,ltc.WrittenPremiumOriginalAmt
	,ltc.WrittenPremiumReportingAmt
	,ltc.AnnualPremiumBaseAmt
	,ltc.AnnualPremiumOriginalAmt
	,ltc.AnnualPremiumReportingAmt
	,ltc.TermPremiumBaseAmt
	,ltc.TermPremiumOriginalAmt
	,ltc.TermPremiumReportingAmt
	,ltc.ManualPremBaseAmt
	,ltc.ManualPremOriginalAmt
	,ltc.ManualPremReportingAmt
	,ltc.ModifiedPremAmt
	,ltc.ModifiedPremiumOriginalAmt
	,ltc.ModifiedPremiumReportingAmt
	,ltc.ModifiedPremiumBaseAmt
	,ltc.CommissionPct
	,ltc.CommissionBaseAmt
	,ltc.CommissionOriginalAmt
	,ltc.CommissionReportingAmt
	,ltc.OOSOffsetPremiumBaseAmt
	,ltc.OOSOffsetPremiumOriginalAmt
	,ltc.OOSOffsetPremiumReportingAmt
	,ltc.OOSFuturePremiumBaseAmt
	,ltc.OOSFuturePremiumOriginalAmt
	,ltc.OOSFuturePremiumReportingAmt
	,lob.SplitNum
	,try_convert(DATETIME, lob.SplitEffectiveDate, 127) AS SplitEffectiveDate
	,try_convert(DATETIME, lob.SplitExpirationDate, 127) AS SplitExpirationDate
	,try_convert(DATETIME, lob.RateEffectiveDate, 127) AS RateEffectiveDate
	,lob.IsSplitRateInd
	,lob.IsBillingWaivePremiumInd
	,lob.IsBillingWaivePremiumOverrideInd
	,lob.IsFacReinsuranceInd
	,lob.UnderlyingInfoDesc
	,lob.MaxCommissionPct
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(max)
		,PolicyTrans NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		PolicyTransSourceCode NVARCHAR(max)
		,LineOfBusiness NVARCHAR(max) AS JSON
		,BaseCurrencyCode NVARCHAR(max)
		,OriginalCurrencyCode NVARCHAR(max)
		,ReportingCurrencyCode NVARCHAR(max)
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
		LineOfBusinessSourceCode NVARCHAR(max)
		,LineOfBusinessCode NVARCHAR(max)
		,LineOfBusinessDesc NVARCHAR(max)
		,SubLineCode NVARCHAR(max)
		,SplitNum INT
		,SplitEffectiveDate NVARCHAR(max)
		,SplitExpirationDate NVARCHAR(max)
		,RateEffectiveDate NVARCHAR(max)
		,IsSplitRateInd INT
		,IsBillingWaivePremiumInd INT
		,IsBillingWaivePremiumOverrideInd INT
		,IsFacReinsuranceInd INT
		,UnderlyingInfoDesc NVARCHAR(max)
		,MaxCommissionPct DECIMAL(20, 6)
		,TransactionCost NVARCHAR(max) AS JSON
		) lob
OUTER APPLY OPENJSON(lob.TransactionCost) WITH (
		AddlRetPremBaseAmt DECIMAL(20, 6)
		,AddlRetPremOriginalAmt DECIMAL(20, 6)
		,AddlRetPremReportingAmt DECIMAL(20, 6)
		,WrittenPremiumBaseAmt DECIMAL(20, 6)
		,WrittenPremiumOriginalAmt DECIMAL(20, 6)
		,WrittenPremiumReportingAmt DECIMAL(20, 6)
		,AnnualPremiumBaseAmt DECIMAL(20, 6)
		,AnnualPremiumOriginalAmt DECIMAL(20, 6)
		,AnnualPremiumReportingAmt DECIMAL(20, 6)
		,TermPremiumBaseAmt DECIMAL(20, 6)
		,TermPremiumOriginalAmt DECIMAL(20, 6)
		,TermPremiumReportingAmt DECIMAL(20, 6)
		,ManualPremBaseAmt DECIMAL(20, 6)
		,ManualPremOriginalAmt DECIMAL(20, 6)
		,ManualPremReportingAmt DECIMAL(20, 6)
		,ModifiedPremAmt DECIMAL(20, 6)
		,ModifiedPremiumOriginalAmt DECIMAL(20, 6)
		,ModifiedPremiumReportingAmt DECIMAL(20, 6)
		,ModifiedPremiumBaseAmt DECIMAL(20, 6)
		,CommissionPct DECIMAL(20, 6)
		,CommissionBaseAmt DECIMAL(20, 6)
		,CommissionOriginalAmt DECIMAL(20, 6)
		,CommissionReportingAmt DECIMAL(20, 6)
		,OOSOffsetPremiumBaseAmt DECIMAL(20, 6)
		,OOSOffsetPremiumOriginalAmt DECIMAL(20, 6)
		,OOSOffsetPremiumReportingAmt DECIMAL(20, 6)
		,OOSFuturePremiumBaseAmt DECIMAL(20, 6)
		,OOSFuturePremiumOriginalAmt DECIMAL(20, 6)
		,OOSFuturePremiumReportingAmt DECIMAL(20, 6)
		) ltc
GO
