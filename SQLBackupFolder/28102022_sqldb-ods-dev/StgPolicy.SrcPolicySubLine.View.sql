USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicySubLine]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgPolicy].[SrcPolicySubLine]
AS
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,sbl.ProductSubLineSourceCode AS SourceCode
	,lob.LineOfBusinessSourceCode AS PolicyLineOfBusinessSourceCode
	,sbl.SublineCode
	,ptr.BaseCurrencyCode
	,ptr.OriginalCurrencyCode
	,ptr.ReportingCurrencyCode
	,stc.WrittenPremiumBaseAmt
	,stc.WrittenPremiumOriginalAmt
	,stc.WrittenPremiumReportingAmt
	,stc.AddlRetPremiumBaseAmt
	,stc.AddlRetPremiumOriginalAmt
	,stc.AddlRetPremiumReportingAmt
	,stc.AnnualPremiumBaseAmt
	,stc.AnnualPremiumOriginaAmt
	,stc.AnnualPremiumReportingAmt
	,stc.TermPremiumBaseAmt
	,stc.TermPremiumOriginalAmt
	,stc.TermPremiumReportingAmt
	,stc.ManualPremiumBaseAmt
	,stc.ManualPremiumOriginalAmt
	,stc.ManualPremiumReportingAmt
	,stc.CommissionPct
	,stc.CommissionBaseAmt
	,stc.CommissionOriginalAmt
	,stc.CommissionReportingAmt
	,stc.OOSOffsetPremiumBaseAmt
	,stc.OOSOffsetPremiumOriginalAmt
	,stc.OOSOffsetPremiumReportingAmt
	,stc.OOSFuturePremiumBaseAmt
	,stc.OOSFuturePremiumOriginalAmt
	,stc.OOSFuturePremiumReportingAmt
	,stc.ModifiedPremiumBaseAmt
	,stc.ModifiedPremiumOriginalAmt
	,stc.ModifiedPremiumReportingAmt
	,sbl.IsPremiumWaivedInd
	,sbl.SplitNum
	,try_convert(DATETIME, sbl.SplitEffectiveDate, 127) AS SplitEffectiveDate
	,try_convert(DATETIME, sbl.SplitExpirationDate, 127) AS SplitExpirationDate
	,try_convert(DATETIME, sbl.RateEffectiveDate, 127) AS RateEffectiveDate
	,sbl.IsSplitRateInd
	,sbl.IsBillingWaivePremiumInd
	,sbl.IsBillingWaivePremiumOverrideInd
	,sbl.IsFacReinsuranceInd
	,sbl.UnderlyingInfoDesc
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
		,ProductSubLine NVARCHAR(max) AS JSON
		) lob
CROSS APPLY OPENJSON(lob.ProductSubLine) WITH (
		ProductSubLineSourceCode NVARCHAR(max)
		,SublineCode NVARCHAR(max)
		,IsPremiumWaivedInd	int
		,SplitNum	int
		,SplitEffectiveDate	NVARCHAR(max)
		,SplitExpirationDate	NVARCHAR(max)
		,RateEffectiveDate	NVARCHAR(max)
		,IsSplitRateInd	int
		,IsBillingWaivePremiumInd	int
		,IsBillingWaivePremiumOverrideInd	int
		,IsFacReinsuranceInd	int
		,UnderlyingInfoDesc	NVARCHAR(max)
		,TransactionCost NVARCHAR(max) AS JSON
		) sbl
OUTER APPLY OPENJSON(sbl.TransactionCost) WITH (
		WrittenPremiumBaseAmt	decimal(20, 6)
		,WrittenPremiumOriginalAmt	decimal(20, 6)
		,WrittenPremiumReportingAmt	decimal(20, 6)
		,AddlRetPremiumBaseAmt	decimal(20, 6)
		,AddlRetPremiumOriginalAmt	decimal(20, 6)
		,AddlRetPremiumReportingAmt	decimal(20, 6)
		,AnnualPremiumBaseAmt	decimal(20, 6)
		,AnnualPremiumOriginaAmt	decimal(20, 6)
		,AnnualPremiumReportingAmt	decimal(20, 6)
		,TermPremiumBaseAmt	decimal(20, 6)
		,TermPremiumOriginalAmt	decimal(20, 6)
		,TermPremiumReportingAmt	decimal(20, 6)
		,ManualPremiumBaseAmt	decimal(20, 6)
		,ManualPremiumOriginalAmt	decimal(20, 6)
		,ManualPremiumReportingAmt	decimal(20, 6)
		,CommissionPct	decimal(20, 6)
		,CommissionBaseAmt	decimal(20, 6)
		,CommissionOriginalAmt	decimal(20, 6)
		,CommissionReportingAmt	decimal(20, 6)
		,OOSOffsetPremiumBaseAmt	decimal(20, 6)
		,OOSOffsetPremiumOriginalAmt	decimal(20, 6)
		,OOSOffsetPremiumReportingAmt	decimal(20, 6)
		,OOSFuturePremiumBaseAmt	decimal(20, 6)
		,OOSFuturePremiumOriginalAmt	decimal(20, 6)
		,OOSFuturePremiumReportingAmt	decimal(20, 6)
		,ModifiedPremiumBaseAmt	decimal(20, 6)
		,ModifiedPremiumOriginalAmt	decimal(20, 6)
		,ModifiedPremiumReportingAmt	decimal(20, 6)
		) stc
GO
