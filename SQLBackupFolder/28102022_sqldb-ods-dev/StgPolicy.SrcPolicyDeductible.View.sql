USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyDeductible]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgPolicy].[SrcPolicyDeductible]
AS
---POLICY---->POLICYTRANS---->LOB---->GEO--->ISO---->COVERAGE--->POLICYDEDUCTIBLE
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pod.PolicyDeductibleSourceCode as SourceCode
	,ptr.PolicyTransSourceCode 
	,lob.LineOfBusinessSourceCode 
	,geo.GeographySourceCode 
	,iob.InsurableObjectSourceCode 
	,cov.CoverageSourceCode
	,pod.DeductibleLevelCode
	,pod.DeductibleTypeCode
	,ptr.BaseCurrencyCode
	,pod.DeductibleValue
	,pod.DeductibleDesc
	,pod.DeductibleOptionName
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
		,BaseCurrencyCode NVARCHAR(max)
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
CROSS APPLY OPENJSON(geo.InsurableObject) WITH(
		InsurableObjectSourceCode NVARCHAR(max)
		,Coverage NVARCHAR(max) AS JSON
		)iob
CROSS APPLY OPENJSON(iob.Coverage) WITH(
		CoverageSourceCode NVARCHAR(max)
		,PolicyDeductible NVARCHAR(max) AS JSON
		)cov
CROSS APPLY OPENJSON(cov.PolicyDeductible) WITH (
		DeductibleLevelCode NVARCHAR(max),
		PolicyDeductibleSourceCode NVARCHAR(max),
        DeductibleValue NVARCHAR(max),
		DeductibleDesc NVARCHAR(max),
		DeductibleOptionName NVARCHAR(max),
		DeductibleTypeCode NVARCHAR(max)
        ) pod


union all
---POLICY---->LOB---->POLICYDEDUCTIBLE
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pod.PolicyDeductibleSourceCode as SourceCode
	,ptr.PolicyTransSourceCode
	,lob.LineOfBusinessSourceCode
	,null as GeographySourceCode
	,null as InsurableObjectSourceCode
	,null as CoverageSourceCode
	,pod.DeductibleLevelCode
	,pod.DeductibleTypeCode
	,ptr.BaseCurrencyCode
	,pod.DeductibleValue
	,pod.DeductibleDesc
	,pod.DeductibleOptionName
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
		,BaseCurrencyCode NVARCHAR(max)
		,LineOfBusiness NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
        LineOfBusinessSourceCode NVARCHAR(max)
		,PolicyDeductible NVARCHAR(max) AS JSON
        ) lob
CROSS APPLY OPENJSON(lob.PolicyDeductible) WITH (
		DeductibleLevelCode NVARCHAR(max),
		PolicyDeductibleSourceCode NVARCHAR(max),
        DeductibleValue NVARCHAR(max),
		DeductibleDesc NVARCHAR(max),
		DeductibleOptionName NVARCHAR(max),
		DeductibleTypeCode NVARCHAR(max)
        ) pod
union all
---POLICY---->LOB---->COVERAGE----->POLICYDEDUCTIBLE
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pod.PolicyDeductibleSourceCode as SourceCode
	,ptr.PolicyTransSourceCode 
	,lob.LineOfBusinessSourceCode 
	,null as GeographySourceCode
	,null as InsurableObjectSourceCode 
	,cov.CoverageSourceCode
	,pod.DeductibleLevelCode
	,pod.DeductibleTypeCode
	,ptr.BaseCurrencyCode
	,pod.DeductibleValue
	,pod.DeductibleDesc
	,pod.DeductibleOptionName
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
		,BaseCurrencyCode NVARCHAR(max)
		,LineOfBusiness NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
        LineOfBusinessSourceCode NVARCHAR(max)
		,Geography NVARCHAR(max) AS JSON
		,Coverage NVARCHAR(max) AS JSON
        ) lob
CROSS APPLY OPENJSON(lob.Coverage) WITH(
		CoverageSourceCode NVARCHAR(max)
		,PolicyDeductible NVARCHAR(max) AS JSON
		) cov
CROSS APPLY OPENJSON(cov.PolicyDeductible) WITH (
		DeductibleLevelCode NVARCHAR(max),
		PolicyDeductibleSourceCode NVARCHAR(max),
        DeductibleValue NVARCHAR(max),
		DeductibleDesc NVARCHAR(max),
		DeductibleOptionName NVARCHAR(max),
		DeductibleTypeCode NVARCHAR(max)
        ) pod
GO
