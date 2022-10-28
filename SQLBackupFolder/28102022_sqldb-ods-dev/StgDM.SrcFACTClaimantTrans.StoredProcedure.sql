USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcFACTClaimantTrans]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--/****** Object:  StoredProcedure [StgDM].[SrcFACTClaimantTrans]    Script Date: 31.08.2022 11:34:34 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO





CREATE     PROCEDURE [StgDM].[SrcFACTClaimantTrans] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);

WITH cte_STATE
AS (
	SELECT sta.StateCode AS AccidentJurisdictionSKCode
		,sta.StateName
		,clm.claimSK
	FROM claim.Claim clm
	JOIN claim.ClaimLocation clc ON clm.ClaimSK = clc.ClaimSK
	JOIN Typelist.STATE sta ON clc.StateSK = sta.StateSK
	)
	,cte_LineofBussinessSK (
	LineofBusinessCode
	,PolicySK
	)
AS (
	SELECT IIF(COUNT(DISTINCT plb.LineofBusinessSK) = 1, tlb.LineofBusinessCode, 'Not applicable') AS LineofBusinessCode
		,pol.PolicySK
	FROM Policy.Policy pol
	JOIN Policy.PolicyTrans plt ON pol.PolicySK = plt.PolicySK
	JOIN Policy.PolicyLineofBusiness plb ON plb.PolicyTransSK = plt.PolicyTransSK
	LEFT JOIN Typelist.LineofBusiness tlb ON plb.LineofBusinessSK = tlb.LineofBusinessSK
	GROUP BY plb.LineofBusinessSK
		,tlb.LineofBusinessCode
		,pol.PolicySK
	)
	,cte_ACCOUNTINGPERIOD
AS (
	SELECT FORMAT(frp.FinancialReportingPeriodDate, 'yyyyMM') AS AccountingPeriodMonthYear
		,clt.ClaimTransactionSK
	FROM Finance.ClaimTransaction clt
	JOIN Typelist.FinancialReportingPeriod frp ON frp.FinancialReportingPeriodSK = clt.FinancialReportingPeriodSK
	)
	,cte_agency
AS (
	SELECT agn.AgencyNum
		,clm.ClaimSK
		,agn.SourceCode
		,agn.SourceSystemSK
	FROM claim.Claim clm
	JOIN claim.ClaimPolicyAssociation cpa ON clm.ClaimSK = cpa.ClaimSK
	JOIN Policy.Policy pol ON cpa.PolicySK = pol.PolicySK
	JOIN Party.Agency agn ON agn.AgencySK = pol.AgencySK
	)
	,cte_claimant
AS (
	SELECT clmt.claimantSK
		,clmt.claimSK
		,clmt.ClaimantNum
		,clmt.SourceCode
	FROM Claim.LossOccurrence loso
	JOIN Claim.Claimant clmt ON clmt.ClaimantSK = loso.ClaimantSk
	)
	,cte_Acquisition
AS (
	select tda.DirectAssumedCode,cpa.ClaimSK from Claim.ClaimPolicyAssociation cpa
join Policy.Policy pol on cpa.PolicySK=pol.PolicySK
join Typelist.DirectAssumed tda on tda.DirectAssumedSK = pol.DirectAssumedSK
	)
	,lineofbusiness
AS (
	SELECT alb.AnnualStatementLineofBusinessCode
		,pol.PolicySK
	FROM Policy.Policy pol
	JOIN Typelist.AnnualStatementLineofBusiness alb ON alb.AnnualStatementLineofBusinessSK = pol.AnnualStatementLineofBusinessSK
	)
	,cte_WRITINGCOMPANY AS(
	select pwc.SourceCode,cpa.ClaimSK from Claim.ClaimPolicyAssociation cpa
join Policy.Policy pol on cpa.PolicySK=pol.PolicySK
JOIN Party.WritingCompany pwc ON pwc.WritingCompanySK = pol.WritingCompanySK
	)
	,cte_PREMIUMCOVERAGE AS(
	select cov.CoverageCode,cco.ClaimCoverageSK from Claim.ClaimCoverage cco
join Finance.EarnedPremiumDetail epd on epd.CoverageSK=cco.CoverageSK
join Typelist.Coverage cov on cov.CoverageSK=epd.CoverageSK
	)
	,cte_TRANSAMT
AS (
	SELECT CASE 
			WHEN t.CostTypeCode = 'A'
				AND t2.ClaimTransactionTypeCode = 'P'
				THEN ct.transactionbaseAmt
			ELSE NULL
			END AS ALAEPaidAmt
		,CASE 
			WHEN t.CostTypeCode = 'A'
				AND t2.ClaimTransactionTypeCode = 'V'
				THEN ct.transactionbaseAmt
			ELSE NULL
			END AS ALAERecoveryAmt
		,CASE 
			WHEN t.CostTypeCode = 'A'
				AND t2.ClaimTransactionTypeCode = 'R'
				THEN ct.transactionbaseAmt
			ELSE NULL
			END AS ALAEReserveAmt
		,CASE 
			WHEN t.CostTypeCode = 'L'
				AND t2.ClaimTransactionTypeCode = 'P'
				THEN ct.transactionbaseAmt
			ELSE NULL
			END AS LossPaidAmt
		,CASE 
			WHEN t.CostTypeCode = 'L'
				AND t2.ClaimTransactionTypeCode = 'V'
				THEN ct.transactionbaseAmt
			ELSE NULL
			END AS LossRecoveryAmt
		,CASE 
			WHEN t.CostTypeCode = 'L'
				AND t2.ClaimTransactionTypeCode = 'R'
				THEN ct.transactionbaseAmt
			ELSE NULL
			END AS LossReserveAmt
		,CASE 
			WHEN t.CostTypeCode = 'U'
				AND t2.ClaimTransactionTypeCode = 'P'
				THEN ct.transactionbaseAmt
			ELSE NULL
			END AS ULAEPaidAmt
		,CASE 
			WHEN t.CostTypeCode = 'U'
				AND t2.ClaimTransactionTypeCode = 'V'
				THEN ct.transactionbaseAmt
			ELSE NULL
			END AS ULAERecoveryAmt
		,CASE 
			WHEN t.CostTypeCode = 'U'
				AND t2.ClaimTransactionTypeCode = 'R'
				THEN ct.transactionbaseAmt
			ELSE NULL
			END AS ULAEReserveAmt
		,ct.ClaimTransactionSK
	FROM Finance.ClaimTransaction ct
	JOIN Typelist.CostType t ON t.CostTypeSK = ct.CostTypeSK
	JOIN Typelist.ClaimTransactionType t2 ON t2.ClaimTransactionTypeSk = ct.ClaimTransactionTypeSk
	)
SELECT clt.SourceCode
	,ctt.ClaimTransactionTypeCode
	,ctc.ClaimTransactionCategoryTypeCode
	,'INSURTYP' AS ProductCategoryLevelLOB
	,'ASLOB' AS ProductCategoryLevelASLOB
	,'CLMCOVG' AS ClaimCoverageCode
	,'PREMCOVG' AS PremiumCoverageCode
	,lob.AnnualStatementLineofBusinessCode AS AnnualStatementLOBCode
	,clob.LineofBusinessCode AS LOBCode
	,clt.ProcessDateTime
	,src.SourceSystemCode AS SourceSystemCode
	,sta.AccidentJurisdictionSKCode
	,'STATE' AS AccidentJurisdictionType
	--,clt.FinancialReportingPeriodSK
	,acp.AccountingPeriodMonthYear
	,agn.AgencyNum
	,agn.SourceCode AS AgentSourceCode
	,pss.SourceSystemCode as PolicySourceSystemCode
	--,cov.AnnualStatementLineofBusinessSK AS AnnualStatementLOBSK
	--,clmt.ClaimantSK
	,clmt.ClaimantNum
	,clmt.SourceCode AS ClaimantSourceCode
	--,clt.ClaimCoverageSK
	,clm.ClaimNum as ClaimNbr
	,clm.SourceCode AS ClaimSourceCode
	,cpol.SourceCode AS ClaimPolicySourceSKCode
	--,clm.ClaimNum AS ClaimNbr
	--ClaimPolicyTermSK----No relevance
	--,lob.LineofBusinessSK
	--,cls.ClaimStatusCode
	--,cls.ClaimStatusName ---ClaimStatusDesc
	---,ClaimTransactionCategoryCK---Not available
	---,ClaimTransactionID Not available
	,acq.DirectAssumedCode AS CoverageAcquisitionTypeCode
	,'R' as CoverageDispositionTypeCode
	--,clt.ClaimTransactionCategoryTypeSK
	--CoverageDispositionTypeCK---Not available
	,pwc.SourceCode as WritingCompanyCode
	--LineOfBusinessSK
	,pcov.CoverageCode as PremiumCoverageSKCode
	--,clt.RecoveryCategoryTypeSK
	,clt.TransactionDate
	,CAST(clt.transactionbaseAmt as DECIMAL(19,4)) AS TransactionAmt
	,cge.CoverageCode as ClaimCoverageSKCode
	,isnull(amt.ALAEPaidAmt,0) AS ALAEPaidAmt
	,isnull(amt.ALAERecoveryAmt,0) AS ALAERecoveryAmt
	,isnull(amt.ALAEReserveAmt,0) AS ALAEReserveAmt
	,isnull(amt.LossPaidAmt,0) AS LossPaidAmt
	,isnull(amt.LossRecoveryAmt,0) AS LossRecoveryAmt
	,isnull(amt.LossReserveAmt,0) AS LossReserveAmt
	,isnull(amt.ULAEPaidAmt,0) AS ULAEPaidAmt
	,isnull(amt.ULAERecoveryAmt,0) AS ULAERecoveryAmt
	,isnull(amt.ULAEReserveAmt,0) AS ULAEReserveAmt
FROM Finance.ClaimTransaction clt
JOIN Typelist.SourceSystem src ON clt.SourceSystemSK = src.SourceSystemSK
LEFT JOIN Claim.Claim clm ON clm.ClaimSK = clt.ClaimSK
LEFT JOIN Claim.ClaimPolicy cpol on clt.ClaimPolicySK=cpol.ClaimPolicySK
LEFT JOIN cte_LineofBussinessSK clob ON clob.PolicySK = clt.PolicySK
LEFT JOIN cte_WRITINGCOMPANY pwc ON pwc.ClaimSK=clt.ClaimSK
LEFT JOIN cte_STATE sta ON sta.ClaimSK = clt.ClaimSK
LEFT JOIN cte_agency agn ON agn.ClaimSK = clt.ClaimSK
LEFT JOIN Claim.ClaimCoverage cov ON clt.ClaimPolicySK = cov.ClaimPolicySK
LEFT JOIN cte_PREMIUMCOVERAGE pcov on pcov.ClaimCoverageSK=clt.ClaimCoverageSK
LEFT JOIN Typelist.Coverage cge ON cge.CoverageSK=cov.CoverageSK
LEFT JOIN cte_claimant clmt ON clmt.ClaimSK = clt.ClaimSK
LEFT JOIN Typelist.ClaimStatus cls ON cls.ClaimStatusSK = clm.ClaimStatusSK
LEFT JOIN cte_Acquisition acq ON acq.ClaimSK = clt.ClaimSK
LEFT JOIN lineofbusiness lob ON lob.PolicySK = clt.PolicySK
LEFT JOIN cte_TRANSAMT amt ON amt.ClaimTransactionSK = clt.ClaimTransactionSK
LEFT JOIN cte_ACCOUNTINGPERIOD acp ON acp.ClaimTransactionSk = clt.ClaimTransactionSK
left join Typelist.ClaimTransactionCategoryType ctc on ctc.ClaimTransactionCategoryTypeSK = clt.ClaimTransactionCategoryTypeSK
left join Typelist.ClaimTransactionType ctt on clt.ClaimTransactionTypeSK = ctt.ClaimTransactionTypeSK
join Typelist.SourceSystem pss on pss.SourceSystemSK = agn.SourceSystemSK
WHERE 1=1
	AND clt.ETLCreateDateTime > @DateFrom
GO
