USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimant]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE      VIEW [StgClaim].[SrcClaimant]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,cmt.ClaimantSourceCode AS SourceCode
	,cmt.ClaimantNum
	,convert(DATETIME, cmt.FirstAbsentDate, 127) AS FirstAbsentDate
	,convert(DATETIME, cmt.FirstLostDate, 127) AS FirstLostDate
	,convert(DATETIME, cmt.LastWorkedDate, 127) AS LastWorkedDate
	,convert(DATETIME, cmt.NoticeDate, 127) AS NoticeDate
	,convert(DATETIME, cmt.ReceivedDate, 127) AS ReceivedDate
	,convert(DATETIME, cmt.ReportedDate, 127) AS ReportedDate
	,cmt.LostDaysNum
	,cmt.DiagnosisCode
	,cmt.InjuryCode
	,cmt.ItemTypeCode
	,cmt.ManagedCareOrganizationCode
	,cmt.NCCIClassCode
	,cmt.NCCIInjuryCode
	,cmt.NCCITypeCode
	,cmt.OccupationCode
	,cmt.OSHAInjuryCode
	,cmt.OSHASeverityCode
	,cmt.PartOfBodyCode
	,cmt.RehabilitationCode
	,cmt.VehicleDamageCode
	,cmt.VehicleTypeCode
	,cmt.ViolationCode
	,cmt.VehicleStateCode
	,cmt.AccidentDesc
	,cmt.AverageWeeklyWageAmt
	,cmt.BenefitAmt
	,cmt.CompensationAmt
	,cmt.COLAAmt
	,cmt.DependentAmt
	,cmt.VehicleDamageAmt
	,cmt.IsSafetyEquipProvidedInd
	,cmt.ReasonDesc
	,cmt.ViolationDesc
	,cmt.ClaimantLegalFeesAmt
	,cmt.OSHARecordableInd
	,cmt.NYBoardCaseNum
	,cmt.IsPreventableAccidentInd
	,convert(DATETIME, cmt.ClaimantContactedDate, 127) AS ClaimantContactedDate
	,cmt.NegligencePct
	,cmt.PropertyDamageDesc
	,cmt.SituationDesc
	,cmt.PolicyTypeDesc
	,cmt.RehabilitationDesc
	,convert(DATETIME, cmt.DeathDate, 127) AS DeathDate
	,cmt.VehicleMake
	,cmt.IsPaidInFullForDateOfInjuryInd
	,cmt.IsVehicleTotalLossInd
	,convert(DATETIME, cmt.AttyDisclosureDate, 127) AS AttyDisclosureDate
	,cmt.VehicleYear
	,cmt.OccupationDesc
	,cmt.IsMedicareBeneficiaryInd
	,convert(DATETIME, cmt.ReopenedDate, 127) AS ReopenedDate
	,cmt.OSHAInjuryDesc
	,cmt.OSHASeverityDesc
	,cmt.PartOfBodyDesc
	,cmt.IsPreExistingConditionInd
	,cmt.VehicleDamageDesc
	,cmt.IsClaimantTicketedInd
	,cmt.PropertyDamageCode
	,cmt.IsSuitFiledInd
	,cmt.SituationCode
	,cmt.ReasonCode
	,cmt.IsClaimantTowedInd
	,cmt.IsInjuredOnPremisesInd
	,cmt.IsLumpSumInd
	,cmt.VehicleModel
	,cmt.DiagnosisDesc
	,cmt.IsPreExistingDisabilityInd
	,cmt.EmployerLegalFeesAmt
	,convert(DATETIME, cmt.ReleaseDate, 127) AS ReleaseDate
	,cmt.IsDriverInsuredVehicleInd
	,cmt.SettlementTypeCode
	,cmt.SalvageSubrogationCode
	,cmt.VehicleIdentificationNum
	,cmt.LossTypeCode
	,cmt.PhysicalRestrictionsCode
	,cmt.IsSafetyEquipUsedInd
	,cmt.PolicyFormName
	,cmt.SettlementAmt
	,cmt.ImpairmentPct
	,cmt.VehicleTagNum
	,cmt.MedicalApportionmentPct
	,cmt.IsReturnedToWorkInd
	,cmt.ClaimantTypeCode
	,cmt.IsMedicalOnlyInd
	,cmt.VehicleTypeDesc
	,cmt.FraudulentClaimCode
	,cmt.InjuryDesc
	,cmt.IsMedcaseManagedInd
	,cmt.IsRepresentedByAttorneyInd
	,cmt.PrimaryDiagnosisCode
	,cmt.IsSurgeryRequiredInd
	,cmt.CoverageTypeDesc
	,clm.ClaimSourceCode
	,clm.ClaimCurrencyCode AS CurrencyCode
	,pio.PartyInfoSourceCode
	,cmt.IsSecondInjuryFundInd
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
		ClaimSourceCode NVARCHAR(max)
		,ClaimCurrencyCode NVARCHAR(max)
		,Claimant NVARCHAR(max) AS JSON
		) clm
