USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyLimit]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgPolicy].[SrcPolicyLimit]
AS
select * from(
SELECT 
	hdr.SourceSystemCode	
	,pll.PolicyLimitSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pll.LimitValue
	,pll.LimitDesc
	,pll.LimitOptionName
	,plt.PolicyTransSourceCode
	,lob.LineOfBusinessSourceCode
	,grg.GeographySourceCode
	,ino.InsurableObjectSourceCode
	,cov.CoverageSourceCode
	,pll.LimitLevelCode
	,plt.BaseCurrencyCode
	,pll.LimitTypeCode
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
	,PolicyTransSourceCode  NVARCHAR(MAX)
	,BaseCurrencyCode	NVARCHAR(MAX)
	) plt
CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (
	Coverage NVARCHAR(MAX) AS JSON
	,LineOfBusinessSourceCode NVARCHAR(MAX)
	,Geography NVARCHAR(MAX) AS JSON
	) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (
	GeographySourceCode NVARCHAR(MAX)
	,InsurableObject NVARCHAR(MAX) AS JSON
	) grg
CROSS APPLY OPENJSON(grg.InsurableObject) WITH (
	InsurableObjectSourceCode NVARCHAR(MAX)
	) ino
CROSS APPLY OPENJSON(lob.Coverage) WITH (
	PolicyLimit NVARCHAR(MAX) AS JSON
	,CoverageSourceCode	 NVARCHAR(MAX)
	) cov
CROSS APPLY OPENJSON(cov.PolicyLimit) WITH (
	PolicyLimitSourceCode	NVARCHAR(MAX)
	,LimitValue	NVARCHAR(MAX)
	,LimitDesc	NVARCHAR(MAX)
	,LimitOptionName	NVARCHAR(MAX)
	,LimitTypeCode	NVARCHAR(MAX)
	,LimitLevelCode	NVARCHAR(MAX)
	) pll

UNION ALL

SELECT 
	hdr.SourceSystemCode	
	,pll.PolicyLimitSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pll.LimitValue
	,pll.LimitDesc
	,pll.LimitOptionName
	,plt.PolicyTransSourceCode
	,lob.LineOfBusinessSourceCode
	,grg.GeographySourceCode
	,ino.InsurableObjectSourceCode
	,cov.CoverageSourceCode
	,pll.LimitLevelCode
	,plt.BaseCurrencyCode
	,pll.LimitTypeCode
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
	,PolicyTransSourceCode  NVARCHAR(MAX)
	,BaseCurrencyCode	NVARCHAR(MAX)
	) plt
CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (
	Coverage NVARCHAR(MAX) AS JSON
	,LineOfBusinessSourceCode NVARCHAR(MAX)
	,Geography NVARCHAR(MAX) AS JSON
	) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (
	GeographySourceCode NVARCHAR(MAX)
	,InsurableObject NVARCHAR(MAX) AS JSON
	) grg
CROSS APPLY OPENJSON(grg.InsurableObject) WITH (
	InsurableObjectSourceCode NVARCHAR(MAX)
	,Coverage	NVARCHAR(MAX) AS JSON
	) ino
CROSS APPLY OPENJSON(ino.Coverage) WITH (
	PolicyLimit NVARCHAR(MAX) AS JSON
	,CoverageSourceCode	 NVARCHAR(MAX)
	) cov
CROSS APPLY OPENJSON(cov.PolicyLimit) WITH (
	PolicyLimitSourceCode	NVARCHAR(MAX)
	,LimitValue	NVARCHAR(MAX)
	,LimitDesc	NVARCHAR(MAX)
	,LimitOptionName	NVARCHAR(MAX)
	,LimitTypeCode	NVARCHAR(MAX)
	,LimitLevelCode	NVARCHAR(MAX)
	) pll

UNION ALL

SELECT 
	hdr.SourceSystemCode	
	,pll.PolicyLimitSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pll.LimitValue
	,pll.LimitDesc
	,pll.LimitOptionName

	,plt.PolicyTransSourceCode
	,lob.LineOfBusinessSourceCode
	,null		-- grg.GeographySourceCode
	,null		-- ino.InsurableObjectSourceCode
	,null		-- cov.CoverageSourceCode
	,pll.LimitLevelCode
	,plt.BaseCurrencyCode
	,pll.LimitTypeCode
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
	,PolicyTransSourceCode  NVARCHAR(MAX)
	,BaseCurrencyCode	NVARCHAR(MAX)
	) plt
CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (
	PolicyLimit NVARCHAR(MAX) AS JSON
	,LineOfBusinessSourceCode NVARCHAR(MAX)
	) lob
CROSS APPLY OPENJSON(lob.PolicyLimit) WITH (
	PolicyLimitSourceCode	NVARCHAR(MAX)
	,LimitValue	NVARCHAR(MAX)
	,LimitDesc	NVARCHAR(MAX)
	,LimitOptionName	NVARCHAR(MAX)
	,LimitTypeCode	NVARCHAR(MAX)
	,LimitLevelCode	NVARCHAR(MAX)
	) pll

	) tst where SourceCode = 'egu'
GO
