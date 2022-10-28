USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimAgreementHistoryBridge]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [StgADM].[SrcDimAgreementHistoryBridge]    @CutOffDateFrom VARCHAR(100)

AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);

SELECT *
FROM 
(
SELECT
	  row_number() OVER(PARTITION BY ptr.PolicyNum, src.SourceSystemCode ORDER BY ptr.PolicyNum desc ) AS rn
      ,src.SourceSystemCode
      ,TRY_CONVERT(DATETIME, '1900-01-01') as RowEffectiveFromDtm	
	  ,TRY_CONVERT(DATETIME, '3000-01-01') as RowEffectiveToDtm
      ,ptr.PolicyNum --,PolicyTermChangeHistorySk,  PolicyTermJurisdictionHistorySk,  PolicyTermCoverageHistorySk     -- PolicyTrans.PolicyNum = PolicyNbr
	  
FROM Policy.PolicyTrans ptr
JOIN Typelist.SourceSystem src ON ptr.SourceSystemSK = src.SourceSystemSK
JOIN Policy.PolicyCoverage pco ON ptr.PolicyTransSK = pco.PolicyTransSK

WHERE ptr.ETLUpdateDateTime > @DateFrom
) tmp
WHERE tmp.rn = 1

GO
