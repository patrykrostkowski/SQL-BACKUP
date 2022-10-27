USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimInjuryDiagnosis]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     View [StgClaim].[SrcClaimInjuryDiagnosis]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,cid.ClaimInjuryDiagnosisSourceCode AS SourceCode
	,lei.LossEventInjurySourceCode
	,convert(DATETIME, cid.StartDate, 127) AS StartDate
	,convert(DATETIME, cid.EndDate, 127) AS EndDate
	,cid.IsCompensableInd
	,cid.IsPrimaryInd
	,cid.CommentTxt
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (				
		LossEvent NVARCHAR(max) AS JSON
		) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
		LossEventInjury NVARCHAR(MAX) AS JSON
		) loe
CROSS APPLY OPENJSON(loe.LossEventInjury) WITH (
		LossEventInjurySourceCode NVARCHAR(MAX)
		,ClaimInjuryDiagnosis NVARCHAR(MAX) AS JSON
		) lei
CROSS APPLY OPENJSON(lei.ClaimInjuryDiagnosis) WITH (
		ClaimInjuryDiagnosisSourceCode NVARCHAR(MAX)
		,StartDate NVARCHAR(MAX)
		,EndDate NVARCHAR(MAX)
		,IsCompensableInd NVARCHAR(MAX)
		,IsPrimaryInd NVARCHAR(MAX)
		,CommentTxt NVARCHAR(MAX)
		) cid
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
