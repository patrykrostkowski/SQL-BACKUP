USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcFactPremiumExposureChangeMonthly]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [StgADM].[SrcFactPremiumExposureChangeMonthly]    @CutOffDateFrom VARCHAR(100)

AS
DECLARE @DateFrom DATETIME = cast('1-1-1900' AS DATETIME);

SELECT 
	tss.SourceSystemCode, 
	frp.FinancialReportingPeriodLabelMMDDYYYYAbrv as AccountingMonthSKCode,
	ptr.SourceCode as PolicyTermChangeHistorySKCode,
	cov.CoverageCode as CoverageSKCode,
	sta.StateCode as PolicyTermJurisdictionHistorySKCode,
	ptr.PolicyTransNum,
	ptr.SourceCode as TransactionSourceCode,
	pol.TermNum,
	pol.policyNum,
	ptr.PolicyTransVersionNum,
	ptr.TransStartDatetime,
	ptr.TransEndDatetime,
	ptr.PolicyEffectiveDate,
	ptt.PolicyTransTypeCode,
	tda.DirectAssumedCode,
	'STATE' as GeoAreaTypeSKCode,
	'R' as CoverageDispositionTypeCKCode,
	SUM(epd.DirectWrittenPremiumBaseAmt) as DirectWrittenPremiumAmt,
	SUM(isnull(epd.DirectEarnedPremiumBaseAmt,0)+isnull(epd.DirectTaxBaseAmt,0)+isnull(DirectSurchargeBaseAmt,0)) as DirectWrittenPremiumWithTfsAmt,
	SUM(epd.DirectEarnedPremiumBaseAmt) as DirectEarnedPremiumBaseAmt,
	SUM(isnull(epd.DirectEarnedPremiumBaseAmt,0)+isnull(epd.DirectEarnedTaxSurchargeFeeBaseAmt,0)) as DirectEarnedPremiumWithTfsAmt,
	SUM(epd.AssumedWrittenPremiumBaseAmt) as AssumedWrittenPremiumAmt,
	SUM(isnull(epd.AssumedWrittenPremiumBaseAmt,0)+isnull(epd.AssumedTaxBaseAmt,0)+isnull(epd.AssumedFeeBaseAmt,0)) as AssumedWrittenPremiumWithTfsAmt,
	SUM(epd.AssumedEarnedPremiumBaseAmt) as AssumedEarnedPremiumAmt,
	SUM(isnull(epd.AssumedEarnedPremiumBaseAmt,0)+isnull(epd.AssumedEarnedTaxSurchargeFeeBaseAmt,0)) as AssumedEarnedPremiumWithTfsAmt,
	SUM(epd.CededPremiumBaseAmt) as CededWrittenPremiumAmt,
	NULL as CededWrittenPremiumWithTfsAmt,
	SUM(epd.CededPremiumBaseAmt) as CededEarnedpremiumAmt,
	NULL as CededEarnedPremiumWithTfsAmt,
	SUM(epd.DirectTaxBaseAmt) as DirectTaxAmt,
	SUM(epd.DirectFeeBaseAmt) as DirectFeeAmt,
	SUM(epd.DirectSurchargeBaseAmt) as DirectSurchargeAmt,
	SUM(epd.AssumedTaxBaseAmt) as AssumedTaxAmt,
	SUM(epd.AssumedFeeBaseAmt) as AssumedFeeAmt,
	SUM(epd.AssumedSurchargeBaseAmt) as AssumedSurchargeAmt,
	NULL as CededTaxAmt,
	NULL as CededFeeAmt,
	NULL as CededSurchargeAmt,
	(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Direct'
			THEN SUM(epd.DirectExposureBaseAmt)
			ELSE 0
			END)
			as DirectWrittenExposureAmt,
	(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Direct'
			THEN SUM(epd.EarnedExposureBaseAmt)
			ELSE 0
			END)
			as DirectEarnedWrittenExposureAmt,
	(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Assumed'
			THEN SUM(epd.AssumedExposureBaseAmt)
			ELSE 0
			END)
			as AssumedWrittenExposureAmt,
	(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Assumed'
			THEN SUM(epd.EarnedExposureBaseAmt)
			ELSE 0
			END)
			as AssumedEarnedWrittenExposureAmt,
	(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Ceded'
			THEN SUM(epd.AssumedExposureBaseAmt)
			ELSE 0
			END)
			as CededWrittenExposureAmt,
	(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Ceded'
			THEN SUM(epd.EarnedExposureBaseAmt)
			ELSE 0
			END)
			as CededEarnedWrittenExposureAmt,
	MAX(epd.DirectWrittenPremiumITDBaseAmt) as ItdDirectWrittenPremiumAmt,
	SUM(epd.DirectEarnedPremiumBaseAmt) as ItdDirectEarnedPremiumAmt,
	MAX(epd.AssumedWrittenPremiumITDBaseAmt) as ItdAssumedWrittenPremiumAmt,
	SUM(epd.AssumedEarnedPremiumBaseAmt) as ItdAssumedEarnedPremiumAmt,
	MAX(isnull(epd.DirectWrittenPremiumbaseAmt,0)+isnull(epd.DirectTaxBaseAmt,0)+isnull(epd.DirectSurchargeBaseAmt,0)) as ItdDirectWrittenPremiumWithTfsAmt,
	SUM(isnull(epd.DirectEarnedPremiumBaseAmt,0)+isnull(epd.DirectEarnedTaxSurchargeFeeBaseAmt,0)) as ItdDirectEarnedPremiumWithTfsAmt,
	MAX(isnull(epd.AssumedWrittenPremiumITDBaseAmt,0)+isnull(epd.AssumedTaxSurchargeFeeITDBaseAmt,0)) as ItdAssumedWrittenPremiumWithTfsAmt,
	MAX(isnull(epd.AssumedEarnedPremiumBaseAmt,0)+isnull(epd.AssumedEarnedTaxSurchargeFeeBaseAmt,0)) as ItdAssumedEarnedPremiumWithTfsAmt,
	SUM(epd.CededPremiumBaseAmt) as ItdCededWrittenPremiumAmt,
	NULL as ItdCededWrittenPremiumWithTfsAmt,
	SUM(epd.CededEarnedPremiumBaseAmt) as ItdCededEarnedPremiumAmt,
	NULL as ItdCededEarnedPremiumWithTfsAmt,
	SUM(epd.DirectTaxBaseAmt) as ItdDirectTaxAmt,
	SUM(epd.DirectFeeBaseAmt) as ItdDirectFeeAmt,
	SUM(epd.DirectSurchargeBaseAmt) as ItdDirectSurchargeAmt,
	SUM(epd.AssumedTaxBaseAmt) as ItdAssumedTaxAmt,
	SUM(epd.AssumedFeeBaseAmt) as ItdAssumedFeeAmt,
	SUM(epd.AssumedSurchargeBaseAmt) as ItdAssumedSurchargeAmt,
	NULL as ItdCededTaxAmt,
	NULL as ItdCededFeeAmt,
	NULL as ItdCededSurchargeAmt,
		(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Direct'
			THEN SUM(epd.DirectExposureBaseAmt)
			ELSE 0
			END)
			as ItdDirectWrittenExposureAmt,
	(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Direct'
			THEN SUM(epd.EarnedExposureBaseAmt)
			ELSE 0
			END)
			as ItdDirectEarnedWrittenExposureAmt,
	(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Assumed'
			THEN SUM(epd.AssumedExposureBaseAmt)
			ELSE 0
			END)
			as ItdAssumedWrittenExposureAmt,
	(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Assumed'
			THEN SUM(epd.EarnedExposureBaseAmt)
			ELSE 0
			END)
			as ItdAssumedEarnedWrittenExposureAmt,
	(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Ceded'
			THEN SUM(epd.AssumedExposureBaseAmt)
			ELSE 0
			END)
			as ItdCededWrittenExposureAmt,
	(CASE 
		WHEN
			tbt.BusinessTypeCode = 'Ceded'
			THEN SUM(epd.EarnedExposureBaseAmt)
			ELSE 0
			END)
			as ItdCededEarnedWrittenExposureAmt

