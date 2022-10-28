USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimPolicy]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE       VIEW [StgClaim].[SrcClaimPolicy]
AS
	
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT  
	hdr.SourceSystemCode
	,clp.ClaimPolicySourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,clp.PolicyNum
	,clp.PolicyStatusCode 
	,clp.PolicyTypeCode 
	,clp.ProductCode 
	,clp.CoverageTriggerCode 

	--,wrc.WritingCompanySourceCode -----Removed

	,clp.PolicyCurrencyCode
	,clp.EffectiveDate
	,clp.ExpirationDate
	,clp.OriginalEffectiveDate
	,clp.CancellationDate
	,clp.ReportingDate
	,clp.RetroactiveDate
	,clp.AccountNum
	,clp.UnderwritingYear
	,clp.NotesInfo
	,clp.TreatyCoverageSharePct
	,clp.AnnualAggregateDeductibleAmt
	,clp.LayerRetentionAmt
	,clp.MinimumPremiumAmt
	,clp.OccurrenceLimitAmt
	,clp.NumOfReinstatements
	,clp.TotalVehicleCount
	,clp.TotalPropertyCount
	,clp.LineofBusinessCode
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(max)
	,ProcessDateTime NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	ClaimPolicy NVARCHAR(max)  AS JSON
	) clm
CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (
	ClaimPolicySourceCode NVARCHAR(MAX)	 
	,PolicyNum NVARCHAR(MAX)
	,EffectiveDate date
	,ExpirationDate date
	,OriginalEffectiveDate date
	,CancellationDate date
	,ReportingDate date
	,RetroactiveDate date
	,AccountNum NVARCHAR(MAX)
	,UnderwritingYear int
	,NotesInfo NVARCHAR(MAX)
	,TreatyCoverageSharePct DECIMAL		
	,AnnualAggregateDeductibleAmt DECIMAL	
	,ClaimCoverage NVARCHAR(max) AS JSON
	,LayerRetentionAmt DECIMAL
	,MinimumPremiumAmt DECIMAL
	,OccurrenceLimitAmt DECIMAL
	,NumOfReinstatements NVARCHAR(MAX)
	,TotalVehicleCount int
	,TotalPropertyCount int
	,PolicyStatusCode NVARCHAR(MAX)
	,PolicyTypeCode NVARCHAR(MAX)
	,ProductCode NVARCHAR(MAX)
	,CoverageTriggerCode NVARCHAR(MAX)
	--,WritingCompanySourceCode NVARCHAR(MAX)		
	,PolicyCurrencyCode NVARCHAR(MAX)
	,LineofBusinessCode NVARCHAR(MAX)
	,WritingCompany NVARCHAR(MAX) AS JSON
	) clp

CROSS APPLY OPENJSON(clp.WritingCompany) WITH (
	WritingCompanySourceCode NVARCHAR(MAX)
	) wrc

	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
