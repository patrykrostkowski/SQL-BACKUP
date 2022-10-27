USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicySubCoverage]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE         VIEW [StgPolicy].[SrcPolicySubCoverage]
AS

SELECT hdr.SourceSystemCode
		,scv.PolicySubCoverageSourceCode AS SourceCode
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,cov.CoverageSourceCode
		,scv.SubCoverageCode
		,ptr.BaseCurrencyCode 
		,ptr.OriginalCurrencyCode 
		,ptr.ReportingCurrencyCode
		,scv.WrittenPremiumBaseAmt
		,scv.WrittenPremiumOriginalAmt
		,scv.WrittenPremiumReportingAmt
		,scv.AddlRetPremBaseAmt  
		,scv.AddlRetPremOriginalAmt 
		,scv.AddlRetPremReportingAmt
		,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		Policy NVARCHAR(MAX) AS JSON
		,SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		BaseCurrencyCode NVARCHAR(max)
		,OriginalCurrencyCode NVARCHAR(max)
		,ReportingCurrencyCode NVARCHAR(max)
		,LineOfBusiness NVARCHAR(MAX) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) lob
CROSS APPLY OPENJSON(lob.Coverage) WITH (
		CoverageSourceCode NVARCHAR(MAX)
		,SubCoverage NVARCHAR(MAX) AS JSON
		) cov
CROSS APPLY OPENJSON(cov.SubCoverage) WITH (
		SubCoverageCode NVARCHAR(MAX)
		,PolicySubCoverageSourceCode NVARCHAR(MAX)
		,WrittenPremiumBaseAmt NVARCHAR(MAX)
		,WrittenPremiumOriginalAmt NVARCHAR(MAX)
		,WrittenPremiumReportingAmt NVARCHAR(MAX)
		,AddlRetPremBaseAmt  NVARCHAR(MAX)
		,AddlRetPremOriginalAmt   NVARCHAR(MAX)
		,AddlRetPremReportingAmt   NVARCHAR(MAX)

		) scv


UNION ALL

SELECT hdr.SourceSystemCode
		,scv.PolicySubCoverageSourceCode AS SourceCode
		,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
		,cov.CoverageSourceCode
		,scv.SubCoverageCode
		,ptr.BaseCurrencyCode 
		,ptr.OriginalCurrencyCode 
		,ptr.ReportingCurrencyCode
		,scv.WrittenPremiumBaseAmt
		,scv.WrittenPremiumOriginalAmt
		,scv.WrittenPremiumReportingAmt
		,scv.AddlRetPremBaseAmt  
		,scv.AddlRetPremOriginalAmt 
		,scv.AddlRetPremReportingAmt
		,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		Policy NVARCHAR(MAX) AS JSON
		,SourceSystemCode NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		BaseCurrencyCode NVARCHAR(max)
		,OriginalCurrencyCode NVARCHAR(max)
		,ReportingCurrencyCode NVARCHAR(max)
		,LineOfBusiness NVARCHAR(MAX) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) geo
CROSS APPLY OPENJSON(geo.InsurableObject) WITH (Coverage NVARCHAR(MAX) AS JSON) ino
CROSS APPLY OPENJSON(ino.Coverage) WITH (
		CoverageSourceCode NVARCHAR(MAX)
		,SubCoverage NVARCHAR(MAX) AS JSON
		) cov
CROSS APPLY OPENJSON(cov.SubCoverage) WITH (
		SubCoverageCode NVARCHAR(MAX)
		,PolicySubCoverageSourceCode NVARCHAR(MAX)
		,WrittenPremiumBaseAmt NVARCHAR(MAX)
		,WrittenPremiumOriginalAmt NVARCHAR(MAX)
		,WrittenPremiumReportingAmt NVARCHAR(MAX)
		,AddlRetPremBaseAmt  NVARCHAR(MAX)
		,AddlRetPremOriginalAmt   NVARCHAR(MAX)
		,AddlRetPremReportingAmt   NVARCHAR(MAX)
		) scv
GO
