USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimProducingBranch]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgADM].[SrcDimProducingBranch] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime ASC 
			) AS rn
	FROM (
	SELECT src.SourceSystemCode AS SourceSystemCode
,pbr.BranchNum AS SourceCode
,pbr.ProcessDateTime
,cast('1900-01-01' as date) AS RowEffectiveFromDate
,cast('3000-01-01' as date) AS RowEffectiveToDate      
,0 AS GovernanceValidationInd
,'NoStdVal' AS StandardValueCkCode
,NULL AS StandardValueInd
,pbr.BranchNum AS ProducingBranchCode
,pbr.OrganizationName AS ProducingBranchName 
,pbr.BranchNum AS ProducingBranchAbrv
,NULL AS ProducingBranchDefn
FROM Party.Broker pbr
JOIN Typelist.SourceSystem src ON src.SourceSystemSK = pbr.SourceSystemSK
where pbr.ETLUpdateDateTime > @DateFrom 
) tmp
	) tpl
	where tpl.rn = 1
GO
