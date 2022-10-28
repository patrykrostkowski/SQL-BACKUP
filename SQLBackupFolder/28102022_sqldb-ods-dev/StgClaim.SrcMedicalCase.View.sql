USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcMedicalCase]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    View [StgClaim].[SrcMedicalCase]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
select hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,mlc.MedicalCaseSourceCode AS SourceCode
	,cmt.ClaimantSourceCode
	,mlc.CaseNum 
		,mlc.CaseDesc 
		,convert(DATETIME, mlc.LossOccurrenceDate, 127) AS LossOccurrenceDate
		,convert(DATETIME, mlc.OpenDate, 127) AS OpenDate
		,convert(DATETIME, mlc.CloseDate, 127) AS CloseDate
		,mlc.IsPreExistingConditionInd 
		,mlc.StatusCode 
		,mlc.StatusDesc 
		,mlc.IndemnitySavingsAmt 
		,mlc.MedicalSavingsAmt 
		,mlc.OtherSavingsAmt 
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
		ClaimantSourceCode NVARCHAR(max)
		,MedicalCase NVARCHAR(max) AS JSON
		) cmt
		CROSS APPLY OPENJSON(cmt.MedicalCase) WITH (
		MedicalCaseSourceCode NVARCHAR(max)
		,CaseNum NVARCHAR(max)
		,CaseDesc NVARCHAR(max)
		,LossOccurrenceDate NVARCHAR(max)
		,OpenDate NVARCHAR(max)
		,CloseDate NVARCHAR(max)
		,IsPreExistingConditionInd INT
		,StatusCode NVARCHAR(max)
		,StatusDesc NVARCHAR(max)
		,IndemnitySavingsAmt NVARCHAR(max)
		,MedicalSavingsAmt NVARCHAR(max)
		,OtherSavingsAmt NVARCHAR(max)
		) mlc
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
