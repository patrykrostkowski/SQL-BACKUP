USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcMedicalTreatment]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcMedicalTreatment]
AS

SELECT SourceSystemCode
	,MedicalTreatmentCode
	,MedicalTreatmentName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, MedicalTreatmentCode ORDER BY MedicalTreatmentName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,lei.MedicalTreatmentCode 
			,ISNULL(lei.MedicalTreatmentDesc, '') AS MedicalTreatmentName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventInjury NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventInjury) WITH (MedicalTreatmentCode NVARCHAR(MAX), MedicalTreatmentDesc NVARCHAR(MAX)) lei
		WHERE ISNULL(lei.MedicalTreatmentCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
