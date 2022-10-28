USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyExposure]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    VIEW [StgPolicy].[SrcPolicyExposure]
AS
---POLICY---->POLICYTRANS---->LOB---->GEO--->ISO---->COVERAGE--->POLICYEXPOSURE
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pex.PolicyExposureSourceCode as SourceCode
	,ptr.PolicyTransSourceCode 
	,lob.LineOfBusinessSourceCode 
	,geo.GeographySourceCode 
	,iob.InsurableObjectSourceCode 
	,cov.CoverageSourceCode
	,ptr.BaseCurrencyCode
	,pex.ExposureTypeCode
	,pex.ExposureAmt
	,pex.ExposureDesc	
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
		,PolicyExposure NVARCHAR(max) AS JSON
		)cov
CROSS APPLY OPENJSON(cov.PolicyExposure) WITH (
		ExposureTypeCode NVARCHAR(max),
		ExposureAmt NVARCHAR(max),
		ExposureDesc NVARCHAR(max),
		PolicyExposureSourceCode NVARCHAR(max)
        ) pex


union all
---POLICY---->LOB---->POLICYEXPOSURE
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pex.PolicyExposureSourceCode as SourceCode
	,ptr.PolicyTransSourceCode 
	,lob.LineOfBusinessSourceCode 
	,null as GeographySourceCode 
	,null as InsurableObjectSourceCode 
	,null as CoverageSourceCode
	,ptr.BaseCurrencyCode
	,pex.ExposureTypeCode
	,pex.ExposureAmt
	,pex.ExposureDesc	
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
		,PolicyExposure NVARCHAR(max) AS JSON
        ) lob
CROSS APPLY OPENJSON(lob.PolicyExposure) WITH (
		ExposureTypeCode NVARCHAR(max),
		ExposureAmt NVARCHAR(max),
		ExposureDesc NVARCHAR(max),
		PolicyExposureSourceCode NVARCHAR(max)
        ) pex
union all
---POLICY---->LOB---->COVERAGE----->POLICYEXPOSURE
SELECT hdr.SourceSystemCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pex.PolicyExposureSourceCode as SourceCode
	,ptr.PolicyTransSourceCode 
	,lob.LineOfBusinessSourceCode 
	,null as GeographySourceCode 
	,null as InsurableObjectSourceCode 
	,cov.CoverageSourceCode
	,ptr.BaseCurrencyCode
	,pex.ExposureTypeCode
	,pex.ExposureAmt
	,pex.ExposureDesc	
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
		,PolicyExposure NVARCHAR(max) AS JSON
		) cov
CROSS APPLY OPENJSON(cov.PolicyExposure) WITH (
		ExposureTypeCode NVARCHAR(max),
		ExposureAmt NVARCHAR(max),
		ExposureDesc NVARCHAR(max),
		PolicyExposureSourceCode NVARCHAR(max)
        ) pex
GO
