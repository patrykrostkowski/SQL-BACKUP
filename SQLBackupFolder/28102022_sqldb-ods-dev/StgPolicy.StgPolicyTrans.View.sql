USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[StgPolicyTrans]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     view [StgPolicy].[StgPolicyTrans]
as
SELECT * FROM (
SELECT --TOP 10 
	src.*
	/*typelist lookups*/
	,tss.SourceSystemSK
	,tbi.BusinessTypeSK
	,tbu.BusinessUnitSK
	,ttr.CoverageTriggerSK
	,tdc.CountrySK as DomicileCountrySK
	,tds.StateSK as DomicileStateSK
	,tna.NorthAmericanIndustryClassificationSK
	,tpf.ProfessionSK
	,tpj.ProjectTypeSK
	,tsi.StandardIndustryCodeSK
	,tus.UnderwritingStatusSK
	,tcb.CurrencySK as BaseCurrencySK
	,tco.CurrencySK as OriginalCurrencySK
	,tcr.CurrencySK as ReportingCurrencySK
	,ptt.PolicyTransTypeSK
	,pts.PolicyStatusSK as PolicyTransStatusSK
	/*base table lookups*/
	,pol.PolicySK
	,wco.WritingCompanySK
	/*ODS ETL dates*/
	--,ods.ETLCreateDateTime
	--,ods.ETLCreateProcessNum
FROM StgPolicy.SrcPolicyTrans src
/*master table lookup */
left join Typelist.SourceSystem tss with (nolock) on src.SourceSystemCode = tss.SourceSystemCode
left join Policy.PolicyTrans ods with (nolock) on src.SourceCode = ods.SourceCode and ods.SourceSystemSK = tss.SourceSystemSK
/*typelist lookups*/
left join Typelist.BusinessType tbi with (nolock) on src.BusinessTypeCode = tbi.BusinessTypeCode and tbi.SourceSystemSK = tss.SourceSystemSK
left join Typelist.BusinessUnit tbu with (nolock) on src.BusinessUnitCode = tbu.BusinessUnitCode and tbu.SourceSystemSK = tss.SourceSystemSK
left join Typelist.CoverageTrigger ttr with (nolock) on src.CoverageTriggerCode = ttr.CoverageTriggerCode and ttr.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Country tdc with (nolock) on src.DomicileCountryCode = tdc.CountryCode and tdc.SourceSystemSK = tss.SourceSystemSK
left join Typelist.State tds with (nolock) on src.DomicileStateCode = tds.StateCode and tds.SourceSystemSK = tss.SourceSystemSK
left join Typelist.NorthAmericanIndustryClassification tna with (nolock) on src.NorthAmericanIndustryClassificationCode = tna.NorthAmericanIndustryClassificationCode and tna.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Profession tpf with (nolock) on src.ProfessionCode = tpf.ProfessionCode and tpf.SourceSystemSK = tss.SourceSystemSK
left join Typelist.ProjectType tpj with (nolock) on src.ProjectTypeCode = tpj.ProjectTypeCode and tpj.SourceSystemSK = tss.SourceSystemSK
left join Typelist.StandardIndustryCode tsi with (nolock) on src.StandardIndustryCode = tsi.StandardIndustryCode and tsi.SourceSystemSK = tss.SourceSystemSK
left join Typelist.UnderwritingStatus tus with (nolock) on src.UnderwritingStatusCode = tus.UnderwritingStatusCode and tus.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Currency tcb with (nolock) on src.BaseCurrencyCode = tcb.CurrencyCode and tcb.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Currency tco with (nolock) on src.OriginalCurrencyCode = tco.CurrencyCode and tco.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Currency tcr with (nolock) on src.ReportingCurrencyCode = tcr.CurrencyCode and tcr.SourceSystemSK = tss.SourceSystemSK
left join Typelist.PolicyTransType ptt with (nolock) on src.PolicyTransTypeCode = ptt.PolicyTransTypeCode and ptt.SourceSystemSK = tss.SourceSystemSK
left join Typelist.PolicyStatus pts with (nolock) on src.PolicyTransStatusCode = pts.PolicyStatusCode and pts.SourceSystemSK = tss.SourceSystemSK
/*base table lookups*/
left join Party.WritingCompany wco with (nolock) on src.WritingCompanySourceCode = wco.SourceCode and wco.SourceSystemSK = tss.SourceSystemSK
left join Policy.Policy pol with (nolock) on src.PolicySourceCode = pol.SourceCode and pol.SourceSystemSK = tss.SourceSystemSK
) a
GO
