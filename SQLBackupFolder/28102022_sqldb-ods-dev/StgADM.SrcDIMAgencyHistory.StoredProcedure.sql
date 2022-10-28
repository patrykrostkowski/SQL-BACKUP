USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDIMAgencyHistory]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [StgADM].[SrcDIMAgencyHistory]    @CutOffDateFrom VARCHAR(100)

AS 
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);

--WITH ProfitCentre
--AS (
--SELECT 
--       agn.AgencySK
--       ,tpc.ProfitCenterCode
--  FROM Party.Agency agn
--  JOIN Policy.Policy ppy ON ppy.AgencySK=agn.AgencySK
--  JOIN Policy.PolicyTrans ppt ON ppt.PolicySK=ppy.PolicySK
--  JOIN Policy.PolicyLineofBusiness plb ON plb.PolicyTransSK=ppt.PolicyTransSK
--  JOIN Typelist.ProfitCenter tpc ON tpc.ProfitCenterSK=plb.ProfitCenterSK
--)
--,ProducingBranch
--AS(
--SELECT  
--       agn.AgencySK, ppy.ProducingBranchNum
--     FROM Party.Agency agn
--	 JOIN Policy.Policy ppy ON ppy.AgencySK=agn.AgencySK
--)

SELECT 
	row.*
FROM (
	SELECT ROW_NUMBER() OVER (
			PARTITION BY agn.SourceCode
			
			  ORDER BY src.SourceSystemCode
				,agn.SourceCode
			) row_num    
         ,src.SourceSystemCode AS SourceSystemCode
		,agn.SourceCode AS SourceCode
        ,agn.ProcessDateTime AS HistoricalSnapshotFromDtm
		,CAST('3000-01-01 00:00:00.000' AS DATETIME) AS HistoricalSnapshotToDtm
		,0 AS GovernanceValidationInd
		,'NoStdVal' AS StandardValueSkCode
		,0 AS StandardValueInd
		,agn.AgencyNum AS AgencyCode
		,agn.OrganizationName  AS AgencyName
		,agn.AgencyNum AS AgencyAbrv
---		,null as AgencyDesc   ----Not in ODS.  Will be added by Data Stewards
		,tpc.ProfitCenterCode
		,ppy.ProducingBranchNum AS ProducingBranchCode
   
FROM Party.Agency agn
LEFT JOIN Typelist.SourceSystem src ON agn.SourceSystemSK = src.SourceSystemSK
LEFT JOIN Policy.Policy ppy ON ppy.AgencySK=agn.AgencySK
LEFT JOIN Policy.PolicyTrans ppt ON ppt.PolicySK=ppy.PolicySK
LEFT JOIN Policy.PolicyLineofBusiness plb ON plb.PolicyTransSK=ppt.PolicyTransSK
LEFT JOIN Typelist.ProfitCenter tpc ON tpc.ProfitCenterSK=plb.ProfitCenterSK
WHERE agn.ETLUpdateDateTime > @DateFrom
)row
WHERE row.row_num = 1
GO
