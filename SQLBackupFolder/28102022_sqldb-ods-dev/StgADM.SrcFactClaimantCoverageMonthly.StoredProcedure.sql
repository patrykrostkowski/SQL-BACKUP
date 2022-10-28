USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcFactClaimantCoverageMonthly]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [StgADM].[SrcFactClaimantCoverageMonthly]    @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);

 WITH 
cte_TRANS
AS (
	SELECT 
		CASE 
			WHEN t.CostTypeCode = 'L'
				AND t2.ClaimTransactionTypeCode = 'V'
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS ItdLossRecoveryAmt
		,CASE 
			WHEN (t.CostTypeCode = 'A' OR t.CostTypeCode = 'U')
				AND (t2.ClaimTransactionTypeCode = 'V')
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS ItdExpenseRecoveryAmt
		,CASE 
			WHEN t.CostTypeCode = 'L'
				AND t2.ClaimTransactionTypeCode = 'P'
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS ItdLossPaymentAmt
		,CASE 
			WHEN (t.CostTypeCode = 'A' OR t.CostTypeCode = 'U')
				AND t2.ClaimTransactionTypeCode = 'P'
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS ItdExpensePaymentAmt
		,CASE 
			WHEN t.CostTypeCode = 'L'
				AND t2.ClaimTransactionTypeCode = 'R'
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS ItdLossReserveAmt
		,CASE 
			WHEN (t.CostTypeCode = 'A' OR t.CostTypeCode = 'U')
				AND t2.ClaimTransactionTypeCode = 'R'
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS ItdExpenseReserveAmt
			----Ytd
		,CASE 
			WHEN t.CostTypeCode = 'L'
				AND t2.ClaimTransactionTypeCode = 'V'
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS YtdLossRecoveryAmt
		,CASE 
			WHEN (t.CostTypeCode = 'A' OR t.CostTypeCode = 'U')
				AND (t2.ClaimTransactionTypeCode = 'V')
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS YtdExpenseRecoveryAmt
		,CASE 
			WHEN t.CostTypeCode = 'L'
				AND t2.ClaimTransactionTypeCode = 'P'
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS YtdLossPaymentAmt
		,CASE 
			WHEN (t.CostTypeCode = 'A' OR t.CostTypeCode = 'U')
				AND t2.ClaimTransactionTypeCode = 'P'
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS YtdExpensePaymentAmt
		,CASE 
			WHEN t.CostTypeCode = 'L'
				AND t2.ClaimTransactionTypeCode = 'R'
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS YtdLossReserveAmt
		,CASE 
			WHEN (t.CostTypeCode = 'A' OR t.CostTypeCode = 'U')
				AND t2.ClaimTransactionTypeCode = 'R'
				THEN ct.TransactionReportingAmt
			ELSE NULL
			END AS YtdExpenseReserveAmt

		,ct.ClaimTransactionSK
	FROM Finance.ClaimTransaction ct
	JOIN Typelist.CostType t ON t.CostTypeSK = ct.CostTypeSK
	JOIN Typelist.ClaimTransactionType t2 ON t2.ClaimTransactionTypeSk = ct.ClaimTransactionTypeSk
	)


SELECT  

--##################################################
   -- src.SourceSystemCode										--SourceSystemSk
   --   ,frp.FinancialReportingPeriodNum AS AccountingMonthSkCode
   --   ,clm.ClaimNum												-- ClaimHistorySk --,CoverageDeductibleAppliesInd--,LobDeductibleSizeCategoryCk
	  --,clt.ClaimantNum											-- ClaimantCoverageHistorySk
   --   ,clt.SourceCode AS ClaimantSourceCode						--,ClaimantInjurySk
   --   ,CASE WHEN clc.DeductibleAmt > 0 THEN 1
			--ELSE 0 END AS DeductibleInd
   --   ,clc.DeductibleAmt AS DeductibleAmt
   --   ,clp.AnnualAggregateDeductibleAmt AS DeductibleAggregateLimitAmt
   --   ,trans.ItdLossRecoveryAmt AS ItdLossRecoveryAmt
   --   ,trans.ItdExpenseRecoveryAmt
   --   ,trans.ItdLossPaymentAmt
   --   ,trans.ItdExpensePaymentAmt
   --   ,trans.ItdLossReserveAmt
   --   ,trans.ItdExpenseReserveAmt
   --   ,trans.YtdLossRecoveryAmt
   --   ,trans.YtdExpenseRecoveryAmt
   --   ,trans.YtdLossPaymentAmt
   --   ,trans.YtdExpensePaymentAmt
   --   ,trans.YtdLossReserveAmt
   --   ,trans.YtdExpenseReserveAmt
