USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyCoverageFee]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE     VIEW [StgPolicy].[SrcPolicyCoverageFee]
AS

SELECT 
	hdr.SourceSystemCode	
	,plf.PolicyFeeSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,plt.PolicyTransSourceCode	
	,cov.CoverageSourceCode	
	,plf.CoverageFeeBaseAmt
	,plf.CoverageFeeOriginalAmt
	,plf.CoverageFeeReportingAmt
	,plf.CoverageFeeTypeCode	
	,plt.BaseCurrencyCode	
	,plt.OriginalCurrencyCode	
	,plt.ReportingCurrencyCode	
	,plf.FeeChargeTypeCode	
	,plf.FeeEffectiveDate
	,plf.FeeExpirationDate
	,plf.IsIncludedInPremiumInd						
	,plf.IsSurchargeInd
	,lob.LineOfBusinessSourceCode
	,plf.IsFullyEarnedInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	PolicyTrans NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
	LineOfBusiness NVARCHAR(MAX) AS JSON
	,PolicyTransSourceCode NVARCHAR(MAX)
	,BaseCurrencyCode NVARCHAR(MAX)
	,OriginalCurrencyCode NVARCHAR(MAX)
	,ReportingCurrencyCode NVARCHAR(MAX)
	) plt
CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (
	Coverage NVARCHAR(MAX) AS JSON
	,LineOfBusinessSourceCode NVARCHAR(MAX)
	) lob
CROSS APPLY OPENJSON(lob.Coverage) WITH (PolicyFee NVARCHAR(MAX) AS JSON, CoverageSourceCode NVARCHAR(MAX)) cov
CROSS APPLY OPENJSON(cov.PolicyFee) WITH (
	CoverageFeeBaseAmt			DECIMAL(19,4)
	,CoverageFeeOriginalAmt		DECIMAL(19,4)
	,CoverageFeeReportingAmt	DECIMAL(19,4)
	,CoverageFeeTypeCode		NVARCHAR(MAX)
	,FeeChargeTypeCode			NVARCHAR(MAX)
	,FeeEffectiveDate			NVARCHAR(MAX)
	,FeeExpirationDate			NVARCHAR(MAX)
	,IsIncludedInPremiumInd		TINYINT
	,IsSurchargeInd				TINYINT
	,PolicyFeeSourceCode		NVARCHAR(MAX)
	,IsFullyEarnedInd TINYINT
	) plf

UNION ALL

SELECT 
	hdr.SourceSystemCode	
	,plf.PolicyFeeSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,plt.PolicyTransSourceCode
	,cov.CoverageSourceCode	 
	,plf.CoverageFeeBaseAmt
	,plf.CoverageFeeOriginalAmt
	,plf.CoverageFeeReportingAmt
	,plf.CoverageFeeTypeCode	
	,plt.BaseCurrencyCode	
	,plt.OriginalCurrencyCode	
	,plt.ReportingCurrencyCode	
	,plf.FeeChargeTypeCode	
	,plf.FeeEffectiveDate
	,plf.FeeExpirationDate
	,plf.IsIncludedInPremiumInd						
	,plf.IsSurchargeInd
	,lob.LineOfBusinessSourceCode
	,plf.IsFullyEarnedInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	PolicyTrans NVARCHAR(MAX) AS JSON
	,ReportingCurrencyCode NVARCHAR(MAX)
	) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
	LineOfBusiness NVARCHAR(MAX) AS JSON
	,PolicyTransSourceCode NVARCHAR(MAX)
	,BaseCurrencyCode NVARCHAR(MAX)
	,OriginalCurrencyCode NVARCHAR(MAX)
	,ReportingCurrencyCode NVARCHAR(MAX)
	) plt
CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (
	Geography NVARCHAR(MAX) AS JSON
	,LineOfBusinessSourceCode NVARCHAR(MAX)
	) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Coverage NVARCHAR(MAX) AS JSON) ino
CROSS APPLY OPENJSON(ino.Coverage) WITH (PolicyFee NVARCHAR(MAX) AS JSON, CoverageSourceCode NVARCHAR(MAX)) cov
CROSS APPLY OPENJSON(cov.PolicyFee) WITH (
	CoverageFeeBaseAmt			DECIMAL(19,4)
	,CoverageFeeOriginalAmt		DECIMAL(19,4)
	,CoverageFeeReportingAmt	DECIMAL(19,4)
	,CoverageFeeTypeCode		NVARCHAR(MAX)
	,FeeChargeTypeCode			NVARCHAR(MAX)
	,FeeEffectiveDate			NVARCHAR(MAX)
	,FeeExpirationDate			NVARCHAR(MAX)
	,IsIncludedInPremiumInd		TINYINT
	,IsSurchargeInd				TINYINT
	,PolicyFeeSourceCode		NVARCHAR(MAX)
	,IsFullyEarnedInd TINYINT
	) plf

UNION ALL

SELECT 
	hdr.SourceSystemCode	
	,plf.PolicyFeeSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,plt.PolicyTransSourceCode	
	,null 		AS PolicyCoverageSK --cov.CoverageSourceCode
	,plf.CoverageFeeBaseAmt
	,plf.CoverageFeeOriginalAmt
	,plf.CoverageFeeReportingAmt
	,plf.CoverageFeeTypeCode	
	,plt.BaseCurrencyCode	
	,plt.OriginalCurrencyCode	
	,plt.ReportingCurrencyCode	
	,plf.FeeChargeTypeCode	
	,plf.FeeEffectiveDate
	,plf.FeeExpirationDate
	,plf.IsIncludedInPremiumInd						
	,plf.IsSurchargeInd
	,cov.LineOfBusinessSourceCode
	,plf.IsFullyEarnedInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line	
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	PolicyTrans NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
	LineOfBusiness NVARCHAR(MAX) AS JSON
	,PolicyTransSourceCode NVARCHAR(MAX)
	,BaseCurrencyCode NVARCHAR(MAX)
	,OriginalCurrencyCode NVARCHAR(MAX)
	,ReportingCurrencyCode NVARCHAR(MAX)
	) plt
CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (
	PolicyFee NVARCHAR(MAX) AS JSON
	,LineOfBusinessSourceCode NVARCHAR(MAX)
	) cov
CROSS APPLY OPENJSON(cov.PolicyFee) WITH (
	CoverageFeeBaseAmt			DECIMAL(19,4)
	,CoverageFeeOriginalAmt		DECIMAL(19,4)
	,CoverageFeeReportingAmt	DECIMAL(19,4)
	,CoverageFeeTypeCode		NVARCHAR(MAX)
	,FeeChargeTypeCode			NVARCHAR(MAX)
	,FeeEffectiveDate			NVARCHAR(MAX)
	,FeeExpirationDate			NVARCHAR(MAX)
	,IsIncludedInPremiumInd		TINYINT
	,IsSurchargeInd				TINYINT
	,PolicyFeeSourceCode		NVARCHAR(MAX)
	,IsFullyEarnedInd TINYINT
	) plf
GO
