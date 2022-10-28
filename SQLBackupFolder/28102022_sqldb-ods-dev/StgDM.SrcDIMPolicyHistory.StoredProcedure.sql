USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcDIMPolicyHistory]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    PROC [StgDM].[SrcDIMPolicyHistory] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = CAST(@CutOffDateFrom AS DATETIME)

;WITH cte_LineofBussinessSK (LineofBusinessCode, PolicySK)
AS (
--for feature reference, solution for possible data problem - e2e 5,6,7
--SELECT c.LineofBusinessCode 
--	,c.PolicySK
--FROM (
--	SELECT ROW_NUMBER() OVER (
--			PARTITION BY PolicySK ORDER BY PolicySK ASC
--			) AS rn1
--		,CASE 
--			WHEN NextRn IS NULL
--				AND PreviousRn IS NULL
--				THEN LineofBusinessCode
--			ELSE 'Not applicable'
--			END AS LineofBusinessCode
--		,PolicySK
--	FROM (
--		SELECT LineofBusinessCode
--			,PolicySK
--			,lead(rn) OVER (
--				PARTITION BY PolicySK ORDER BY PolicySK ASC
--				) AS NextRn
--			,lag(rn) OVER (
--				PARTITION BY PolicySK ORDER BY PolicySK ASC
--				) AS PreviousRn
--		FROM (
--			SELECT ROW_NUMBER() OVER (
--					PARTITION BY pol.PolicySK ORDER BY pol.PolicySK ASC
--					) AS rn
--				,tlb.LineofBusinessCode AS LineofBusinessCode
--				,pol.PolicySK
--			FROM Policy.Policy pol
--			JOIN Policy.PolicyTrans plt ON pol.PolicySK = plt.PolicySK
--			JOIN Policy.PolicyLineofBusiness plb ON plb.PolicyTransSK = plt.PolicyTransSK
--			LEFT JOIN Typelist.LineofBusiness tlb ON plb.LineofBusinessSK = tlb.LineofBusinessSK
--			GROUP BY plb.LineofBusinessSK
--				,tlb.LineofBusinessCode
--				,pol.PolicySK
--			) a
--		) b
--	) c
--WHERE c.rn1 = 1
		SELECT 
		IIF(COUNT(DISTINCT tlb.LineofBusinessCode) = 1, MAX(tlb.LineofBusinessCode), 'Not applicable') as LineofBusinessCode
		,pol.PolicySK
	FROM Policy.Policy pol
	JOIN Policy.PolicyTrans plt ON pol.PolicySK = plt.PolicySK
	JOIN Policy.PolicyLineofBusiness plb ON plb.PolicyTransSK = plt.PolicyTransSK
	LEFT JOIN Typelist.LineofBusiness tlb ON plb.LineofBusinessSK = tlb.LineofBusinessSK
	GROUP BY   pol.PolicySK
	)
