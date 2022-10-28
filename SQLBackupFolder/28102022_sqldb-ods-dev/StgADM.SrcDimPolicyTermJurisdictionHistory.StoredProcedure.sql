USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimPolicyTermJurisdictionHistory]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   
	

 PROCEDURE [StgADM].[SrcDimPolicyTermJurisdictionHistory] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);

 WITH cte_PolicyTransTypeCode
 AS (
	SELECT 
		ptr.PolicySK
		,ptr.PolicyTransSK
		,ptt.PolicyTransTypeCode
		
	FROM Policy.PolicyTrans ptr
	JOIN Typelist.PolicyTransType ptt ON ptr.PolicyTransTypeSK = ptt.PolicyTransTypeSK
	WHERE ptt.PolicyTransTypeCode IN ('NewBusiness','RENEWAL')--NBIS instead of NewBusiness in mapping
 )


SELECT
 	   src.SourceSystemCode  
      ,pol.SourceCode
      ,CAST(GETDATE() AS DATETIME) AS  HistoricalSnapshotFromDtm
      ,CAST('3000-01-01' AS DATETIME) AS HistoricalSnapshotToDtm
      ,pol.PolicyNum AS PolicyNbr--,PolicyTermId,PolicyTermChangeTypeCk,PolicyTermChangeEffectiveDate,PolicyTermChangeSeq  ,PolicyTermChangeEnteredDtm                
	  ,pol.ProcessDateTime AS PolicyProcessDateTime
	  ,ptr.TermNum AS PolicyTermId
	  ,ptr.PolicyTransNum AS PolicyTermChangeId
	  ,ptr.PolicyNum AS PolicyTransPolicyNum --,PolicyTermChangeId
	  ,convert(DATETIME, ptr.PolicyEffectiveDate, 127) AS PolicyTermChangeEffectiveDate
	  ,ptr.PolicyTransVersionNum AS PolicyTermChangeSeq
	  ,convert(DATETIME, ptr.ProcessDateTime, 127) AS PolicyTermChangeEnteredDtm
	  ,ptr.ProcessDateTime AS PolicyTransProcessDateTime
	  ,cov.CoverageCode --CoverageSk
	  ,'PREM&CLMCOVG' AS ProductCategoryLevelCoverageCode
      ,sta.StateCode AS ExposureJurisdictionSKCode
	  ,CASE 
		WHEN pld.DeductibleTypeSK IS NULL
			THEN 0
		ELSE 1
		END AS CoverageDeductibleAppliesInd
	  ,CASE 
		WHEN ldt.LimitDeductibleTypeCode = 'Occ'
			THEN pld.DeductibleValue
		ELSE 0
		END AS PerOccurrenceDeductibleAmt
	  ,CASE 
		WHEN ldt.LimitDeductibleTypeCode = 'Agg'
			THEN pld.DeductibleValue
		ELSE 0
		END AS DeductibleAggregateLimitAmt
      ,'NoETL' AS LOBDeductibleRangeSKCode--,LobDeductibleRangeSk
	  ,'NoETL' AS LOBDeductibleSizeCategoryCKCode--,LobDeductibleSizeCategoryCk
      ,ccd.ClassCode AS StateExposureGoverningClassCode
	  ,ccode.ClassCode AS StatePremiumGoverningClassCode
      
      ,fat.FactorTypeCode AS PolicyIssuanceExperienceModCode
      ,rtp.EffectiveDate AS PolicyIssuanceExperienceModDate
      ,rpf.FactorValue AS PolicyIssuanceExperienceModFactorRatio
      ,fat.FactorTypeCode AS LatestExperienceModCode
      ,rtp.EffectiveDate AS LatestExperienceModDate
      ,rpf.FactorValue AS LatestExperienceModFactorRatio
	
FROM Policy.Policy pol
JOIN Typelist.SourceSystem src ON pol.SourceSystemSK = src.SourceSystemSK
JOIN Policy.PolicyTrans ptr ON pol.PolicySK = ptr.PolicySK
JOIN Policy.PolicyCoverage pcov ON ptr.PolicyTransSK = pcov.PolicyTransSK
LEFT JOIN Typelist.Coverage cov ON pcov.CoverageSK = cov.CoverageSK
LEFT JOIN Policy.PolicyGeography geo ON geo.PolicyTransSK = ptr.PolicyTransSK
LEFT JOIN Typelist.STATE sta ON geo.StateSK = sta.StateSK
JOIN cte_PolicyTransTypeCode ctepttc ON pol.PolicySK = ctepttc.PolicySK
LEFT JOIN Policy.PolicyDeductible pld ON ctepttc.PolicyTransSK = pld.PolicyTransSK
LEFT JOIN Typelist.LimitDeductibleType ldt ON ldt.LimitDeductibleTypeSK = pld.DeductibleTypeSK
LEFT JOIN (
	SELECT GovernClassByStateExposureCodeSK
		,GovernClassByStatePremiumCodeSK
		,PolicyTransSK
	FROM Policy.PolicyGeography
	) sub_geo ON sub_geo.PolicyTransSK = ptr.PolicyTransSK
