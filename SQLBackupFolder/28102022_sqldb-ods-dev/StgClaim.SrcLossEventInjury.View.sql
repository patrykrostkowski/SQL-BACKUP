USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossEventInjury]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE    VIEW [StgClaim].[SrcLossEventInjury]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT  
	 hdr.SourceSystemCode
	,lei.LossEventInjurySourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,let.LossEventSourceCode as LossEventSourceSKCode
	,lei.MedicalTreatmentCode as MedicalTreatmentSKCode
	,lei.InjuryTypeCode as InjuryTypeSKCode
	,lei.IsDisabledDueToAccidentInd
	,lei.IsLostWagesInd
	,lei.IsAmbulanceUsedInd
	,lei.BodyPartInjuryType
--	,'inzix'  AS BodyPartInjuryTypeCode
	,lei.BodyPartInjuryTypeCode
	,line.IsValidInd
	,cmt.ClaimantsourceCode
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(max)
	,ProcessDateTime NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	LossEvent NVARCHAR(max)  AS JSON
	,Claimant NVARCHAR(max) as JSON
	) clm
CROSS APPLY OPENJSON(clm.Claimant) with(
	ClaimantSourceCode nvarchar(max)
)cmt
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	LossEventSourceCode NVARCHAR(max)
	,LossEventInjury NVARCHAR(max)  AS JSON
	) let
CROSS APPLY OPENJSON(let.LossEventInjury) WITH (
	 LossEventInjurySourceCode NVARCHAR(max)
	,InjuryTypeCode NVARCHAR(max)
	,MedicalTreatmentCode NVARCHAR(max)
	,IsDisabledDueToAccidentInd NVARCHAR(max)
	,IsLostWagesInd NVARCHAR(max)
	,IsAmbulanceUsedInd NVARCHAR(max)
	,BodyPartInjuryType NVARCHAR(max)
	,BodyPartInjuryTypeCode  NVARCHAR(max)
	) lei
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
