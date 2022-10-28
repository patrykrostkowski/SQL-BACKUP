USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyCoverage]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE        VIEW [StgPolicy].[SrcPolicyCoverage]
AS
SELECT hdr.SourceSystemCode
	,cov.CoverageSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptr.PolicyTransSourceCode
	,lob.LineOfBusinessSourceCode
	,null AS GeographySourceCode --geo.GeographySourceCode 
	,null AS InsurableObjectSourceCode--ino.InsurableObjectSourceCode
	,lob.SubLineCode
	,cov.AnnualStatementLineofBusinessCode
	,cov.CoverageCode
	,cov.CoverageClassCode
	,cov.CoverageGroupCode
	,cov.CoverageTriggerCode
	,cov.ClassCode AS Classcode
	,cov.EffectiveDate
	,cov.ExpirationDate
	,cov.CancellationDate
	,cov.IsMajorCoverageInd
	,trc.CurrentTermBaseAmt 
	,trc.CurrentTermOriginalAmt 
	,trc.CurrentTermReportingAmt 
	,ptr.BaseCurrencyCode 
	,ptr.OriginalCurrencyCode 
	,ptr.ReportingCurrencyCode
	,trc.WrittenPremiumBaseAmt 
	,trc.WrittenPremiumOriginalAmt
	,trc.WrittenPremiumReportingAmt
	,cov.IsIncludedInPremiumInd
	,cov.IsMineSubsidenceInd
	,trc.AddlRetPremBaseAmt		
	,trc.AddlRetPremOriginalAmt 
	,trc.AddlRetPremReportingAmt
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
		,OriginalCurrencyCode NVARCHAR(max)
		,ReportingCurrencyCode NVARCHAR(max)
		,LineOfBusiness NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
		LineOfBusinessSourceCode NVARCHAR(max)
		,SubLineCode NVARCHAR(max)
		,Coverage NVARCHAR(max) AS JSON	
) lob
CROSS APPLY OPENJSON(lob.coverage) WITH (
		CoverageSourceCode NVARCHAR(max)
		,ClassCode NVARCHAR(max)
		,EffectiveDate NVARCHAR(max)
		,ExpirationDate NVARCHAR(max)
		,CancellationDate NVARCHAR(max)
		,IsMajorCoverageInd NVARCHAR(max)
		,IsIncludedInPremiumInd NVARCHAR(max)
		,IsMineSubsidenceInd NVARCHAR(max)
		,AnnualStatementLineofBusinessCode NVARCHAR(max)
		,CoverageClassCode NVARCHAR(max)
		,CoverageGroupCode NVARCHAR(max)
		,CoverageTriggerCode NVARCHAR(max)
		,CoverageCode nvarchar(max)
		,TransactionCost NVARCHAR(max) AS JSON
) cov
CROSS APPLY OPENJSON(cov.TransactionCost) WITH(
		CurrentTermBaseAmt NVARCHAR(max)
		,CurrentTermOriginalAmt NVARCHAR(max)
		,CurrentTermReportingAmt NVARCHAR(max)
		,WrittenPremiumBaseAmt NVARCHAR(max)
		,WrittenPremiumOriginalAmt NVARCHAR(max)
		,WrittenPremiumReportingAmt NVARCHAR(max)
		,AddlRetPremBaseAmt			nvarchar(MAX)
		,AddlRetPremOriginalAmt   nvarchar(MAX)
		,AddlRetPremReportingAmt   nvarchar(MAX)
) trc

UNION ALL

SELECT hdr.SourceSystemCode
	,cov.CoverageSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ptr.PolicyTransSourceCode
	,lob.LineOfBusinessSourceCode
	,geo.GeographySourceCode 
	,ino.InsurableObjectSourceCode
	,lob.SubLineCode
	,cov.AnnualStatementLineofBusinessCode
	,cov.CoverageCode
	,cov.CoverageClassCode
	,cov.CoverageGroupCode
	,cov.CoverageTriggerCode
	,cov.ClassCode 
	,cov.EffectiveDate
	,cov.ExpirationDate
	,cov.CancellationDate
	,cov.IsMajorCoverageInd
	,trc.CurrentTermBaseAmt 
	,trc.CurrentTermOriginalAmt 
	,trc.CurrentTermReportingAmt 
	,ptr.BaseCurrencyCode 
	,ptr.OriginalCurrencyCode 
	,ptr.ReportingCurrencyCode
	,trc.WrittenPremiumBaseAmt 
	,trc.WrittenPremiumOriginalAmt
	,trc.WrittenPremiumReportingAmt
	,cov.IsIncludedInPremiumInd
	,cov.IsMineSubsidenceInd
	,cov.AddlRetPremBaseAmt		
	,cov.AddlRetPremOriginalAmt 
	,cov.AddlRetPremReportingAmt
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
		,OriginalCurrencyCode NVARCHAR(max)
		,ReportingCurrencyCode NVARCHAR(max)
		,LineOfBusiness NVARCHAR(max) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
		LineOfBusinessSourceCode NVARCHAR(max)
		,SubLineCode NVARCHAR(max)
		,Geography NVARCHAR(max) AS JSON	
) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (
		GeographySourceCode NVARCHAR(max)
		,InsurableObject NVARCHAR(max) AS JSON	
) geo
CROSS APPLY OPENJSON(geo.InsurableObject) WITH (
		InsurableObjectSourceCode NVARCHAR(max)
		,Coverage NVARCHAR(max) AS JSON
) ino
CROSS APPLY OPENJSON(ino.coverage) WITH (
		CoverageSourceCode NVARCHAR(max)
		,ClassCode NVARCHAR(max)
		,EffectiveDate NVARCHAR(max)
		,ExpirationDate NVARCHAR(max)
		,CancellationDate NVARCHAR(max)
		,IsMajorCoverageInd NVARCHAR(max)
		,IsIncludedInPremiumInd NVARCHAR(max)
		,IsMineSubsidenceInd NVARCHAR(max)
		,AnnualStatementLineofBusinessCode NVARCHAR(max)
		,CoverageClassCode NVARCHAR(max)
		,CoverageGroupCode NVARCHAR(max)
		,CoverageTriggerCode NVARCHAR(max)
		,CoverageCode nvarchar(max)
		,AddlRetPremBaseAmt			nvarchar(MAX)
		,AddlRetPremOriginalAmt   nvarchar(MAX)
		,AddlRetPremReportingAmt   nvarchar(MAX)
		,TransactionCost NVARCHAR(max) AS JSON
) cov
CROSS APPLY OPENJSON(cov.TransactionCost) WITH(
		CurrentTermBaseAmt NVARCHAR(max)
		,CurrentTermOriginalAmt NVARCHAR(max)
		,CurrentTermReportingAmt NVARCHAR(max)
		,WrittenPremiumBaseAmt NVARCHAR(max)
		,WrittenPremiumOriginalAmt NVARCHAR(max)
		,WrittenPremiumReportingAmt NVARCHAR(max)
) trc

GO
