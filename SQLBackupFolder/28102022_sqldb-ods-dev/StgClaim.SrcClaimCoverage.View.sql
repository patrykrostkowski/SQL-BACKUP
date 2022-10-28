USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimCoverage]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE      VIEW [StgClaim].[SrcClaimCoverage]
AS
	
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT  
	 hdr.SourceSystemCode
	,clc.ClaimCoverageSourceCode as SourceCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,clc.CoverageSequenceNum
	,clp.ClaimPolicySourceCode--AV--claim.ClaimPolicy
	,clc.CoverageCode----Typlist.Coverage
	,clc.SubCoverageCode---Typelist.Subcoverage
	,clc.ProfitAnalysisCode--TypeList.ProfitAnalysis
	,clc.CoverageTriggerCode--Typlelst.CoverageTrigger
	,clc.CoverageClassCode-----NA---Typelist.CoverageClass
	,clc.ClaimCurrencyCode---Typelist.Currency
	,clc.PolicyCurrencyCode---Typelist.Currency
	,clc.AnnualStatementLineofBusinessCode---TypeList.AnnualStatementLineofBusiness
	,clc.TreatySharePct
	,clc.CoinsurancePct
	,clc.SharePct
	,clc.SignedLinePct
	,clc.SignedOrderPct
	,clc.WrittenLinePct
	,clc.WrittenOrderPct
	,clc.IncidentLimitAmt
	,clc.AttachmentPointAmt
	,clc.ExposureLimitAmt
	,clc.DeductibleAmt
	,clc.OccurrenceLimitAmt
	,clc.BondLimitAmt
	,clc.PartOfAmt
	,clc.LayerRetentionAmt
	,clc.NotesTxt
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
ClaimPolicy NVARCHAR(max) AS JSON
)clm
CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (
ClaimPolicySourceCode NVARCHAR(max)
,ClaimCoverage NVARCHAR(max) AS JSON
)clp
CROSS APPLY OPENJSON(clp.ClaimCoverage) WITH (
 ClaimCoverageSourceCode NVARCHAR(max)
,CoverageSequenceNum NVARCHAR(max)
,CoverageCode NVARCHAR(max)
,SubCoverageCode NVARCHAR(max)
,ProfitAnalysisCode  NVARCHAR(max)
,CoverageTriggerCode NVARCHAR(max)
,CoverageClassCode NVARCHAR(max)
,ClaimCurrencyCode NVARCHAR(max)
,PolicyCurrencyCode NVARCHAR(max)
,AnnualStatementLineofBusinessCode NVARCHAR(max)
,TreatySharePct DECIMAL
,CoinsurancePct DECIMAL
,SharePct DECIMAL
,SignedLinePct DECIMAL
,SignedOrderPct DECIMAL
,WrittenLinePct DECIMAL
,WrittenOrderPct DECIMAL
,IncidentLimitAmt DECIMAL
,AttachmentPointAmt DECIMAL
,ExposureLimitAmt DECIMAL
,DeductibleAmt DECIMAL
,OccurrenceLimitAmt DECIMAL
,BondLimitAmt DECIMAL
,PartOfAmt DECIMAL
,LayerRetentionAmt DECIMAL
,NotesTxt NVARCHAR(max)
)clc
	) AS tmp
		) AS tpl
	where tpl.rn = 1
GO
