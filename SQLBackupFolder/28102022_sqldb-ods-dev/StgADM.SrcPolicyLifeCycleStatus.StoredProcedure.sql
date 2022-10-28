USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcPolicyLifeCycleStatus]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [StgADM].[SrcPolicyLifeCycleStatus] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = CAST(@CutOffDateFrom AS DATETIME)
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode,SourceCode ORDER BY SourceCode ASC) AS rn
	FROM (SELECT  
             --PolicyLifeCycleStatusCK AUTO GENERATED
			 --RowCreatedBySK		  Populated in ADF
			--,RowCreatedDtm		  Populated in ADF
			--,RowLastUpdatedBySK	  Populated in ADF
			--,RowLastUpdatedDtm	  Populated in ADF
             src.SourceSystemCode AS SourceSystemCode
			,tps.PolicyStatusCode AS SourceCode
			,CAST('1900-01-01' AS DATETIME) AS RowEffectiveFromDatetime
			,CAST('3000-01-01' AS DATETIME) AS RowEffectiveToDatetime
			,tps.PolicyStatusCode AS PolicyLifeCycleStatusCode
			,tps.PolicyStatusName AS PolicyLifeCycleStatusName
			,tps.PolicyStatusCode AS PolicyLifeCycleStatusAbrv
---			,PolicyLifeCycleStatusDefn--Not in ODS.  Will be added by Data Stewards
            ,0 AS GovernanceValidationInd
			,'NoStdVal'   AS StandardValueCkCode
			,0 AS StandardValueInd

FROM Typelist.PolicyStatus tps
JOIN Typelist.SourceSystem src ON src.SourceSystemSK=tps.SourceSystemSK
where tps.ETLUpdateDateTime > @DateFrom
 ) tmp
 )tp1
 WHERE tp1.rn=1
GO
