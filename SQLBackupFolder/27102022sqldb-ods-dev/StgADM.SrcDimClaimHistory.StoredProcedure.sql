USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimClaimHistory]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE  PROCEDURE  [StgADM].[SrcDimClaimHistory]    @CutOffDateFrom VARCHAR(100)

AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);

WITH cte_subrogation
AS (
     SELECT  CASE WHEN  
	    MAX(csb.SubrogationNum) IS NOT NULL THEN 1
		ELSE 0 
		END SubrogationNum , ClaimSK
	 FROM Claim.Subrogation csb
	 GROUP BY ClaimSK
),

cte_claimTransaction
AS (
	SELECT  CASE WHEN 
	SUM(ctr.TransactionBaseAmt) > 0	THEN 1
	ELSE 0
	END PaymentsMadeNum , ClaimSK
	FROM Finance.ClaimTransaction ctr 
	GROUP BY ClaimSK
)

   SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime ASC
			) AS rn
	FROM (
           	SELECT    --,ClaimHistorySK AUTO GENERATED
			--,RowCreatedBySK		  Populated in ADF
			--,RowCreatedDtm		  Populated in ADF
			--,RowLastUpdatedBySK	  Populated in ADF
			--,RowLastUpdatedDtm	  Populated in ADF
			 src.SourceSystemCode AS SourceSystemCode
			,clm.SourceCode AS SourceCode
			,clm.ProcessDateTime AS ProcessDateTime
			,TRY_CONVERT(DATETIME, '1900-01-01') AS HistoricalSnapshotFromDtm
	        ,TRY_CONVERT(DATETIME, '3000-01-01') as HistoricalSnapshotToDtm
			,ccp.PolicyNum AS PolicyNbr
			,CAST(pol.TermNum  as varchar) AS  PolicyTermId
			,cct.CatastropheNum  AS  CatastropheCode
			,CAST(clm.ClaimNum  as varchar) AS ClaimId
			,clm.ClaimDesc
			,tss.StateCode  AS ClaimJurisdictionSkCode
			,CONVERT(DATE, csh.CloseDate)   AS ClaimLatestClosedDate
			,CONVERT(DATE, csh.ReOpenDate)  AS ClaimLatestReopenedDate
			,tcs.ClaimStatusCode AS  ClaimLifeCycleStatusCKCode			
			,clm.ReportedtoInsuredDate AS ClaimReportedDate
			,clm.OpenedDate  AS ClaimOpenedDate
			,tda.DirectAssumedCode AS CoverageAcquisitionTypeCKCode
			,'R' AS CoverageDispositionTypeCode
			,clm.IsLitigationClaimInd AS LitigationInd
			,tct.ClaimCategoryTypeCode
			,EventDate AS LossEventDate
			,clm.LossDate AS LossEventDiscoveryDate
			,tst.StateCode AS LossEventGeoAreaSkCode
			,clm.EventDate AS LossEventYear
			,ctr.PaymentsMadeNum AS PaymentsMadeInd
			,csb.SubrogationNum AS SubrogationInd
			,clo.SequenceNum  AS UniqueOccurrenceId

FROM Claim.Claim clm
JOIN Typelist.SourceSystem src ON src.SourceSystemSK=clm.SourceSystemSK
LEFT JOIN Claim.ClaimPolicyAssociation cpa ON clm.ClaimSK=cpa.ClaimSK
LEFT JOIN Claim.ClaimPolicy ccp ON cpa.ClaimPolicySK=ccp.ClaimPolicySK
LEFT JOIN Policy.Policy pol ON cpa.PolicySK=pol.PolicySK
LEFT JOIN Claim.Catastrophe cct ON clm.CatastropheSK=cct.CatastropheSK
LEFT JOIN Claim.ClaimLocation ccl ON clm.ClaimSK=ccl.ClaimSK
LEFT JOIN Typelist.State tss ON ccl.StateSK=tss.StateSK
LEFT JOIN Claim.ClaimStatusHistory csh ON clm.ClaimStatusSK=csh.ClaimStatusSK
LEFT JOIN Typelist.ClaimStatus tcs ON clm.ClaimStatusSK=tcs.ClaimStatusSK
LEFT JOIN Typelist.DirectAssumed tda ON pol.DirectAssumedSK=tda.DirectAssumedSK
LEFT JOIN Typelist.ClaimCategoryType tct ON clm.ClaimCategoryTypeSK=tct.ClaimCategoryTypeSK
LEFT JOIN Claim.LossOccurrence clo ON clm.ClaimSK=clo.ClaimSK
LEFT JOIN Typelist.State tst ON clo.StateSK=tst.StateSK
LEFT JOIN cte_subrogation csb ON clm.ClaimSK=csb.ClaimSK
LEFT JOIN cte_claimTransaction ctr ON clm.ClaimSK = ctr.ClaimSK
where
	 clm.ETLCreateDateTime > @DateFrom
       ) tmp
	) rn
WHERE rn.rn = 1
GO
