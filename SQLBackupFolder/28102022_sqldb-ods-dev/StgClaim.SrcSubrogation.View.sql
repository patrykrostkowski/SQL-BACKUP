USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcSubrogation]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    View [StgClaim].[SrcSubrogation]
AS
SELECT * FROM (SELECT *,
ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
FROM(
SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,sub.SubrogationSourceCode AS SourceCode
	,clm.ClaimSourceCode
	,sub.ClaimantSourceCode
	,sub.SubrogationNum
	,sub.SubrogationTypeCode
	,sub.CaseName
	,sub.SubrogationStatusCode
	,sub.SubrogationClosedOutcomeCode
	,convert(DATETIME, sub.OpenDate, 127) AS OpenDate
	,convert(DATETIME, sub.NoticeDate, 127) AS NoticeDate
	,convert(DATETIME, sub.ReceiveDate, 127) AS ReceiveDate
	,convert(DATETIME, sub.RequestDate, 127) AS RequestDate
	,convert(DATETIME, sub.ClosedDate, 127) AS ClosedDate
	,CASE WHEN sub.LitigationNum is null
			THEN 0 
		ELSE 1 end AS IsLitigationInd 
	,sub.LitigationSourceCode
	,sub.IsExternalOwnedInd
	,sub.IsEscalateSubrogationInd
	,sub.SubrogationCloseCommentTxt
	,sub.SubrogationReferralCommentTxt
	,sub.SubrogationAmt
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (		
		ClaimSourceCode NVARCHAR(MAX)
		,Subrogation NVARCHAR(max) AS JSON
		) clm
CROSS APPLY OPENJSON(clm.Subrogation) WITH (
		SubrogationSourceCode NVARCHAR(MAX)
		,ClaimantSourceCode NVARCHAR(MAX)
		,SubrogationNum NVARCHAR(MAX)
		,SubrogationTypeCode NVARCHAR(MAX)
		,CaseName NVARCHAR(MAX)
		,SubrogationStatusCode NVARCHAR(MAX)
		,SubrogationClosedOutcomeCode NVARCHAR(MAX)
		,OpenDate NVARCHAR(MAX)
		,NoticeDate NVARCHAR(MAX)
		,ReceiveDate NVARCHAR(MAX)
		,RequestDate NVARCHAR(MAX)
		,ClosedDate NVARCHAR(MAX)
		,LitigationSourceCode NVARCHAR(MAX)
		,IsExternalOwnedInd NVARCHAR(MAX)
		,IsEscalateSubrogationInd NVARCHAR(MAX)
		,SubrogationCloseCommentTxt NVARCHAR(MAX)
		,SubrogationReferralCommentTxt NVARCHAR(MAX)
		,SubrogationAmt NVARCHAR(MAX)
		,IsLitigationInd NVARCHAR(MAX)
		,LitigationNum NVARCHAR(MAX)
		) sub
		)tpl
		)tmp
		where rn = 1
GO
