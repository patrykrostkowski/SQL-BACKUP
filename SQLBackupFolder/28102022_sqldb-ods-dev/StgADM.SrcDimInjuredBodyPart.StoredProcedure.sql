USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimInjuredBodyPart]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgADM].[SrcDimInjuredBodyPart] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (
			PARTITION BY SourceSystemCode
			,SourceCode ORDER BY SourceCode DESC
			) AS rn
	FROM (
		SELECT src.SourceSystemCode AS SourceSystemCode
			,bpt.BodyPartInjuryTypeCode AS SourceCode
			,cast('1900-01-01' AS DATE) AS RowEffectiveFromDate
			,cast('3000-01-01' AS DATE) AS RowEffectiveToDate
			,NULL AS GovernanceValidationInd
			,'NoStdVal' AS StandardValueCkCode
			,NULL AS StandardValueInd
			,NULL AS MedicalTaxonomyCode
			,bpt.BodyPartInjuryTypeCode AS InjuredBodyPartCode
			,bpt.BodyPartInjuryTypeName AS InjuredBodyPartName
			,bpt.BodyPartInjuryTypeCode AS InjuredBodyPartAbrv
			,NULL AS InjuredBodyPartDefn
		FROM Typelist.BodyPartInjuryType bpt
		JOIN Typelist.SourceSystem src ON src.SourceSystemSK = bpt.SourceSystemSK
		WHERE bpt.ETLUpdateDateTime > @DateFrom
		) tmp
	) tpl
GO
