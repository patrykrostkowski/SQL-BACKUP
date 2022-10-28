USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcFACTClaimantPayment]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgDM].[SrcFACTClaimantPayment] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);

WITH ACCOUNTINGPERIOD
AS (
	SELECT frp.FinancialReportingPeriodNum AS AccountingPeriodMonthYear
		,clt.ClaimTransactionSK
	FROM Finance.ClaimTransaction clt
	JOIN Typelist.FinancialReportingPeriod frp ON frp.FinancialReportingPeriodSK = clt.FinancialReportingPeriodSK
	)
	,WritingCompany
AS (
	SELECT pwc.WritingCompanySK
		,pwc.WritingCompanyCode
		,clt.ClaimTransactionSK
		,clt.ProcessDateTime
	FROM Finance.ClaimTransaction clt
	JOIN Party.WritingCompany pwc ON pwc.WritingCompanySK = clt.WritingCompanySK
	)
	,AnnulaStatementLineofBusiness
AS (
	SELECT tsb.AnnualStatementLineofBusinessCode
		,clt.ClaimTransactionSK
	FROM Finance.ClaimPayment cpt
	JOIN Finance.ClaimTransaction clt ON clt.ClaimTransactionSK = cpt.ClaimTransactionSK
	JOIN Claim.ClaimCoverage ccc ON ccc.ClaimCoverageSK = clt.ClaimCoverageSK
	JOIN Typelist.AnnualStatementLineofBusiness tsb ON tsb.AnnualStatementLineofBusinessSK = ccc.AnnualStatementLineofBusinessSK
	)
	,Coverage
AS (
	SELECT clt.ClaimTransactionSK
		,tcg.CoverageCode
	FROM Finance.ClaimPayment cpt
	JOIN Finance.ClaimTransaction clt ON clt.ClaimTransactionSK = cpt.ClaimTransactionSK
	JOIN Claim.ClaimCoverage cvg ON cvg.ClaimCoverageSK = clt.ClaimCoverageSK
	JOIN Typelist.Coverage tcg ON tcg.CoverageSK = cvg.CoverageSK
	)
	,LOB
AS (
	SELECT clt.ClaimTransactionSK
		,tlb.LineofBusinessCode
	FROM Finance.ClaimPayment cpt
	JOIN Finance.ClaimTransaction clt ON clt.ClaimTransactionSK = cpt.ClaimTransactionSK
	JOIN Claim.ClaimPolicy ccp ON ccp.ClaimPolicySK = clt.ClaimPolicySK
	JOIN Typelist.LineofBusiness tlb ON tlb.LineofBusinessSK = ccp.LineofBusinessSK
	)
SELECT cpt.SourceCode AS SourceCode
	,clt.SourceCode AS TransactionSourceCode
	,cpt.ProcessDateTime AS ClaimPaymentProcessDateTime
	,clt.ProcessDateTime AS ClaimTransactionProcessDateTime
	,agn.ProcessDateTime AS AgencyProcessDateTime
	,src.SourceSystemCode AS SourceSystemCode
	,cmh.ClaimantNum
	,cmh.SourceCode AS ClaimantSourceCode
	,'INSURTYP' AS ProductCategoryLevelCodeLOB
	,'PREM&CLMCOVG' AS ProductCategoryLevelCoverageCode
	,'ASLOB' AS ProductCategoryLevelCodeASLOB
	,aob.AnnualStatementLineofBusinessCode AS AnnualStatementLineCode
	,cvg.CoverageCode AS CoverageCode
	,lob.LineofBusinessCode AS LineofBusinessCode
		,NULL AS InvoiceDate
	,acp.AccountingPeriodMonthYear
	,cpt.CheckDate AS CheckDate
	,cpt.CheckNum AS CheckNbr
	,clh.ClaimNum
	,clh.SourceCode AS ClaimSourceCode
	,cpy.PaymentMethodCode AS ClaimPaymentTypeCode
		,NULL AS ClaimTransactionID
		,NULL AS CoverageAcquisitionTypeCK
		,NULL AS CoverageDispositionTypeCK
	,wcy.WritingCompanyCode AS WritingCompanyHistoryCode
		,NULL AS MedicalPaymentTypeCK ----(Blocker exists)Loading Null as of now
		,NULL AS MedicalTransactionCategoryCK ----(Blocker Exists)Loading Null as of now
	,cpt.PayeeName AS PayeeName
		,NULL AS PayingBankID
	,cpt.PaymentDate AS PaymentTransactionDate
		,NULL AS TaxableInd
	,tba.BankAccountCode AS ReceivingBankID
	,cpt.ReportableAmt AS PaymentTransactionAmt
	,Convert(DATETIME, pol.EffectiveDate, 127) AS EffectiveDate
	,pol.SourceCode AS PolicyHistorySourceCode
	,agn.SourceCode AS AgencyHistorySourceCode

FROM Finance.ClaimPayment cpt
JOIN Typelist.SourceSystem src ON cpt.SourceSystemSK = src.SourceSystemSK
LEFT JOIN Finance.ClaimTransaction clt ON clt.ClaimTransactionSK = cpt.ClaimTransactionSK
LEFT JOIN ACCOUNTINGPERIOD acp ON acp.ClaimTransactionSk = cpt.ClaimTransactionSK
LEFT JOIN Claim.ClaimPolicy cpl ON clt.ClaimPolicySK = cpl.ClaimPolicySK
LEFT JOIN Config.SourceSystemRelationshipConfig ssr ON src.SourceSystemCode = ssr.ClaimSOurceSystemCode
LEFT JOIN Typelist.SourceSystem pss ON pss.SourceSystemCode = ssr.PolicySourceSystemCode
LEFT JOIN Policy.Policy pol ON pol.PolicyNum = cpl.PolicyNum
	AND pol.SourceSystemSK = pss.SourceSystemSK
LEFT JOIN Party.Agency agn ON pol.AgencySK = agn.AgencySK
LEFT JOIN Claim.Claimant cmh ON cmh.ClaimantSK = cpt.ClaimantSK
LEFT JOIN Typelist.PaymentMethod cpy ON cpy.PaymentMethodSK = cpt.PaymentMethodSK
LEFT JOIN Typelist.BankAccount tba ON cpt.BankAccountSK = tba.BankAccountSK
LEFT JOIN Claim.Claim clh ON clh.ClaimSK = clt.ClaimSK
LEFT JOIN WritingCompany wcy ON wcy.ClaimTransactionSK = cpt.ClaimTransactionSK
LEFT JOIN AnnulaStatementLineofBusiness aob ON aob.ClaimTransactionSK = cpt.ClaimTransactionSK
LEFT JOIN Coverage cvg ON cvg.ClaimTransactionSK = cpt.ClaimTransactionSK
LEFT JOIN LOB lob ON lob.ClaimTransactionSK = cpt.ClaimTransactionSK
WHERE cpt.ETLCreateDateTime > @DateFrom
GO
