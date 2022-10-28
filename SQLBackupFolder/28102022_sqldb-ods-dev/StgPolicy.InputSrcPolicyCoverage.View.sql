USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[InputSrcPolicyCoverage]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   VIEW [StgPolicy].[InputSrcPolicyCoverage]
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
	,line.FileName
	,line.FilePath
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(255)
		,ProcessDateTime NVARCHAR(255)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(255)
		,PolicyTrans NVARCHAR(MAX) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		PolicyTransSourceCode NVARCHAR(255)
		,BaseCurrencyCode NVARCHAR(255)
		,OriginalCurrencyCode NVARCHAR(255)
		,ReportingCurrencyCode NVARCHAR(255)
		,LineOfBusiness NVARCHAR(MAX) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
		LineOfBusinessSourceCode NVARCHAR(255)
		,SubLineCode NVARCHAR(255)
		,Coverage NVARCHAR(MAX) AS JSON	
) lob
CROSS APPLY OPENJSON(lob.coverage) WITH (
		CoverageSourceCode NVARCHAR(255)
		,ClassCode NVARCHAR(255)
		,EffectiveDate NVARCHAR(255)
		,ExpirationDate NVARCHAR(255)
		,CancellationDate NVARCHAR(255)
		,IsMajorCoverageInd INT
		,IsIncludedInPremiumInd INT
		,IsMineSubsidenceInd INT
		,AnnualStatementLineofBusinessCode NVARCHAR(255)
		,CoverageClassCode NVARCHAR(255)
		,CoverageGroupCode NVARCHAR(255)
		,CoverageTriggerCode NVARCHAR(255)
		,CoverageCode NVARCHAR(255)
		,TransactionCost NVARCHAR(MAX) AS JSON
) cov
OUTER APPLY OPENJSON(cov.TransactionCost) WITH(
		CurrentTermBaseAmt NVARCHAR(255)
		,CurrentTermOriginalAmt NVARCHAR(255)
		,CurrentTermReportingAmt NVARCHAR(255)
		,WrittenPremiumBaseAmt NVARCHAR(255)
		,WrittenPremiumOriginalAmt NVARCHAR(255)
		,WrittenPremiumReportingAmt NVARCHAR(255)
		,AddlRetPremBaseAmt			NVARCHAR(255)
		,AddlRetPremOriginalAmt   NVARCHAR(255)
		,AddlRetPremReportingAmt   NVARCHAR(255)
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
	,line.FileName
	,line.FilePath
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(255)
		,ProcessDateTime NVARCHAR(255)
		,Policy NVARCHAR(MAX) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		PolicySourceCode NVARCHAR(255)
		,PolicyTrans NVARCHAR(MAX) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
		PolicyTransSourceCode NVARCHAR(255)
		,BaseCurrencyCode NVARCHAR(255)
		,OriginalCurrencyCode NVARCHAR(255)
		,ReportingCurrencyCode NVARCHAR(255)
		,LineOfBusiness NVARCHAR(MAX) AS JSON
		) ptr
CROSS APPLY OPENJSON(ptr.LineOfBusiness) WITH (
		LineOfBusinessSourceCode NVARCHAR(255)
		,SubLineCode NVARCHAR(255)
		,Geography NVARCHAR(MAX) AS JSON	
) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (
		GeographySourceCode NVARCHAR(255)
		,InsurableObject NVARCHAR(MAX) AS JSON	
) geo
CROSS APPLY OPENJSON(geo.InsurableObject) WITH (
		InsurableObjectSourceCode NVARCHAR(255)
		,Coverage NVARCHAR(MAX) AS JSON
) ino
CROSS APPLY OPENJSON(ino.coverage) WITH (
		CoverageSourceCode NVARCHAR(255)
		,ClassCode NVARCHAR(255)
		,EffectiveDate NVARCHAR(255)
		,ExpirationDate NVARCHAR(255)
		,CancellationDate NVARCHAR(255)
		,IsMajorCoverageInd INT
		,IsIncludedInPremiumInd INT
		,IsMineSubsidenceInd INT
		,AnnualStatementLineofBusinessCode NVARCHAR(255)
		,CoverageClassCode NVARCHAR(255)
		,CoverageGroupCode NVARCHAR(255)
		,CoverageTriggerCode NVARCHAR(255)
		,CoverageCode NVARCHAR(255)
		,AddlRetPremBaseAmt			NVARCHAR(255)
		,AddlRetPremOriginalAmt   NVARCHAR(255)
		,AddlRetPremReportingAmt   NVARCHAR(255)
		,TransactionCost NVARCHAR(MAX) AS JSON
) cov
OUTER APPLY OPENJSON(cov.TransactionCost) WITH(
		CurrentTermBaseAmt NVARCHAR(255)
		,CurrentTermOriginalAmt NVARCHAR(255)
		,CurrentTermReportingAmt NVARCHAR(255)
		,WrittenPremiumBaseAmt NVARCHAR(255)
		,WrittenPremiumOriginalAmt NVARCHAR(255)
		,WrittenPremiumReportingAmt NVARCHAR(255)
) trc

GO
