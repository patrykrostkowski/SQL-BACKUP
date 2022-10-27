USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimClaimPolicy]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE      PROCEDURE [StgADM].[SrcDimClaimPolicy] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)


;WITH cte_PolicyTransMaxTransStartDatetime
AS (
--"Join ClaimPolicy cp, PolicyTrans pt, RatingPlan rp, RatingPlanFactor rpf, FactorType ft
--Where cp.PolicyNum = pt.PolicyNum
--And Max(pt.TransStartDatetime)
--And pt.PolicySK = rp.PolicySK
--And rp.RatingPlanSK = rpf.PolicyRatingPlanSK
--And rfp.FactorTypeSK = ft.FactorTypeSK
--And ft.FactorTypeCode = 'ExperienceFactor'"-
SELECT * FROM (
		SELECT 
		ROW_NUMBER() over (partition by ptr.PolicyNum, ptr.SourceSystemSK order by ptr.TransStartDatetime desc) as rn
		,ptr.PolicyNum
		,ptr.TransStartDatetime
		,rpf.FactorValue
		FROM Claim.ClaimPolicy clp
		JOIN Policy.PolicyTrans ptr ON clp.PolicyNum = ptr.PolicyNum
		JOIN Policy.RatingPlan rp ON ptr.PolicySK = rp.PolicySK
		JOIN Policy.RatingPlanFactor rpf ON rp.RatingPlanSK = rpf.PolicyRatingPlanSK
		left JOIN Typelist.FactorType ftt ON rpf.FactorTypeSK = ftt.FactorTypeSK AND  ftt.FactorTypeCode = 'ExperienceFactor'

	) a where rn = 1
), 
cte_PolicyTransMinTransStartDatetime
AS(
--Join ClaimPolicy cp, PolicyTrans pt, RatingPlan rp, RatingPlanFactor rpf, FactorType ft
--Where cp.PolicyNum = pt.PolicyNum
--And Min(pt.TransStartDatetime)
--And pt.PolicySK = rp.PolicySK
--And rp.RatingPlanSK = rpf.PolicyRatingPlanSK
--And rfp.FactorTypeSK = ft.FactorTypeSK
--And ft.FactorTypeCode = 'ExperienceFactor'

SELECT * FROM (
		SELECT 
		ROW_NUMBER() over (partition by ptr.PolicyNum, ptr.SourceSystemSK order by ptr.TransStartDatetime asc) as rn
		,ptr.PolicyNum
		,ptr.TransStartDatetime
		,rpf.FactorValue
		FROM Claim.ClaimPolicy clp
		JOIN Policy.PolicyTrans ptr ON clp.PolicyNum = ptr.PolicyNum
		JOIN Policy.RatingPlan rp ON ptr.PolicySK = rp.PolicySK
		JOIN Policy.RatingPlanFactor rpf ON rp.RatingPlanSK = rpf.PolicyRatingPlanSK
		left JOIN Typelist.FactorType ftt ON rpf.FactorTypeSK = ftt.FactorTypeSK AND  ftt.FactorTypeCode = 'ExperienceFactor'
	) a where rn = 1
)

SELECT 	  
      src.SourceSystemCode
	  ,pss.SourceSystemCode AS PolicySourceSystem
	  --,SourceCode
      ,clm.ClaimNum AS ClaimId
      ,clp.PolicyNum AS PolicyNbr
      ,clp.PolicyNum --need to Join DIMPolicyHistory where PolicyNum = PolicyNumber to get PolicyTermId, PolicyTermEffectiveDate, PolicyTermExpirationDate
      ,agn.AgencyNum --neet to JOIN DimAgencyHistory whereAgencyCode=AgencyNum AND effectiveDate between HistoricalSnapshotFromDtm and HistoricalSnapshotToDtm to get AgencyHistorySk 
	  ,convert(DATETIME, clp.EffectiveDate, 127) AS EffectiveDate --
      ,cvt.CoverageTriggerCode --need to  lookup ClaimFilingTypeCK in DimClaimFilingType
      ,clp.ReportingDate AS CoverageYear
      ,wrc.WritingCompanyCode--Select WritingCompanyHistorySK From DIMWritingCompanyHistory Where WritingCompanyCode = b.WritingCompanyCode And a.EffectiveDate between (HistoricalSnapshotEffectiveFromDtm and HistoricalSnapshotEffectiveToDtm)
      ,null AS NewRenewalBusinessTypeCk --depends on client? - no etl
      ,convert(DATETIME, clm.EventDate, 127) AS EventDate --Select PolicyLifeCycleStatusCK From DIMPolicyTermChangeHistory Where PolicyNbr = clp.PolicyNum And c.EventDate between (HistoricalSnapshotFromDtm and HistoricalSnapshotToDtm); PolicyLifeCycleStatusCk
      ,CAST(ptmax.FactorValue AS DECIMAL(9,4)) AS CurrentPolicyTermExperienceModificationRatio
      ,CAST(ptmin.FactorValue AS DECIMAL(9,4)) AS PolicyTermIssuanceExperienceModificationRatio
      ,pol.AuditFrequencyCode AS AuditFrequencyAbrv
      ,ins.AccountNum AS PrimaryPolicyHolderId
      ,null AS InstantQuoteInd 
	  ,clp.TermNum AS PolicyTermId
	  ,clp.EffectiveDate AS PolicyTermEffectiveDate
	  ,clp.ExpirationDate AS PolicyTermExpirationDate
	  ,pls.PolicyStatusCode

FROM Claim.Claim clm
JOIN Claim.ClaimPolicyAssociation cpa ON clm.ClaimSK = cpa.ClaimSK
JOIN Claim.ClaimPolicy clp ON cpa.ClaimPolicySK = clp.ClaimPolicySK
JOIN Typelist.PolicyStatus pls ON clp.PolicyStatusSK = pls.PolicyStatusSK
JOIN Typelist.SourceSystem src ON pls.SourceSystemSK = src.SourceSystemSK
JOIN Policy.Policy pol ON cpa.PolicySK = pol.PolicySK
JOIN Party.Agency agn ON pol.AgencySK = agn.AgencySK
left JOIN Typelist.CoverageTrigger cvt ON clp.CoverageTriggerSK = cvt.CoverageTriggerSK
JOIN Party.WritingCompany wrc ON clp.WritingCompanySK = wrc.WritingCompanySK
left JOIN cte_PolicyTransMaxTransStartDatetime ptmax ON clp.PolicyNum = ptmax.PolicyNum
left JOIN cte_PolicyTransMinTransStartDatetime ptmin ON clp.PolicyNum = ptmin.PolicyNum
JOIN Party.Insured ins ON pol.InsuredSK = ins.InsuredSK
JOIN Typelist.SourceSystem pss ON pol.SourceSystemSK = pss.SourceSystemSK

WHERE clm.ETLUpdateDateTime > @DateFrom



GO
