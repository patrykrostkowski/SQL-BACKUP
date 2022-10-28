USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimProfitCenter]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgADM].[SrcDimProfitCenter] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY SourceCode ASC 
			) AS rn
	FROM (
	SELECT src.SourceSystemCode AS SourceSystemCode
,pct.ProfitCenterCode AS SourceCode
,cast('1900-01-01' as date) AS RowEffectiveFromDate
,cast('3000-01-01' as date) AS RowEffectiveToDate      
,0 AS GovernanceValidationInd
,'NoStdVal' AS StandardValueCkCode
,NULL AS StandardValueInd
,pct.ProfitCenterCode AS ProfitCenterCode
,pct.ProfitCenterName AS ProfitCenterName 
,pct.ProfitCenterCode AS ProfitCenterAbrv
,NULL AS ProfitCenterDefn
FROM Typelist.ProfitCenter pct
JOIN Typelist.SourceSystem src ON src.SourceSystemSK = pct.SourceSystemSK
where pct.ETLUpdateDateTime > @DateFrom 
) tmp
	) tpl
	where tpl.rn = 1
GO
