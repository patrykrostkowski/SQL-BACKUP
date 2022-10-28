USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimClaimClaimantHistoryBridge]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [StgADM].[SrcDimClaimClaimantHistoryBridge] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT 
	src.SourceSystemCode AS SourceSystemCode --for SourceSystemSK
	,clm.SourceCode --needed to get RowEffectiveFromDtm and RowEffectiveToDtm and ClaimHistorySK
	,clt.SourceCode AS ClaimantSoureCode --needed to find CoverageHistorySk
FROM Claim.Claim clm
JOIN Typelist.SourceSystem src ON clm.SourceSystemSK = src.SourceSystemSK
JOIN Claim.Claimant clt ON clt.ClaimSK = clm.ClaimSK
JOIN Claim.ClaimPolicyAssociation cpa ON clt.ClaimSK = cpa.ClaimSK
JOIN Claim.ClaimPolicy clp ON cpa.ClaimPolicySK = clp.ClaimPolicySK
JOIN Claim.ClaimCoverage clc ON cpa.ClaimPolicySK = clc.ClaimPolicySK

WHERE clm.ETLUpdateDateTime > @DateFrom
GO
