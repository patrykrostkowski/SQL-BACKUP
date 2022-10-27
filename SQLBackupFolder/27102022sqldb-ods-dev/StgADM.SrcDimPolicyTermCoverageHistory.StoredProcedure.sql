USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimPolicyTermCoverageHistory]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext [StgADM.SrcDimPolicyTermCoverageHistory] 
  
  --EXEC [StgADM].[SrcDimPolicyTermCoverageHistory]  '1900-01-01'
  
  
CREATE PROCEDURE [StgADM].[SrcDimPolicyTermCoverageHistory]  @CutOffDateFrom VARCHAR(100)  
  
AS  
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);  
  
SELECT 
    row.*
FROM (
    SELECT ROW_NUMBER() OVER (
            PARTITION BY       
       ppt.PolicyNum
	   
	 	ORDER BY   ppt.PolicyNum
	 ) row_num
	 --,PolicyTermCoverageHistorySk AUTO GENERATED  
   --,RowCreatedBySK    Populated in ADF  
   --,RowCreatedDtm    Populated in ADF  
   --,RowLastUpdatedBySK   Populated in ADF  
   --,RowLastUpdatedDtm   Populated in ADF  
   ,src.SourceSystemCode AS SourceSystemCode  
   ,ppc.SourceCode AS SourceCode  
   ,ppc.ProcessDateTime AS ProcessDateTime  
   ,TRY_CONVERT(DATETIME, '1900-01-01') AS HistoricalSnapshotFromDate  
     ,TRY_CONVERT(DATETIME, '3000-01-01') as HistoricalSnapshotToDtm  
   ,ppt.PolicyNum AS PolicyNbr  
   ,CAST(ppt.TermNum AS varchar(20) )AS PolicyTermId  
   ,ppt.PolicyTransNum AS PolicyTermChangeId   
   ,tpn.PolicyTransTypeCode  
   ,convert(DATETIME, ppt.PolicyEffectiveDate, 127)   AS PolicyTermChangeEffectiveDate  
   ,CASE WHEN ppt.PolicyTransVersionNum IS NULL THEN 0 ELSE ppt.PolicyTransVersionNum END AS PolicyTermChangeSeq  
   ,convert(DATETIME, ppt.ProcessDateTime, 127)   AS PolicyTermChangeEnteredDtm  
   ,tcg.CoverageCode  
   ,'PREMCOVG' AS ProductCategoryLevelCoverageCode  
   ,'ASLOB' AS ProductCategoryLevelCodeASLOB  
   ,'ETL Not Implemented' AS LOBClaimPayoutLimitRangeSKCode  
   ,tss.StateCode AS GoverningStateSkCode  
   ,'STATE' AS GoverningStateTypeCode  
   ,tab.AnnualStatementLineofBusinessCode  
   ,null as LimitPerAccidentAmt  
   ,pol.GovernClassCode AS CoverageGoverningJurisdictionGoverningClassCodeode  
    
  
FROM Policy.PolicyCoverage ppc  
JOIN Typelist.SourceSystem src ON ppc.SourceSystemSK=src.SourceSystemSK  
JOIN Policy.PolicyTrans ppt ON ppc.PolicyTransSK=ppt.PolicyTransSK  
JOIN Typelist.PolicyTransType tpn ON ppt.PolicyTransTypeSK=tpn.PolicyTransTypeSK  
JOIN Typelist.Coverage tcg ON ppc.CoverageSK=tcg.CoverageSK  
JOIN Typelist.AnnualStatementLineOfBusiness tab ON ppc.AnnualStatementLineofBusinessSK=tab.AnnualStatementLineofBusinessSK  
JOIN Policy.Policy pol ON pol.PolicyNum=ppt.PolicyNum  
JOIN Typelist.State tss ON tss.StateSK=pol.GoverningStateSK  
JOIN Typelist.PolicyTransType tpt ON tpn.PolicyTransTypeSK=tpt.PolicyTransTypeSK  
where ppc.ETLUpdateDateTime > @DateFrom   
) row
WHERE row.row_num = 1
        
         
GO
