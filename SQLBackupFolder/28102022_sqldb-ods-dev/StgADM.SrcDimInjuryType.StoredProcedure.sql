USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimInjuryType]    Script Date: 28.10.2022 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgADM].[SrcDimInjuryType] @CutOffDateFrom VARCHAR(100)
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
			,tip.InjuryTypeCode AS SourceCode
			,cast('1900-01-01' AS DATE) AS RowEffectiveFromDate
			,cast('3000-01-01' AS DATE) AS RowEffectiveToDate
			,0 AS GovernanceValidationInd
			,'NoStdVal' AS StandardValueCkCode
			,0 AS StandardValueInd
			,NULL AS MedicalTaxonomyCode
			,tip.InjuryTypeCode AS InjuryTypeCode
			,tip.InjuryTypeName AS InjuryTypeName
			,NULL AS InjuryTypeAbrv
			,NULL AS InjuryTypeDefn
		FROM Typelist.InjuryType tip
		JOIN Typelist.SourceSystem src ON src.SourceSystemSK = tip.SourceSystemSK
		WHERE tip.ETLUpdateDateTime > @DateFrom
		) tmp
	) tpl
GO
