USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimClaimantInjury]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgADM].[SrcDimClaimantInjury]    @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);
 
SELECT 
    --,ClaimantInjurySK AUTO GENERATED
	--,RowCreatedBySK		  Populated in ADF
	--,RowCreatedDtm		  Populated in ADF
	--,RowLastUpdatedBySK	  Populated in ADF
	--,RowLastUpdatedDtm	  Populated in ADF
        src.SourceSystemCode AS SourceSystemCode
		,tps.SourceSystemCode AS PolicySourceSystemCode
	,cmt.SourceCode AS SourceCode
	,CAST('1900-01-01' AS DATETIME) AS RowEffectiveFromDatetime
	,CAST('3000-01-01' AS DATETIME) AS RowEffectiveToDatetime
	,cmt.PartOfBodyCode  AS InjuredBodyPartCKCode
	,cmt.PartOfBodyCode  AS InjuredBodyPartName
	,tcs.CauseofLossCode AS CauseofLossCode
	,tcs.CauseofLossCode AS InjuryCauseName
	,cid.IsPrimaryInd    AS PrimaryInjuryCodeInd
	,tit.InjuryTypeCode  AS InjuryCode
	,cmt.ClaimantNum     AS ClaimantId
	,clm.ClaimNum        AS ClaimId
	,ccp.PolicyNum       AS PolicyNum
	,ccp.SourceCode      AS ClaimPolicySourceCode
	,convert(DATETIME, ccp.EffectiveDate, 127)   AS EffectiveDate
	,convert(DATETIME, ccp.EffectiveDate, 127)  AS ExpirationDate
	,ccp.PolicyNum       AS PolicyNbr
	,tit.InjuryTypeCode  AS InjuryTypeCode
	,tit.InjuryTypeName  AS InjuryTypeName
			
FROM Claim.Claimant cmt
JOIN Typelist.SourceSystem src ON src.SourceSystemSK=cmt.SourceSystemSK
LEFT JOIN Claim.Claim clm ON clm.ClaimSK=cmt.ClaimSK
LEFT JOIN Claim.ClaimPolicyAssociation cpa ON cpa.ClaimSK=clm.ClaimSK
LEFT JOIN Policy.Policy pol ON pol.PolicySK=cpa.PolicySK
LEFT JOIN Typelist.SourceSystem tps ON pol.SourceSystemSK=tps.SourceSystemSK
LEFT JOIN Claim.ClaimPolicy ccp ON ccp.ClaimPolicySK=cpa.ClaimPolicySK
LEFT JOIN  Claim.LossEvent loe  ON  clm.ClaimSK=loe.ClaimSK
LEFT JOIN  Claim.LossEventInjury lei ON loe.LossEventSK=lei.LossEventSK 
 JOIN  Claim.ClaimInjuryDiagnosis cid ON lei.LossEventInjurySK=cid.LossEventInjurySK
LEFT JOIN Typelist.CauseofLoss tcs ON tcs.CauseofLossSK=clm.CauseofLossSK
LEFT JOIN Claim.LossEventInjury cli ON cli.ClaimantSK=cmt.ClaimantSK
LEFT JOIN Typelist.InjuryType tit ON tit.InjuryTypeSK=cli.InjuryTypeSK
--LEFT JOIN Config.SourceSystemRelationshipConfig csc ON src.SourceSystemCode=csc.ClaimSOurceSystemCode
WHERE cmt.ETLUpdateDateTime > @DateFrom

GO
