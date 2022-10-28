USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimPolicyTermChangeType]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgADM].[SrcDimPolicyTermChangeType] @CutOffDateFrom VARCHAR(100)
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
			,ptt.PolicyTransTypeCode AS SourceCode
			,cast('1900-01-01' AS DATE) AS RowEffectiveFromDate
			,cast('3000-01-01' AS DATE) AS RowEffectiveToDate
			,0 AS GovernanceValidationInd
			,'NoStdVal' AS StandardValueCkCode
			,NULL AS StandardValueInd
			,ptt.PolicyTransTypeCode AS PolicyTermChangeTypeCode
			,ptt.PolicyTransTypeName AS PolicyTermChangeTypeName
			,ptt.PolicyTransTypeCode AS ClaimFilingTypeAbrv
			,NULL AS ClaimFilingTypeDefn
		FROM Typelist.PolicyTransType ptt
		JOIN Typelist.CoverageTrigger ctr ON ctr.SourceSystemSK = ptt.SourceSystemSK
		JOIN Typelist.SourceSystem src ON src.SourceSystemSK = ptt.SourceSystemSK
		WHERE ptt.ETLUpdateDateTime > @DateFrom
		) tmp
	) tpl
WHERE tpl.rn = 1
GO
