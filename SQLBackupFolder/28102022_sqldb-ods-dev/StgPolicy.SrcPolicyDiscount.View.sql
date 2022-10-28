USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyDiscount]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgPolicy].[SrcPolicyDiscount]
AS
SELECT hdr.SourceSystemCode
	,pod.PolicyDiscountSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptr.PolicyTransSourceCode
	,lob.LineOfBusinessSourceCode
	,null AS GeographySourceCode --geo.GeographySourceCode 
	,null AS InsurableObjectSourceCode--ino.InsurableObjectSourceCode
	,cov.CoverageSourceCode
	,pod.DiscountLevelCode
	,pod.DiscountTypeCode
	,ptr.BaseCurrencyCode 
	,ptr.OriginalCurrencyCode 
	,ptr.ReportingCurrencyCode
	,pod.PolicyDiscountBaseAmt
	,pod.PolicyDiscountOriginalAmt
	,pod.PolicyDiscountReportingAmt
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicyTrans NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		PolicyTransSourceCode NVARCHAR(max)
		,BaseCurrencyCode NVARCHAR(max)
		,OriginalCurrencyCode NVARCHAR(max)
		,ReportingCurrencyCode NVARCHAR(max)
		,LineOfBusiness NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
		LineOfBusinessSourceCode NVARCHAR(max)
		,Coverage NVARCHAR(max) AS JSON	
) lob
CROSS APPLY OPENJSON(lob.coverage) WITH (
		CoverageSourceCode NVARCHAR(max)
		,PolicyDiscount NVARCHAR(max) AS JSON
		
) cov
CROSS APPLY OPENJSON(cov.PolicyDiscount) WITH (
		PolicyDiscountSourceCode NVARCHAR(max)
		,DiscountLevelCode NVARCHAR(max)
		,DiscountTypeCode NVARCHAR(max)
		,PolicyDiscountBaseAmt NVARCHAR(max)
		,PolicyDiscountOriginalAmt NVARCHAR(max)
		,PolicyDiscountReportingAmt NVARCHAR(max)
		
) pod

UNION ALL

SELECT hdr.SourceSystemCode
	,pod.PolicyDiscountSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptr.PolicyTransSourceCode
	,lob.LineOfBusinessSourceCode
	,geo.GeographySourceCode 
	,ino.InsurableObjectSourceCode
	,cov.CoverageSourceCode
	,pod.DiscountLevelCode
	,pod.DiscountTypeCode
	,ptr.BaseCurrencyCode 
	,ptr.OriginalCurrencyCode 
	,ptr.ReportingCurrencyCode
	,pod.PolicyDiscountBaseAmt
	,pod.PolicyDiscountOriginalAmt
	,pod.PolicyDiscountReportingAmt
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicyTrans NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		PolicyTransSourceCode NVARCHAR(max)
		,BaseCurrencyCode NVARCHAR(max)
		,OriginalCurrencyCode NVARCHAR(max)
		,ReportingCurrencyCode NVARCHAR(max)
		,LineOfBusiness NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
		LineOfBusinessSourceCode NVARCHAR(max)
		,Geography NVARCHAR(max) AS JSON	
) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (
		GeographySourceCode NVARCHAR(max)
		,InsurableObject NVARCHAR(max) AS JSON
) geo
CROSS APPLY OPENJSON(geo.InsurableObject) WITH (
		InsurableObjectSourceCode NVARCHAR(max)
		,Coverage NVARCHAR(max) AS JSON
)ino
CROSS APPLY OPENJSON(ino.coverage) WITH (
		CoverageSourceCode NVARCHAR(max)
		,PolicyDiscount NVARCHAR(max) AS JSON
		
) cov
CROSS APPLY OPENJSON(cov.PolicyDiscount) WITH (
		PolicyDiscountSourceCode NVARCHAR(max)
		,DiscountLevelCode NVARCHAR(max)
		,DiscountTypeCode NVARCHAR(max)
		,PolicyDiscountBaseAmt NVARCHAR(max)
		,PolicyDiscountOriginalAmt NVARCHAR(max)
		,PolicyDiscountReportingAmt NVARCHAR(max)
		
) pod

UNION ALL

SELECT hdr.SourceSystemCode
	,pod.PolicyDiscountSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptr.PolicyTransSourceCode
	,lob.LineOfBusinessSourceCode
	,null --geo.GeographySourceCode 
	,null --ino.InsurableObjectSourceCode
	,null --cov.CoverageSourceCode
	,pod.DiscountLevelCode
	,pod.DiscountTypeCode
	,ptr.BaseCurrencyCode 
	,ptr.OriginalCurrencyCode 
	,ptr.ReportingCurrencyCode
	,pod.PolicyDiscountBaseAmt
	,pod.PolicyDiscountOriginalAmt
	,pod.PolicyDiscountReportingAmt
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicyTrans NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		PolicyTransSourceCode NVARCHAR(max)
		,BaseCurrencyCode NVARCHAR(max)
		,OriginalCurrencyCode NVARCHAR(max)
		,ReportingCurrencyCode NVARCHAR(max)
		,LineOfBusiness NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
		LineOfBusinessSourceCode NVARCHAR(max)
		,PolicyDiscount NVARCHAR(max) AS JSON	
) lob
CROSS APPLY OPENJSON(lob.PolicyDiscount) WITH (
		PolicyDiscountSourceCode NVARCHAR(max)
		,DiscountLevelCode NVARCHAR(max)
		,DiscountTypeCode NVARCHAR(max)
		,PolicyDiscountBaseAmt NVARCHAR(max)
		,PolicyDiscountOriginalAmt NVARCHAR(max)
		,PolicyDiscountReportingAmt NVARCHAR(max)
		
) pod
GO
