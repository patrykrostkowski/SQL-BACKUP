USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcFACTPolicyPremiumTrans]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [StgDM].[SrcFACTPolicyPremiumTrans] @CutOffDateFrom VARCHAR(100)
AS

DECLARE @DateFrom DATETIME = CAST(@CutOffDateFrom AS DATETIME)
		
SELECT
	--,PolicyPremiumTransSK				identity							
	--,null as RowCreatedBySK			populated in ETL
	--,null as RowLastUpdatedBySK		populated in ETL
	--,null as RowCreatedDtm			populated in ETL
	--,null as RowLastUpdatedDtm		populated in ETL
	tss.SourceSystemCode AS SourceSystemCode
	,fpc.SourceCode AS SourceCode
	,format(pph.EntryDate, 'yyyyMM') as AccountingPeriodMonthYear  --,trp.FinancialReportingPeriodYearMonthLabelYYYYMMAbrv AS AccountingPeriodMonthYear --temporairly disabled because of model issue
	,agy.SourceCode as AgencyHistorySKCode	--added ds OPTIONAL LOOKUP
	,alob.AnnualStatementLineofBusinessCode AS AnnualStatementLineOfBusinessCode
	,'ASLOB' AS ProductCategoryLevelASLOB
	,rst.StateCode as ExposureJurisdictionCKCode  --added ds REQUIRED LOOKUP 
	,ins.SourceCode as InsuredHistorySKCode	--added ds OPTIONAL LOOKUP
	,tlob.LineofBusinessCode AS LineOfBusinessCode
	,'INSURTYP' AS ProductCategoryLevelLOB
	,pph.ProcessDateTime as PolicyChangeCalendarDate --added ds REQUIRED
	,pol.EffectiveDate AS PolicyChangeEffectiveDate --added ds REQUIRED
	,fpc.PolicyTransNum AS PolicyChangeID --added ds REQUIRED
,NULL AS PolicyChangeVersionID
	,pph.ProcessDateTime AS PolicyChangeProcessedDtm
	,ptt.PolicyTransTypeCode as PolicyChangeTypeCKCode --added ds REQUIRED LOOKUP (CKCode?)
	,fpc.TransactionDate as PolicyCoverageEffectiveDate  --added ds REQUIRED
	,cov.CoverageCode as PolicyCoverageCode  --added ds REQUIRED LOOKUP (CKCode?)
	,'PREM&CLMCOVG' AS ProductCategoryLevelCOV  --added ds REQUIRED
	,pol.SourceCode as PolicyHistorySKCode --added ds REQUIRED LOOKUP
	,0 AS PremiumWaivedInd
,NULL AS ProducingBranchHistorySK
	,prf.ProfitCenterCode AS ProfitCenterCKCode --added ds OPTIONAL LOOKUP
	,prg.SourceCode AS ProgramSKCode  --added ds OPTIONAL LOOKUP
	,pph.ProcessDateTime AS TransactionAccountingDate --added ds
	,pwc.WritingCompanyCode AS WritingCompanyHistoryCode
	,fpc.AddlRetPremiumBaseAmt AS AdditionalWrittenPremiumAmt
	,cast(0 as decimal(19, 4)) AS AdditionalWrittenPremiumWithTFSAmt
	,cast(0 as decimal(19, 4)) AS AssumedFeeAmt
	,cast(0 as decimal(19, 4)) AS AssumedSurchargeAmt
	,cast(0 as decimal(19, 4)) AS AssumedTaxAmt
	,fpc.AssumedWrittenPremiumBaseAmt AS AssumedWrittenPremiumAmt --added ds REQUIRED
	,cast(0 as decimal(19, 4)) AS AssumedWrittenPremiumWithTFSAmt
	,cast(0 as decimal(19, 4)) AS CededWrittenPremiumAmt
	,fpc.CommissionBaseAmt as CommissionAmt --added ds REQUIRED
	,fpc.CommissionPct as CommissionPct  --added ds REQUIRED
	,fpc.DirectFeeBaseAmt AS DirectFeeAmt--added ds REQUIRED
	,cast(0 as decimal(19, 4)) AS DirectSurchargeAmt
	,cast(0 as decimal(19, 4)) AS DirectTaxAmt
	,fpc.DirectWrittenPremiumBaseAmt AS DirectWrittenPremiumAmt
	,cast(0 as decimal(19, 4)) AS DirectWrittenPremiumWithTFSAmt
	,fpc.PolicyDiscountBaseAmt as DiscountPremiumAmt
	,fpc.EstimatedWrittenPremiumBaseAmt as EstimatedAnnualWrittenPremiumAmt--added ds REQUIRED
	,cast(0 as decimal(19, 4)) AS EstimatedWrittenPremiumWithTFSAmt
	,cast(0 as decimal(19, 4)) AS BaseWrittenPremiumAmt
	,isnull(fpc.DirectWrittenPremiumBaseAmt,0)+ isnull(fpc.AssumedWrittenPremiumBaseAmt,0) as TermWrittenPremiumAmt--added ds REQUIRED
	,cast(0 as decimal(19, 4)) AS TermWrittenPremiumWithTFSAmt
FROM Finance.SrcPolicyPremiumCoverageDetail fpc
--JOIN Finance.PolicyPremiumHeader pph ON pph.PolicyPremiumHeaderSK = fpc.PolicyPremiumHeaderSK --removed ds
JOIN Finance.SrcPolicyPremiumHeader pph ON pph.PolicyPremiumHeaderSK = fpc.PolicyPremiumHeaderSK --added ds
JOIN Policy.Policy pol ON pol.PolicySK = pph.PolicySK
LEFT JOIN Party.Agency agy ON agy.AgencySK = pph.AgencySK
LEFT JOIN Party.Insured ins ON ins.InsuredSK = pol.InsuredSK
LEFT JOIN Policy.Program prg on prg.ProgramSK = pph.ProgramSK
LEFT JOIN Party.WritingCompany pwc ON pwc.WritingCompanySK = fpc.WritingCompanySK
LEFT JOIN Typelist.SourceSystem tss ON tss.SourceSystemSK = fpc.SourceSystemSK
LEFT JOIN Typelist.AnnualStatementLineofBusiness alob ON alob.AnnualStatementLineofBusinessSK = fpc.AnnualStatementLineofBusinessSK
--LEFT JOIN Typelist.FinancialReportingPeriod trp ON trp.FinancialReportingPeriodSK = pph.FinancialReportingPeriodSK
LEFT JOIN Typelist.LineofBusiness tlob ON tlob.LineofBusinessSK = fpc.LineofBusinessSK
LEFT JOIN Typelist.State rst on rst.StateSK = fpc.RiskStateSK --added ds
LEFT JOIN Typelist.Coverage cov on cov.CoverageSK = fpc.CoverageSK --added ds
LEFT JOIN Typelist.PolicyTransType ptt on ptt.PolicyTransTypeSK = fpc.PolicyTransTypeSK --added ds
LEFT JOIN Typelist.ProfitCenter prf on prf.ProfitCenterSK = fpc.ProfitCenterSK --added ds
WHERE fpc.ETLUpdateDateTime > @DateFrom

GO
