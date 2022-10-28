USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcDIMClaimantHistory]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgDM].[SrcDIMClaimantHistory] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = CAST(@CutOffDateFrom AS DATETIME)

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemSKCode,SourceCode ORDER BY SourceCode DESC) AS rn
	FROM (
		SELECT src.SourceSystemCode AS SourceSystemSKCode
			,clt.SourceCode AS SourceCode
			,GETDATE() AS HistoricalSnapshotEffectiveFromDtm
			,cast('3000-01-01' AS DATETIME) AS HistoricalSnapshotEffectiveToDtm
			,clm.ClaimNum AS ClaimNbr
			,clt.ClaimantNum AS ClaimantNbr
				,NULL AS AgeAtAccidentNbr
			,cast(NULL AS DATE) AS BirthDate
			,cast(NULL AS DATE) AS ClaimantDeathDate
				,NULL AS ClaimantTypeCK
			,clm.SourceCode AS ClaimHistorySKCode
				,NULL AS ClaimLOBCategoryCK
				,NULL AS DisabilityDeathTypeCK
				,NULL AS ExposureClassSK
			,ppm.FullName AS FullName
				,NULL AS LegalLitigationTypeCK
				,NULL AS LossTypeCK
			,cast(NULL AS VARCHAR(400)) AS OccupationDesc
				,NULL AS PrimaryClaimsExaminerSK
			,clt.ProcessDateTime
		FROM Claim.Claimant clt
		LEFT JOIN Claim.Claim clm ON clm.ClaimSK = clt.ClaimSK
		JOIN Typelist.SourceSystem src ON clm.SourceSystemSK = src.SourceSystemSK
		JOIN Party.PartyMaster ppm ON ppm.PartySK = clt.PartySK
		WHERE clt.ETLUpdateDateTime > @DateFrom

		) tpl
	) rn
WHERE rn.rn = 1
GO
