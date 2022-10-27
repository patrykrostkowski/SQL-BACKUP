USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcFactLossTransaction]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgADM].[SrcFactLossTransaction] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT 
	--FactLossTransactionSk                         
	--,RowCreatedBySk                                
	--,RowCreatedDtm                                 
	--,RowLastUpdatedBySk                            
	--,RowLastUpdatedDtm                             
	tss.SourceSystemCode                                
	--,CAST(tfp.FinancialReportingPeriodNum as INT) as AccountingMonthSkCode		-- ADM table DimCalendarMonth attribute MonthNbr
	,fct.ProcessDateTime
		,null as PrimaryMetricCk								   		
	,clm.SourceCode as ClaimHistorySkCode                          -- according to mapping, map via ClaimNum     , to get ClaimHistorySK    
	,clt.SourceCode as ClaimantCoverageHistorySkCode               -- according to mapping, map via ClaimantNum  , to get ClaimantCoverageHistorySK    
	,trc.RecoveryCategoryTypeCode as RecoveriesTypeCkCode           
	,CASE WHEN tct.ClaimTransactionTypeCode = 'P' AND trc.RecoveryCategoryTypeSK IS NULL
		THEN 'RCVRD' 
		ELSE 'NONE'
	END AS RecoveriesIncludedTypeCkCode
	,tcc.ClaimTransactionCategoryTypeCode as LobClaimFinancialTransactionClassCkCode  
	,tct.ClaimTransactionTypeCode as ClaimFinancialTransactionTypeCkCode 
	,clm.SourceCode as CoverageAcquisitionTypeCkCode				-- to get CoverageAcquisitionTypeCK       
	,'R' as CoverageDispositionTypeCkCode                     
	,clm.ClaimNum as ClaimId                                       
	,fct.ProcessDateTime as TransactionEffectiveDtm                       
	,fct.ProcessDateTime as TransactionEntryDtm                           
	,fct.TransactionDate as TransactionAccountingDtm                      
	,fct.TransactionBaseAmt as TransactionAmt      

FROM Finance.ClaimTransaction fct
JOIN Typelist.SourceSystem tss ON fct.SourceSystemSK = tss.SourceSystemSK
JOIN Typelist.FinancialReportingPeriod tfp ON tfp.FinancialReportingPeriodSK = fct.FinancialReportingPeriodSK
JOIN Claim.Claim clm ON clm.ClaimSK = fct.ClaimSK
JOIN Claim.Claimant clt ON clt.ClaimSK = fct.ClaimSK
JOIN Typelist.ClaimTransactionType tct ON tct.ClaimTransactionTypeSK = fct.ClaimTransactionTypeSK
LEFT JOIN Typelist.RecoveryCategoryType trc ON trc.RecoveryCategoryTypeSK = fct.RecoveryCategoryTypeSK
LEFT JOIN Typelist.ClaimTransactionCategoryType tcc ON tcc.ClaimTransactionCategoryTypeSK = fct.ClaimTransactionCategoryTypeSK
WHERE fct.ETLUpdateDateTime > @DateFrom



GO
