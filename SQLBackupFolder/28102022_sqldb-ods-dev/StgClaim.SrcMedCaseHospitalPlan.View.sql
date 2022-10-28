USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcMedCaseHospitalPlan]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    View [StgClaim].[SrcMedCaseHospitalPlan]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
select hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,mlc.MedicalCaseSourceCode 
	,mdp.MedCaseHospitalPlanSourceCode AS SourceCode
	,mdp.PlanNum
      ,mdp.PlanStatusCode
      ,mdp.PlanStatusDesc
      ,convert(DATETIME, mdp.EffectiveDate, 127) AS EffectiveDate
      ,convert(DATETIME, mdp.ExpirationDate, 127) AS ExpirationDate
      ,mdp.ApprovalCode
      ,mdp.ApprovalDesc
      ,mdp.ConversionSourceCode
      ,mdp.ConversionSourceDesc
      ,convert(DATETIME, mdp.ConversionDate, 127) AS ConversionDate
      ,convert(DATETIME, mdp.AdmissionDate, 127) AS AdmissionDate
      ,convert(DATETIME, mdp.DischargeDate, 127) AS DischargeDate
      ,mdp.IsSurgeryRequiredInd
      ,mdp.ContactName
      ,mdp.MedicalProtocolCode
      ,mdp.MedicalProtocolDesc
      ,mdp.RequestedAssistantSurgeonCode
      ,mdp.ApprovedAssistantSurgeoncode
      ,mdp.RequestedPlaceOfServiceCode
      ,mdp.RequestedPlaceOfServiceDesc
      ,mdp.RequestedLengthOfStay
      ,mdp.RequestedWeeksOfTreatment
      ,mdp.RequestedTreatmentsPerWeek
      ,mdp.RequestedNumberOfTreatments
      ,convert(DATETIME, mdp.RequestedModifiedDutyReturntoWorkDate, 127) AS RequestedModifiedDutyReturntoWorkDate
      ,convert(DATETIME, mdp.RequestedFullDutyReturntoWorkDate, 127) AS RequestedFullDutyReturntoWorkDate
      ,mdp.RequestedPreOpDay
      ,mdp.ApprovedPlaceOfServiceCode
      ,mdp.ApprovedPlaceOfServiceDesc
      ,mdp.ApprovedLengthOfStay
      ,mdp.ApprovedWeeksOfTreatment
      ,mdp.ApprovedTreatmentsPerWeek
      ,mdp.ApprovedNumberOfTreatments
      ,convert(DATETIME, mdp.ApprovedModifiedDutyReturntoWorkDate, 127) AS ApprovedModifiedDutyReturntoWorkDate
      ,convert(DATETIME, mdp.ApprovedFullDutyReturntoWorkDate, 127) AS ApprovedFullDutyReturntoWorkDate
      ,mdp.ApprovedPreOpDay
      ,mdp.ApprovedByName
      ,mdp.ActualAssistantSurgeonCode
      ,mdp.ActualPlaceOfServiceCode
      ,mdp.ActualPlaceOfServiceDesc
      ,mdp.ActualLengthOfStay
      ,mdp.ActualWeeksOfTreatment
      ,mdp.ActualTreatmentsPerWeek
      ,mdp.ActualNumberOfTreatments
      ,convert(DATETIME, mdp.ActualModifiedDutyReturntoWorkDate, 127) AS ActualModifiedDutyReturntoWorkDate
      ,convert(DATETIME, mdp.ActualFullDutyReturntoWorkDate, 127) AS ActualFullDutyReturntoWorkDate
	  ,line.IsValidInd
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
		Claimant NVARCHAR(max) AS JSON
		) clm
		CROSS APPLY OPENJSON(clm.Claimant) WITH (
		MedicalCase NVARCHAR(max) AS JSON
		) cmt
		CROSS APPLY OPENJSON(cmt.MedicalCase) WITH (
		MedicalCaseSourceCode NVARCHAR(max)
		,MedCaseHospitalPlan NVARCHAR(max) AS JSON
		) mlc
		CROSS APPLY OPENJSON(mlc.MedCaseHospitalPlan) WITH (
		MedCaseHospitalPlanSourceCode NVARCHAR(max)
		,PlanNum NVARCHAR(max)
      ,PlanStatusCode NVARCHAR(max)
      ,PlanStatusDesc NVARCHAR(max)
      ,EffectiveDate NVARCHAR(max)
      ,ExpirationDate NVARCHAR(max)
      ,ApprovalCode NVARCHAR(max)
      ,ApprovalDesc NVARCHAR(max)
      ,ConversionSourceCode NVARCHAR(max)
      ,ConversionSourceDesc NVARCHAR(max)
      ,ConversionDate NVARCHAR(max)
      ,AdmissionDate NVARCHAR(max)
      ,DischargeDate NVARCHAR(max)
      ,IsSurgeryRequiredInd INT
      ,ContactName NVARCHAR(max)
      ,MedicalProtocolCode NVARCHAR(max)
      ,MedicalProtocolDesc NVARCHAR(max)
      ,RequestedAssistantSurgeonCode NVARCHAR(max)
      ,ApprovedAssistantSurgeoncode NVARCHAR(max)
      ,RequestedPlaceOfServiceCode NVARCHAR(max)
      ,RequestedPlaceOfServiceDesc NVARCHAR(max)
      ,RequestedLengthOfStay INT
      ,RequestedWeeksOfTreatment INT
      ,RequestedTreatmentsPerWeek INT
      ,RequestedNumberOfTreatments INT
      ,RequestedModifiedDutyReturntoWorkDate NVARCHAR(max)
      ,RequestedFullDutyReturntoWorkDate NVARCHAR(max)
      ,RequestedPreOpDay INT
      ,ApprovedPlaceOfServiceCode NVARCHAR(max)
      ,ApprovedPlaceOfServiceDesc NVARCHAR(max)
      ,ApprovedLengthOfStay INT
      ,ApprovedWeeksOfTreatment INT
      ,ApprovedTreatmentsPerWeek INT
      ,ApprovedNumberOfTreatments INT
      ,ApprovedModifiedDutyReturntoWorkDate NVARCHAR(max)
      ,ApprovedFullDutyReturntoWorkDate NVARCHAR(max)
      ,ApprovedPreOpDay INT
      ,ApprovedByName NVARCHAR(max)
      ,ActualAssistantSurgeonCode NVARCHAR(max)
      ,ActualPlaceOfServiceCode NVARCHAR(max)
      ,ActualPlaceOfServiceDesc NVARCHAR(max)
      ,ActualLengthOfStay INT
      ,ActualWeeksOfTreatment INT
      ,ActualTreatmentsPerWeek INT
      ,ActualNumberOfTreatments INT
      ,ActualModifiedDutyReturntoWorkDate NVARCHAR(max)
      ,ActualFullDutyReturntoWorkDate NVARCHAR(max)

		) mdp
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
