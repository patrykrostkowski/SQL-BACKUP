USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimClaimLifeCycleStatus]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgADM].[SrcDimClaimLifeCycleStatus] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode,ClaimLifeCycleStatusCode ORDER BY ClaimLifeCycleStatusName ASC) AS rn
	FROM (
		SELECT
			--ClaimLifeCycleStatusCk  
			--RowCreatedBySk          
			--RowCreatedDtm           
			--RowLastUpdatedBySk      
			--RowLastUpdatedDtm       
			tss.SourceSystemCode
			,tcs.ClaimStatusCode AS SourceCode
			,TRY_CAST('1900-01-01 00:00:00.000' AS DATETIME) AS RowEffectiveFromDate
			,TRY_CAST('3000-01-01 00:00:00.000' AS DATETIME) AS RowEffectiveToDate
			,0 AS GovernanceValidationInd
			,'NoStdVal' AS StandardValueCkCode
			,0 AS StandardValueInd
			,tcs.ClaimStatusCode AS ClaimLifeCycleStatusCode
			,tcs.ClaimStatusName AS ClaimLifeCycleStatusName
			,tcs.ClaimStatusCode AS ClaimLifeCycleStatusAbrv
			,NULL AS ClaimLifeCycleStatusDefn
		FROM Typelist.ClaimStatus tcs
		JOIN Typelist.SourceSystem tss ON tcs.SourceSystemSK = tss.SourceSystemSK
		WHERE tcs.ETLUpdateDateTime > @DateFrom
		) tmp
	) tpl
WHERE rn = 1
GO