CROSS APPLY OPENJSON(clm.Claimant) WITH (
		ClaimantSourceCode NVARCHAR(max)
		,VehicleStateCode NVARCHAR(max)
		,ClaimantNum NVARCHAR(max)
		,FirstAbsentDate NVARCHAR(max)
		,FirstLostDate NVARCHAR(max)
		,LastWorkedDate NVARCHAR(max)
		,NoticeDate NVARCHAR(max)
		,ReceivedDate NVARCHAR(max)
		,ReportedDate NVARCHAR(max)
		,LostDaysNum INT
		,DiagnosisCode NVARCHAR(max)
		,InjuryCode NVARCHAR(max)
		,ItemTypeCode NVARCHAR(max)
		,ManagedCareOrganizationCode NVARCHAR(max)
		,NCCIClassCode NVARCHAR(max)
		,NCCIInjuryCode NVARCHAR(max)
		,NCCITypeCode NVARCHAR(max)
		,OccupationCode NVARCHAR(max)
		,OSHAInjuryCode NVARCHAR(max)
		,OSHASeverityCode NVARCHAR(max)
		,PartOfBodyCode NVARCHAR(max)
		,RehabilitationCode NVARCHAR(max)
		,VehicleDamageCode NVARCHAR(max)
		,VehicleTypeCode NVARCHAR(max)
		,ViolationCode NVARCHAR(max)
		,AccidentDesc NVARCHAR(max)
		,AverageWeeklyWageAmt NVARCHAR(max)
		,BenefitAmt NVARCHAR(max)
		,CompensationAmt NVARCHAR(max)
		,COLAAmt NVARCHAR(max)
		,DependentAmt NVARCHAR(max)
		,VehicleDamageAmt NVARCHAR(max)
		,IsSafetyEquipProvidedInd INT
		,ReasonDesc NVARCHAR(max)
		,ViolationDesc NVARCHAR(max)
		,ClaimantLegalFeesAmt NVARCHAR(max)
		,OSHARecordableInd INT
		,NYBoardCaseNum NVARCHAR(max)
		,IsPreventableAccidentInd INT
		,ClaimantContactedDate NVARCHAR(max)
		,NegligencePct NVARCHAR(max)
		,PropertyDamageDesc NVARCHAR(max)
		,SituationDesc NVARCHAR(max)
		,PolicyTypeDesc NVARCHAR(max)
		,RehabilitationDesc NVARCHAR(max)
		,DeathDate NVARCHAR(max)
		,VehicleMake NVARCHAR(max)
		,IsPaidInFullForDateOfInjuryInd INT
		,IsVehicleTotalLossInd INT
		,AttyDisclosureDate NVARCHAR(max)
		,VehicleYear NVARCHAR(max)
		,OccupationDesc NVARCHAR(max)
		,IsMedicareBeneficiaryInd INT
		,ReopenedDate NVARCHAR(max)
		,OSHAInjuryDesc NVARCHAR(max)
		,OSHASeverityDesc NVARCHAR(max)
		,PartOfBodyDesc NVARCHAR(max)
		,IsPreExistingConditionInd INT
		,VehicleDamageDesc NVARCHAR(max)
		,IsClaimantTicketedInd INT
		,PropertyDamageCode NVARCHAR(max)
		,IsSuitFiledInd INT
		,SituationCode NVARCHAR(max)
		,ReasonCode NVARCHAR(max)
		,IsClaimantTowedInd INT
		,IsInjuredOnPremisesInd INT
		,IsLumpSumInd INT
		,VehicleModel NVARCHAR(max)
		,DiagnosisDesc NVARCHAR(max)
		,IsPreExistingDisabilityInd INT
		,EmployerLegalFeesAmt NVARCHAR(max)
		,ReleaseDate NVARCHAR(max)
		,IsDriverInsuredVehicleInd INT
		,SettlementTypeCode NVARCHAR(max)
		,SalvageSubrogationCode NVARCHAR(max)
		,VehicleIdentificationNum NVARCHAR(max)
		,LossTypeCode NVARCHAR(max)
		,PhysicalRestrictionsCode NVARCHAR(max)
		,IsSafetyEquipUsedInd INT
		,PolicyFormName NVARCHAR(max)
		,SettlementAmt NVARCHAR(max)
		,ImpairmentPct NVARCHAR(max)
		,VehicleTagNum NVARCHAR(max)
		,MedicalApportionmentPct NVARCHAR(max)
		,IsReturnedToWorkInd INT
		,ClaimantTypeCode NVARCHAR(max)
		,IsMedicalOnlyInd INT
		,VehicleTypeDesc NVARCHAR(max)
		,FraudulentClaimCode NVARCHAR(max)
		,InjuryDesc NVARCHAR(max)
		,IsMedcaseManagedInd INT
		,IsRepresentedByAttorneyInd INT
		,PrimaryDiagnosisCode NVARCHAR(max)
		,IsSurgeryRequiredInd INT
		,CoverageTypeDesc NVARCHAR(max)
		,IsSecondInjuryFundInd NVARCHAR(MAX)
		,PartyInfo NVARCHAR(max) AS JSON
		) cmt
CROSS APPLY OPENJSON(cmt.PartyInfo) WITH (PartyInfoSourceCode NVARCHAR(max)) pio
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
