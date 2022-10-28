USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcDIMBridgeLossEvent]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [StgDM].[SrcDIMBridgeLossEvent] @CutOffDateFrom VARCHAR(100)
AS

DECLARE @DateFrom DATETIME = CAST(@CutOffDateFrom AS DATETIME)
		
SELECT
	tss.SourceSystemCode as SourceSystemCode
	,clc.SourceCode as SourceCode
	,'NoETL' as LossTypeCKCode	
	,clc.ProcessDateTime
	,TRY_CONVERT(DATETIME, '1900-01-01') as RowEffectiveFromDtm	
	,TRY_CONVERT(DATETIME, '3000-01-01') as RowEffectiveToDtm
	,clm.SourceCode as ClaimHistorySKCode
	,clt.SourceCode as ClaimantHistorySKCode
	,clm.ClaimNum
	,clt.ClaimantNum
	,tco.CoverageCode as ClaimCoverageSKCode
	,'PREM&CLMCOVG' as ProductCategoryLevelCode

FROM Claim.Claim clm
JOIN Typelist.SourceSystem tss on tss.SourceSystemSK = clm.SourceSystemSK
JOIN Claim.ClaimPolicyAssociation cpa on cpa.ClaimSK = clm.ClaimSK
JOIN Claim.ClaimCoverage clc on clc.ClaimPolicySK = cpa.ClaimPolicySK
JOIN Claim.Claimant clt on clt.ClaimSK = clm.ClaimSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = clc.CoverageSK 

WHERE clm.ETLUpdateDateTime > @DateFrom
GO
