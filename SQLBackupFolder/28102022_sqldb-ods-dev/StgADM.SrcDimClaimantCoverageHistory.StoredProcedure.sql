USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimClaimantCoverageHistory]    Script Date: 28.10.2022 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgADM].[SrcDimClaimantCoverageHistory] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT *
FROM
(
	SELECT 
		cxp.* 
		,ROW_NUMBER() OVER(PARTITION BY cxp.PolicySK, cxp.PolicyTransSK, cxp.CoverageCode ORDER BY cxp.ExposureClassCode DESC) AS rn
	FROM
	(
		SELECT 
			tps.SourceSystemCode				
			,clt.SourceCode 
			,clt.ProcessDateTime
			,TRY_CONVERT(DATETIME, '1900-01-01') as HistoricalSnapshotEffectiveFromDtm
			,TRY_CONVERT(DATETIME, '3000-01-01') as HistoricalSnapshotEffectiveToDtm
			,ccp.PolicyNum as PolicyNbr
			,ccp.TermNum as PolicyTermId
			,clt.ClaimantNum as ClaimantId
			,ISNULL(ppm.FullName, CONCAT(ppm.LastName, ', ', ppm.FirstName, ', ', ppm.MiddleName)) as ClaimantName
			,tlob.LineofBusinessCode as ClaimantCoverageCode			-- set standard value, null cause of no data from source
			,'CLMCOVG' as ClaimantCoverageLevelCode
			,clm.ClaimNum  AS ClaimId
			,tcc.CoverageClassCode as LobLongTermClaimantTypeCode		-- set standard value
			,tst.StateCode as ClaimExposureJurisdictionCode
			,'STATE' as ClaimExposureJurisdictionTypeCode
			,tet.ExposureTypeCode AS ExposureClassCode

			,tcv.CoverageCode 
			,pol.PolicySK
			,clt.ETLUpdateDateTime
			,ppt.PolicyTransSK
			--,pcv.PolicyCoverageSK
			--,ccv.ClaimCoverageSK
			--,pol.PolicyNum
			--,clm.OpenedDate
			--,ppt.ProcessDateTime
			,
			(
			SELECT 
				MAX(pt2.ProcessDateTime) as ProcessDateTime
			FROM Policy.PolicyTrans pt2 
			WHERE CAST(pt2.ProcessDateTime AS DATE)  <= clm.OpenedDate
				AND pt2.PolicySK = pol.PolicySK
			) as  ProcessDateTimeMax
			,	
			(
			SELECT 
				MIN(pt2.ProcessDateTime) as ProcessDateTime
			FROM Policy.PolicyTrans pt2 
			WHERE pt2.PolicySK = pol.PolicySK
			) as  ProcessDateTimeMin
		
		FROM Claim.Claim clm
		JOIN Claim.Claimant clt ON clt.ClaimSK = clm.ClaimSK
		JOIN Typelist.SourceSystem tps ON tps.SourceSystemSK = clm.SourceSystemSK
		JOIN Claim.ClaimPolicyAssociation cpa ON cpa.ClaimSK = clm.ClaimSK
		JOIN Claim.ClaimPolicy ccp ON ccp.ClaimPolicySK = cpa.ClaimPolicySK
		JOIN Claim.ClaimCoverage ccv ON ccv.ClaimPolicySK = ccp.ClaimPolicySK
		JOIN Typelist.Coverage tcv ON ccv.CoverageSK = tcv.CoverageSK
		JOIN Policy.Policy pol ON pol.PolicySK = cpa.PolicySK
		JOIN Policy.PolicyTrans ppt ON pol.PolicySK = ppt.PolicySK		
		JOIN Policy.PolicyCoverage pcv ON pcv.PolicyTransSK = ppt.PolicyTransSK
		JOIN Typelist.Coverage tpv ON tpv.CoverageSK = pcv.CoverageSK
		LEFT JOIN Policy.PolicyExposure ppe ON ppe.PolicyTransSK = ppt.PolicyTransSK AND ppe.PolicyCoverageSK = pcv.PolicyCoverageSK
		LEFT JOIN Typelist.ExposureType tet ON tet.ExposureTypeSK = ppe.ExposureTypeSK
		JOIN Party.PartyMaster ppm ON ppm.PartySK = clt.PartySK
		JOIN Claim.LossOccurrence clc ON clc.ClaimantSK = clt.ClaimantSK
		JOIN Policy.PolicyGeography ppg ON ppg.PolicyTransSK = ppt.PolicyTransSK
		JOIN Typelist.State tst ON tst.StateSK = ppg.StateSK
		LEFT JOIN Typelist.LineofBusiness tlob ON ccp.LineofBusinessSK = tlob.LineofBusinessSK	
		LEFT JOIN Typelist.CoverageClass tcc ON ccv.CoverageClassSK = tcc.CoverageClassSK		

		WHERE tpv.CoverageCode = tcv.CoverageCode 
		--AND pol.PolicySK = 1113

	) cxp
	JOIN Policy.PolicyTrans ptr ON ptr.PolicySK = cxp.PolicySK AND ptr.PolicyTransSK = cxp.PolicyTransSK
		AND ptr.ProcessDateTime = ISNULL(cxp.ProcessDateTimeMax, cxp.ProcessDateTimeMin)
) asd
WHERE asd.rn = 1
AND asd.ETLUpdateDateTime > @DateFrom
GO