--##################################################

		--FactClaimantCoverageMonthlySk
		--,RowCreatedBySk               
		--,RowCreatedDtm                
		--,RowLastUpdatedBySk           
		--,RowLastUpdatedDtm            
		src.SourceSystemCode               
		--,frp.FinancialReportingPeriodNum AS AccountingMonthSkCode
		,CONCAT(frp.FinancialReportingYearNum,'/',SUBSTRING(frp.FinancialReportingPeriodNum,6,2)) as CalendarYearMonthAbrv
		,clm.SourceCode as ClaimHistorySkCode  
		,clm.ClaimNum

		,tcv.CoverageCode as ClaimantCoverageHistorySkCode				

		,tit.InjuryTypeCode as ClaimantInjurySkCode
		,CASE WHEN tct.CoverageTriggerCode = 'peroccurrence'
			THEN 1
			ELSE 0
		END	AS CoverageDeductibleAppliesInd								

		,CASE WHEN clc.DeductibleAmt > 0 
			THEN 1
			ELSE 0 
		END AS DeductibleInd										
		,'N/A' AS LobDeductibleSizeCategoryCkCode						
		,clc.DeductibleAmt 										
		,clc.OccurrenceLimitAmt AS DeductibleAggregateLimitAmt	
		,ISNULL(SUM(trans.ItdLossRecoveryAmt),0)    AS ItdLossRecoveryAmt
		,ISNULL(SUM(trans.ItdExpenseRecoveryAmt),0) AS ItdExpenseRecoveryAmt
		,ISNULL(SUM(trans.ItdLossPaymentAmt),0)     AS ItdLossPaymentAmt
		,ISNULL(SUM(trans.ItdExpensePaymentAmt),0)  AS ItdExpensePaymentAmt
		,ISNULL(SUM(trans.ItdLossReserveAmt),0)     AS ItdLossReserveAmt
		,ISNULL(SUM(trans.ItdExpenseReserveAmt),0)  AS ItdExpenseReserveAmt
		,ISNULL(SUM(trans.YtdLossRecoveryAmt),0)    AS YtdLossRecoveryAmt
		,ISNULL(SUM(trans.YtdExpenseRecoveryAmt),0) AS YtdExpenseRecoveryAmt
		,ISNULL(SUM(trans.YtdLossPaymentAmt),0)     AS YtdLossPaymentAmt
		,ISNULL(SUM(trans.YtdExpensePaymentAmt),0)  AS YtdExpensePaymentAmt
		,ISNULL(SUM(trans.YtdLossReserveAmt),0)     AS YtdLossReserveAmt
		,ISNULL(SUM(trans.YtdExpenseReserveAmt),0)  AS YtdExpenseReserveAmt

FROM Finance.ClaimTransaction ctr
JOIN Typelist.SourceSystem src ON ctr.SourceSystemSK = src.SourceSystemSK
JOIN Typelist.FinancialReportingPeriod frp ON ctr.FinancialReportingPeriodSK = frp.FinancialReportingPeriodSK
JOIN Claim.Claim clm ON ctr.ClaimSK = clm.ClaimSK 
JOIN Claim.Claimant clt ON ctr.ClaimSK = clt.ClaimSK
JOIN Claim.ClaimCoverage clc ON ctr.ClaimCoverageSK = clc.ClaimCoverageSK
JOIN Claim.ClaimPolicy clp ON clc.ClaimPolicySK = clp.ClaimPolicySK
JOIN Typelist.CostType ctt ON ctr.CostTypeSK = ctt.CostTypeSK
JOIN Typelist.ClaimTransactionType ctp ON ctr.ClaimTransactionTypeSK = ctp.ClaimTransactionTypeSK
JOIN cte_TRANS trans ON ctr.ClaimTransactionSK = trans.ClaimTransactionSK
LEFT JOIN Claim.LossEvent cle ON cle.LossEventSK = ctr.LossEventSK
LEFT JOIN Claim.LossEventInjury cli ON cli.ClaimantSK = clt.ClaimantSK
LEFT JOIN Typelist.InjuryType tit ON tit.InjuryTypeSK = cli.InjuryTypeSK
LEFT JOIN Typelist.CoverageTrigger tct ON tct.CoverageTriggerSK = clp.CoverageTriggerSK
JOIN Typelist.Coverage tcv ON clc.CoverageSK = tcv.CoverageSK

WHERE ctr.ETLUpdateDateTime > @DateFrom
GROUP BY 
	CONCAT(frp.FinancialReportingYearNum,'/',SUBSTRING(frp.FinancialReportingPeriodNum,6,2))
	,src.SourceSystemCode
	,clm.SourceCode
	,tit.InjuryTypeCode
	,clc.DeductibleAmt
	,clc.OccurrenceLimitAmt
	,tct.CoverageTriggerCode
	,clt.ClaimantNum
	,tcv.CoverageCode
	,clm.ClaimNum



GO