FROM 
Finance.EarnedPremiumDetail epd
JOIN Typelist.SourceSystem tss on tss.SourceSystemSK = epd.SourceSystemSK
JOIN Typelist.FinancialReportingPeriod frp on epd.FinancialReportingPeriodSK = frp.FinancialReportingPeriodSK
JOIN Policy.Policy pol on pol.PolicySK = epd.PolicySK
JOIN Policy.PolicyTrans ptr on ptr.PolicyTransTypeSK = epd.PolicyTransTypeSK AND ptr.PolicySK = pol.PolicySK
JOIN Typelist.Coverage cov on cov.CoverageSK = epd.CoverageSK
JOIN Typelist.State sta on epd.StateSK = sta.StateSK
JOIN Typelist.PolicyTransType ptt on ptt.PolicyTransTypeSK = epd.PolicyTransTypeSK
JOIN Typelist.DirectAssumed tda on tda.DirectAssumedSK = pol.DirectAssumedSK
JOIN Typelist.BusinessType tbt on tbt.BusinessTypeSK = pol.BusinessTypeSK
WHERE epd.ETLUpdateDateTime > @DateFrom
GROUP BY frp.FinancialReportingPeriodLabelMMDDYYYYAbrv
,tss.SourceSystemCode
,ptr.SourceCode
,cov.CoverageCode
,sta.StateCode
,ptr.PolicyTransNum
,ptr.SourceCode
,pol.TermNum
,pol.policyNum
,ptr.PolicyTransVersionNum
,ptr.TransStartDatetime
,ptr.TransEndDatetime
,ptr.PolicyEffectiveDate
,ptt.PolicyTransTypeCode
,tda.DirectAssumedCode
,tbt.BusinessTypecode
GO