LEFT JOIN Typelist.ClassCode ccd ON ccd.ClassCodeSK = sub_geo.GovernClassByStateExposureCodeSK
LEFT JOIN Typelist.ClassCode ccode ON ccode.ClassCodeSK = sub_geo.GovernClassByStatePremiumCodeSK

LEFT JOIN Policy.RatingPlan rtp ON rtp.PolicyTransSK = ctepttc.PolicyTransSK
LEFT JOIN Policy.RatingPlanFactor rpf ON rtp.RatingPlanSK = rpf.PolicyRatingPlanSK
LEFT JOIN Typelist.FactorType fat ON rpf.FactorTypeSK = fat.FactorTypeSK AND fat.FactorTypeCode = 'RateFct'

--SELECT DISTINCT
--	--,ClaimantInjurySK AUTO GENERATED
--	--,RowCreatedBySK		  Populated in ADF
--	--,RowCreatedDtm		  Populated in ADF
--	--,RowLastUpdatedBySK	  Populated in ADF
--	--,RowLastUpdatedDtm	  Populated in ADF
--	src.SourceSystemCode AS SourceSystemCode
--	-- ,ptr.SourceSystemCode AS PolicySourceSystemCode
--	,ptr.SourceCode AS SourceCode
--	,CAST('1900-01-01' AS DATETIME) AS RowEffectiveFromDatetime
--	,CAST('3000-01-01' AS DATETIME) AS RowEffectiveToDatetime
--	,ptr.PolicyNum AS PolicyNbr
--	,ptr.TermNum AS PolicyTermId
--	,ptr.PolicyTransNum AS PolicyTermChangeId
--	,ptt.PolicyTransTypeCode
--	,convert(DATETIME, ptr.PolicyEffectiveDate, 127) AS PolicyTermChangeEffectiveDate
--	,ptr.PolicyTransVersionNum AS PolicyTermChangeSeq
--	,convert(DATETIME, ptr.ProcessDateTime, 127) AS PolicyTermChangeEnteredDtm
--	,cov.CoverageCode
--	,'PREM&CLMCOVG' AS ProductCategoryLevelCoverageCode
--	,CASE 
--		WHEN pded.DeductibleTypeSK IS NULL
--			THEN 0
--		ELSE 1
--		END AS CoverageDeductibleAppliesInd
--	--,geo.GovernClassByStateExposureCodeSK AS StateExposureGoverningClassCode
--	,'NoETL' AS LOBDeductibleRangeSKCode
--	,'NoETL' AS LOBDeductibleSizeCategoryCKCode
--	,'STATE' AS ExposureJurisdictionType
--	,sta.StateCode AS ExposureJurisdictionSKCode
--	,CASE 
--		WHEN ldt.LimitDeductibleTypeCode = 'Occ'
--			THEN pded.DeductibleValue
--		ELSE 0
--		END AS PerOccurrenceDeductibleAmt
--	,CASE 
--		WHEN ldt.LimitDeductibleTypeCode = 'Agg'
--			THEN pded.DeductibleValue
--		ELSE 0
--		END AS DeductibleAggregateLimitAmt
--	,ccd.ClassCode AS StateExposureGoverningClassCode
--	,ccode.ClassCode AS StatePremiumGoverningClassCode
--FROM Policy.PolicyTrans ptr
--JOIN Typelist.SourceSystem src ON src.SourceSystemSK = ptr.SourceSystemSK
--LEFT JOIN Typelist.PolicyTransType ptt ON ptt.PolicyTransTypeSK = ptr.PolicyTransTypeSK
--LEFT JOIN Policy.PolicyCoverage pcov ON ptr.PolicyTransSK = pcov.PolicyTransSK
--LEFT JOIN Typelist.Coverage cov ON pcov.CoverageSK = cov.CoverageSK
--LEFT JOIN Policy.PolicyDeductible pded ON pded.PolicyCoverageSK = pcov.PolicyCoverageSK
--LEFT JOIN Policy.PolicyGeography geo ON geo.PolicyTransSK = ptr.PolicyTransSK
--LEFT JOIN Typelist.STATE sta ON geo.StateSK = sta.StateSK
--LEFT JOIN Typelist.LimitDeductibleType ldt ON ldt.LimitDeductibleTypeSK = pded.DeductibleTypeSK
--LEFT JOIN (
--	SELECT GovernClassByStateExposureCodeSK
--		,GovernClassByStatePremiumCodeSK
--		,PolicyTransSK
--	FROM Policy.PolicyGeography
--	) sub_geo ON sub_geo.PolicyTransSK = ptr.PolicyTransSK
--LEFT JOIN Typelist.ClassCode ccd ON ccd.ClassCodeSK = sub_geo.GovernClassByStateExposureCodeSK
--LEFT JOIN Typelist.ClassCode ccode ON ccode.ClassCodeSK = sub_geo.GovernClassByStatePremiumCodeSK
WHERE ptr.ETLUpdateDateTime > @DateFrom
GO