,cte_NewRenewal
AS (
	SELECT * FROM (
		SELECT pol.PolicySK, 
		case when ctt.DestTransType = 'NBIS' then 'N' 
			when ctt.DestTransType = 'RENW' then 'R'
			else 'N/A' end as NewRenewalCKCode,
		tss.SourceSystemCode,
		pol.SourceCode,
		ROW_NUMBER() over (partition by tss.SourceSystemCode, pol.SourceCode order by pol.ProcessDateTime asc) as rn
		FROM Policy.Policy pol
		JOIN Policy.PolicyTrans ptr ON pol.PolicySK = ptr.PolicySK
		JOIN Typelist.SourceSystem tss ON tss.SourceSystemSK = pol.SourceSystemSK
		LEFT JOIN Typelist.PolicyTransType tpp ON tpp.PolicyTransTypeSK = ptr.PolicyTransTypeSK
		LEFT JOIN Config.TransTypeConfig ctt on ctt.SourceSystemCode = tss.SourceSystemCode and ctt.SourceTransType = tpp.PolicyTransTypeCode
	) a where rn = 1
)
,cte_LastCancellation
AS (
	select pol.PolicySK, MAX(ptr.ProcessDateTime) AS ProcessedDateTime 
	FROM Policy.Policy pol
	JOIN Policy.PolicyTrans ptr ON pol.PolicySK = ptr.PolicySK
	JOIN Typelist.SourceSystem tss ON tss.SourceSystemSK = pol.SourceSystemSK
	LEFT JOIN Typelist.PolicyTransType tpp ON tpp.PolicyTransTypeSK = ptr.PolicyTransTypeSK
	LEFT JOIN Config.TransTypeConfig ctt on ctt.SourceSystemCode = tss.SourceSystemCode and ctt.SourceTransType = tpp.PolicyTransTypeCode
	where ctt.DestTransType = 'CANC'
	group by pol.policysk
)
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime ASC
			) AS rn
	FROM (
		SELECT
			tss.SourceSystemCode as SourceSystemCode
			,pol.PolicySK
			,'INSURTYP' AS ProductCategoryLevelLOB
			,'ASLOB' AS ProductCategoryLevelASLOB
			,pol.SourceCode as SourceCode
			,TRY_CONVERT(DATETIME, '1900-01-01') as HistoricalSnapshotEffectiveFromDtm	
			,TRY_CONVERT(DATETIME, '3000-01-01') as HistoricalSnapshotEffectiveToDtm		
			,pol.PolicyNum as PolicyNbr
			,pol.ProcessDateTime AS ProcessDateTime
			,pol.LegacyPolicyNum as LegacyPolicyNbr
			,pol.EffectiveDate as PolicyEffectiveDate

			,TRY_CAST(ISNULL(pol.TermNum,1) AS varchar(25)) as PolicyTermID

			,pls.PolicyStatusCode as PolicyLifecycleStatusCode
			,pol.EffectiveDate as PolicyTermEffectiveDate
			,pol.ExpirationDate as PolicyTermExpirationDate
			,pol.CancellationDate as PolicyTermCancellationDate				--CancellationDate field name will change to PolicyTermCancellationDate in ODS.
			,clc.ProcessedDateTime as PolicyTermCancellationEnteredDate			
				,null as PolicyChangeID											  
				,null as PolicyChangeTypeCK									  
				,null as PolicyChangeVersionID									  
				,null as PolicyChangeEffectiveDtm								  
				,null as PolicyRenewalDate										  
			,alb.AnnualStatementLineofBusinessCode as AnnualStatementLOBCode	
			,clob.LineofBusinessCode as LOBCode
			,age.SourceCode as AgencySKCode
				,null as AuditFreqencyCK
				,null as BillingTypeCK
				,null as BillingStatusCK
				,null as BillingStatusDate
				,null as BusinessUnitSK
			,tda.DirectAssumedCode as CoverageAcquisitionTypeCode
			,'R' as CoverageDispositionTypeCode
				,null as DepositPremiumAmt
				,null as DeferredBillingInd
				,null as DirectBillingInd
				,null as ExperienceModificationTypeCK
				,null as ExperienceModificationDate
				,null as FinalAuditInd
				,null as GoverningExposureClassCode
			,tps.StateCode as GoverningJurisdictionCode
			,'STATE' as GoverningJurisdictionType
			,pwc.SourceCode as WritingCompanyCode
				,null as InstallmentPaymentInd
			,cnr.NewRenewalCKCode				--,null as NewRenewalCK
				,null as NonRenewalReasonCK
			,tpp.PayPlanCode as PaymentScheduleTypeCKCode
				,null as PaymentsCnt
			,tpp.PayPlanCode as PayPlanCKCode
				,null as PolicyAuditDate
				,null as PolicyClaimTypeCK
				,null as PolicyRegulatoryJurisdictionSK
			,ins.SourceCode as PrimaryInsuredCode
			,'samplebranch1' as ProducingBranchSKCode
				,null as ProgramSK				--,prg.SourceCode as ProgramCode
				,null as QuoteDesc
				,null as RateModeCK
				,null as RatingPlanCK
				,null as RetroPolicyInd
		FROM Policy.Policy pol
		LEFT JOIN Typelist.SourceSystem tss ON tss.SourceSystemSK = pol.SourceSystemSK
		left JOIN Typelist.PolicyStatus pls ON pls.PolicyStatusSK = pol.PolicyStatusSK
		left JOIN Typelist.AnnualStatementLineofBusiness alb ON alb.AnnualStatementLineofBusinessSK = pol.AnnualStatementLineofBusinessSK
		left JOIN Party.WritingCompany pwc ON pwc.WritingCompanySK = pol.WritingCompanySK
		left JOIN cte_LineofBussinessSK clob ON clob.PolicySK = pol.PolicySK
		left JOIN Party.Insured ins ON ins.InsuredSK = pol.InsuredSK
		left JOIN Typelist.State tps ON tps.StateSK = pol.GoverningStateSK
		left join Typelist.PayPlan tpp on tpp.PayPlanSK = pol.PayPlanSK
		left join cte_NewRenewal cnr on cnr.PolicySK = pol.PolicySK
		left join cte_LastCancellation clc on clc.PolicySK = pol.PolicySK
		left join Typelist.DirectAssumed tda on tda.DirectAssumedSK = pol.DirectAssumedSK
		left join Party.Agency age on pol.AgencySK = age.AgencySK
		WHERE pol.ETLUpdateDateTime > @DateFrom

	) tmp
) tpl
--WHERE tpl.rn = 1

GO
