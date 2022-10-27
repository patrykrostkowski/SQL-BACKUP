USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimPolicyTermRatingPlanHistory]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [StgADM].[SrcDimPolicyTermRatingPlanHistory]    @CutOffDateFrom VARCHAR(100)

AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);

SELECT
	SourceSystemCode
	,SourceCode
	,ProcessDateTime
	,HistoricalSnapshotFromDtm
	,HistoricalSnapshotToDtm
	,PolicyNbr
	,PolicyTermId
	,PolicyTermChangeId
	,PolicyTermChangeTypeCkCode
	,PolicyTermChangeEffectiveDate
	,PolicyTermChangeSeq
	,PolicyTermChangeEnteredDtm
	,CoverageSkCode
	,ProductCategoryLevelCoverageCode
	,ExposureJurisdictionSkCode
	,ExposureJurisdictionTypeCode
	,RatingPlanId
	,RatingPlanEffectiveFromDtm
	,RatingPlanEffectiveToDtm
	,PolicyComponentLevelCkCode
	,RatingPlanClassCodeTypeCode
	,RatingPlanClassCodeSkCode
	,RatingPlanWrittenPremiumBaseAmt
	,tpl.rn
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime ASC
			) AS rn
	FROM (
SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'STATE' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'ISO CLASS CODE' AS RatingPlanClassCodeTypeCode
			,tcc.ClassCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.ClassCode tcc ON tcc.ClassCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom
      
UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMSUBCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'STATE' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'ISO CLASS CODE' AS RatingPlanClassCodeTypeCode
			,tcc.ClassCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.ClassCode tcc ON tcc.ClassCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom
	  
UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'PROV' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'ISO CLASS CODE' AS RatingPlanClassCodeTypeCode
			,tcc.ClassCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.ClassCode tcc ON tcc.ClassCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom

UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMSUBCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'PROV' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'ISO CLASS CODE' AS RatingPlanClassCodeTypeCode
			,tcc.ClassCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.ClassCode tcc ON tcc.ClassCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom

UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'TERR' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'ISO CLASS CODE' AS RatingPlanClassCodeTypeCode
			,tcc.ClassCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.ClassCode tcc ON tcc.ClassCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom
	  
UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMSUBCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'TERR' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'ISO CLASS CODE' AS RatingPlanClassCodeTypeCode
			,tcc.ClassCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.ClassCode tcc ON tcc.ClassCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom
	  
UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'DIST' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'ISO CLASS CODE' AS RatingPlanClassCodeTypeCode
			,tcc.ClassCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.ClassCode tcc ON tcc.ClassCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom
	  
UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMSUBCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'DIST' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'ISO CLASS CODE' AS RatingPlanClassCodeTypeCode
			,tcc.ClassCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.ClassCode tcc ON tcc.ClassCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom
	  
UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'STATE' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'STAT CODE' AS RatingPlanClassCodeTypeCode
			,tsc.StatCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.StatCode tsc ON tsc.StatCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom
      
UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMSUBCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'STATE' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'STAT CODE' AS RatingPlanClassCodeTypeCode
			,tsc.StatCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.StatCode tsc ON tsc.StatCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom
	  
UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'PROV' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'STAT CODE' AS RatingPlanClassCodeTypeCode
			,tsc.StatCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.StatCode tsc ON tsc.StatCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom

UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMSUBCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'PROV' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'STAT CODE' AS RatingPlanClassCodeTypeCode
			,tsc.StatCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.StatCode tsc ON tsc.StatCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom

UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'TERR' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'STAT CODE' AS RatingPlanClassCodeTypeCode
			,tsc.StatCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.StatCode tsc ON tsc.StatCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom
	  
UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMSUBCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'TERR' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'STAT CODE' AS RatingPlanClassCodeTypeCode
			,tsc.StatCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.StatCode tsc ON tsc.StatCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom
	  
UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'DIST' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'STAT CODE' AS RatingPlanClassCodeTypeCode
			,tsc.StatCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.StatCode tsc ON tsc.StatCodeSK = prp.ClassCodeSK

where
	 prp.ETLCreateDateTime > @DateFrom
	  
UNION ALL

SELECT 
src.SourceSystemCode AS SourceSystemCode
			,prp.SourceCode AS SourceCode
			,prp.ProcessDateTime AS ProcessDateTime
			,pts.TransStartDatetime AS HistoricalSnapshotFromDtm
			,cast('3000-01-01' as datetime) AS HistoricalSnapshotToDtm
			,pol.PolicyNum AS PolicyNbr
			,pts.TermNum AS PolicyTermId
			,pts.PolicyTransNum AS PolicyTermChangeId
			,tpt.PolicyTransTypeCode AS PolicyTermChangeTypeCkCode
			,pts.TransStartDatetime AS PolicyTermChangeEffectiveDate
			,pts.PolicyTransVersionNum AS PolicyTermChangeSeq
			,pts.RegistrationDate AS PolicyTermChangeEnteredDtm
			,tco.CoverageCode AS CoverageSkCode
			,'PREMSUBCOVG' AS ProductCategoryLevelCoverageCode
			,tst.StateCode AS ExposureJurisdictionSkCode
			,'DIST' AS ExposureJurisdictionTypeCode
			,prp.RatingPlanKeyCode AS RatingPlanId
			,prp.EffectiveDate AS RatingPlanEffectiveFromDtm
			,prp.ExpirationDate AS RatingPlanEffectiveToDtm
			,tlp.LevelTypeCode AS PolicyComponentLevelCkCode
			,'STAT CODE' AS RatingPlanClassCodeTypeCode
			,tsc.StatCode AS RatingPlanClassCodeSkCode
			,prp.RatingPlanBaseAmt AS RatingPlanWrittenPremiumBaseAmt

FROM Policy.RatingPlan prp
JOIN Typelist.SourceSystem src ON src.SourceSystemSK= prp.SourceSystemSK
JOIN Policy.Policy pol ON pol.PolicySK = prp.PolicySK
JOIN Policy.PolicyTrans pts ON pts.PolicyTransSK = prp.PolicyTransSK
JOIN Typelist.PolicyTransType tpt ON tpt.PolicyTransTypeSK = pts.PolicyTransTypeSK
JOIN Typelist.Coverage tco ON tco.CoverageSK = prp.PolicyCoverageSK
JOIN Policy.PolicyGeography pgo ON pgo.PolicyGeographySK = prp.PolicyGeographySK
JOIN Typelist.State tst ON tst.StateSK = pgo.StateSK
JOIN Typelist.LevelType tlp ON tlp.LevelTypeSK = prp.LevelTypeSK
JOIN Typelist.StatCode tsc ON tsc.StatCodeSK = prp.ClassCodeSK

WHERE
	 prp.ETLCreateDateTime > @DateFrom

	  ) tmp
	) tpl
WHERE tpl.rn = 1
GO
