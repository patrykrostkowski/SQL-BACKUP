USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[StgPolicy]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   view [StgPolicy].[StgPolicy]
as
SELECT * FROM (
SELECT --TOP 10 
	src.*
	/*typelist lookups*/
	,tss.SourceSystemSK
	,tpt.PolicyTypeSK
	,tat.AttachmentTypeSK
	,tau.AuditTransactionSK
	,tbt.BillTypeSK
	,tbi.BusinessTypeSK
	,tbu.BusinessUnitSK
	,tca.CancellationRateSK
	,tct.CancellationTypeSK
	,ttr.CoverageTriggerSK
	,tde.DepartmentSK
	,tdc.CountrySK as DomicileCountrySK
	,tds.StateSK as DomicileStateSK
	,tgs.StateSK as GoverningStateSK
	,tle.LeadExcessQuotaSK
	,tna.NorthAmericanIndustryClassificationSK
	,tpp.PayPlanSK
	,tps.PolicyStatusSK
	,tpf.ProfessionSK
	,tpj.ProjectTypeSK
	,tsi.StandardIndustryCodeSK
	,tus.UnderwritingStatusSK
	,tda.DirectAssumedSK
	,tcb.CurrencySK as BaseCurrencySK
	,tco.CurrencySK as OriginalCurrencySK
	,tcr.CurrencySK as ReportingCurrencySK
	,trd.ProductSK
	,tcc.ClassCodeSK as GovernClassCodeSK
	,tas.AnnualStatementLineofBusinessSK
	/*base table lookups*/
	,agy.AgencySK
	,acc.AccountSK
	,ins.InsuredSK
	,wco.WritingCompanySK
	,prg.ProgramSK
	/*ODS ETL dates*/
	--,ods.ETLCreateDateTime
	--,ods.ETLCreateProcessNum
FROM StgPolicy.SrcPolicy src
/*master table lookup */
left join Typelist.SourceSystem tss with (nolock) on src.SourceSystemCode = tss.SourceSystemCode
left join Policy.Policy ods with (nolock) on src.SourceCode = ods.SourceCode and ods.SourceSystemSK = tss.SourceSystemSK
/*typelist lookups*/
left join Typelist.PolicyType tpt with (nolock) on src.PolicyTypeCode = tpt.PolicyTypeCode and tpt.SourceSystemSK = tss.SourceSystemSK
left join Typelist.AttachmentType tat with (nolock) on src.AttachmentTypeCode = tat.AttachmentTypeCode and tat.SourceSystemSK = tss.SourceSystemSK
left join Typelist.AuditTransaction tau with (nolock) on src.AuditTransactionCode = tau.AuditTransactionCode and tau.SourceSystemSK = tss.SourceSystemSK
left join Typelist.BillType tbt with (nolock) on src.BillTypeCode = tbt.BillTypeCode and tbt.SourceSystemSK = tss.SourceSystemSK
left join Typelist.BusinessType tbi with (nolock) on src.BusinessTypeCode = tbi.BusinessTypeCode and tbi.SourceSystemSK = tss.SourceSystemSK
left join Typelist.BusinessUnit tbu with (nolock) on src.BusinessUnitCode = tbu.BusinessUnitCode and tbu.SourceSystemSK = tss.SourceSystemSK
left join Typelist.CancellationRate tca with (nolock) on src.CancellationRateCode = tca.CancellationRateCode and tca.SourceSystemSK = tss.SourceSystemSK
left join Typelist.CancellationType tct with (nolock) on src.CancellationTypeCode = tct.CancellationTypeCode and tct.SourceSystemSK = tss.SourceSystemSK
left join Typelist.CoverageTrigger ttr with (nolock) on src.CoverageTriggerCode = ttr.CoverageTriggerCode and ttr.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Department tde with (nolock) on src.DepartmentCode = tde.DepartmentCode and tde.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Country tdc with (nolock) on src.DomicileCountryCode = tdc.CountryCode and tdc.SourceSystemSK = tss.SourceSystemSK
left join Typelist.State tds with (nolock) on src.DomicileStateCode = tds.StateCode and tds.SourceSystemSK = tss.SourceSystemSK
left join Typelist.State tgs with (nolock) on src.GoverningStateCode = tgs.StateCode and tgs.SourceSystemSK = tss.SourceSystemSK
left join Typelist.LeadExcessQuota tle with (nolock) on src.LeadExcessQuotaCode = tle.LeadExcessQuotaCode and tle.SourceSystemSK = tss.SourceSystemSK
left join Typelist.NorthAmericanIndustryClassification tna with (nolock) on src.NorthAmericanIndustryClassificationCode = tna.NorthAmericanIndustryClassificationCode and tna.SourceSystemSK = tss.SourceSystemSK
left join Typelist.PayPlan tpp with (nolock) on src.PayPlanCode = tpp.PayPlanCode and tpp.SourceSystemSK = tss.SourceSystemSK
left join Typelist.PolicyStatus tps with (nolock) on src.PolicyStatusCode = tps.PolicyStatusCode and tps.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Profession tpf with (nolock) on src.ProfessionCode = tpf.ProfessionCode and tpf.SourceSystemSK = tss.SourceSystemSK
left join Typelist.ProjectType tpj with (nolock) on src.ProjectTypeCode = tpj.ProjectTypeCode and tpj.SourceSystemSK = tss.SourceSystemSK
left join Typelist.StandardIndustryCode tsi with (nolock) on src.StandardIndustryCode = tsi.StandardIndustryCode and tsi.SourceSystemSK = tss.SourceSystemSK
left join Typelist.UnderwritingStatus tus with (nolock) on src.UnderwritingStatusCode = tus.UnderwritingStatusCode and tus.SourceSystemSK = tss.SourceSystemSK
left join Typelist.DirectAssumed tda with (nolock) on src.DirectAssumedCode = tda.DirectAssumedCode and tda.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Currency tcb with (nolock) on src.BaseCurrencyCode = tcb.CurrencyCode and tcb.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Currency tco with (nolock) on src.OriginalCurrencyCode = tco.CurrencyCode and tco.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Currency tcr with (nolock) on src.ReportingCurrencyCode = tcr.CurrencyCode and tcr.SourceSystemSK = tss.SourceSystemSK
left join Typelist.Product trd with (nolock) on src.ProductCode = trd.ProductCode and trd.SourceSystemSK = tss.SourceSystemSK
left join Typelist.ClassCode tcc with (nolock) on src.GovernClassCode = tcc.ClassCode and tcc.SourceSystemSK = tss.SourceSystemSK
left join Typelist.AnnualStatementLineofBusiness tas with (nolock) on src.AnnualStatementLineofBusinessCode = tas.AnnualStatementLineofBusinessCode and tas.SourceSystemSK = tss.SourceSystemSK
/*base table lookups*/
left join Party.Agency agy with (nolock) on src.AgencySourceCode = agy.SourceCode and agy.SourceSystemSK = tss.SourceSystemSK
left join Party.Account acc with (nolock) on src.AccountSourceCode = acc.SourceCode and acc.SourceSystemSK = tss.SourceSystemSK
left join Party.Insured ins with (nolock) on src.InsuredSourceCode = ins.SourceCode and ins.SourceSystemSK = tss.SourceSystemSK
left join Party.WritingCompany wco with (nolock) on src.WritingCompanySourceCode = wco.SourceCode and wco.SourceSystemSK = tss.SourceSystemSK
left join Policy.Program prg with (nolock) on src.ProgramSourceCode = prg.SourceCode and prg.SourceSystemSK = tss.SourceSystemSK
) a
GO
