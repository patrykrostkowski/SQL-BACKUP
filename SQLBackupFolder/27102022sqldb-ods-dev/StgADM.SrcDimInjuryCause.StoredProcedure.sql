USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimInjuryCause]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgADM].[SrcDimInjuryCause] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (
			PARTITION BY SourceSystemCode
			,SourceCode ORDER BY SourceCode ASC
			) AS rn
	FROM (
		SELECT src.SourceSystemCode AS SourceSystemCode
			,ict.InjuryCauseTypeCode AS SourceCode
			,cast('1900-01-01' AS DATE) AS RowEffectiveFromDate
			,cast('3000-01-01' AS DATE) AS RowEffectiveToDate
			,NULL AS GovernanceValidationInd
			,'NoStdVal' AS StandardValueCkCode
			,NULL AS StandardValueInd
			,NULL AS MedicalTaxonomyCode
			,ict.InjuryCauseTypeCode AS InjuryCauseCode
			,ict.InjuryCauseTypeName AS InjuryCauseName
			,ict.InjuryCauseTypeCode AS InjuryCauseAbrv
			,NULL AS InjuryCauseDefn
		FROM Typelist.InjuryCauseType ict
		JOIN Typelist.SourceSystem src ON src.SourceSystemSK = ict.SourceSystemSK
		WHERE ict.ETLUpdateDateTime > @DateFrom
		) tmp
	) tpl
WHERE tpl.rn = 1
GO
