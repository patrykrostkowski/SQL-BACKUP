USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCaseDetail]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create     View [StgClaim].[SrcCaseDetail]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
select hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,cdl.CaseDetailSourceCode AS SourceCode
	,cdl.ClaimantSourceCode
	,ltn.LitigationSourceCode
	,cdl.CaseNum 
		,cdl.CaseName 
		,cdl.DocketNum 
		,cdl.CaseTypeCode 
		,convert(DATETIME, cdl.OpenDate, 127) AS OpenDate
		,convert(DATETIME, cdl.ReceiveDate, 127) AS ReceiveDate
		,convert(DATETIME, cdl.RequestDate, 127) AS RequestDate  
		,convert(DATETIME, cdl.ClosedDate, 127) AS ClosedDate 
		,convert(DATETIME, cdl.NoticeDate, 127) AS NoticeDate 
		,cdl.IsCaseInsuredInd 
		,cdl.CaseInsurer 
		,1 as IsLitigationInd 
		,cdl.CaseStatusCode 
		,cdl.CaseAmt 
		,line.IsValidInd


	FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
		Litigation NVARCHAR(max) AS JSON
		) clm
		CROSS APPLY OPENJSON(clm.Litigation) WITH (
		LitigationSourceCode NVARCHAR(max)
		,CaseDetail NVARCHAR(max) AS JSON
		) ltn
		CROSS APPLY OPENJSON(ltn.CaseDetail) WITH (
		ClaimantSourceCode NVARCHAR(max)
		,CaseDetailSourceCode NVARCHAR(max)
		,CaseNum NVARCHAR(max)
		,CaseName NVARCHAR(max)
		,DocketNum NVARCHAR(max)
		,CaseTypeCode NVARCHAR(max)
		,OpenDate NVARCHAR(max)
		,ReceiveDate NVARCHAR(max)
		,RequestDate NVARCHAR(max)
		,ClosedDate NVARCHAR(max)
		,NoticeDate NVARCHAR(max)
		,IsCaseInsuredInd INT
		,CaseInsurer NVARCHAR(max)
		,IsLitigationInd INT
		,CaseStatusCode NVARCHAR(max)
		,CaseAmt NVARCHAR(max)
		) cdl
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
