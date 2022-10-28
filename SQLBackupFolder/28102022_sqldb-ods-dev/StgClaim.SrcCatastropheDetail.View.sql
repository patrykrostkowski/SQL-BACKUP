USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCatastropheDetail]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create     view [StgClaim].[SrcCatastropheDetail]
as 
select hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,cdl.CatastropheDetailSourceCode AS SourceCode
	,cte.CatastropheSourceCode 
	,cdl.LossCauseCode 
	,cdl.LossTypeCode
	,line.IsValidInd
	FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
		Catastrophe NVARCHAR(max) AS JSON
		) clm
		CROSS APPLY OPENJSON(clm.Catastrophe) WITH (
		CatastropheSourceCode NVARCHAR(max)
		,CatastropheDetail NVARCHAR(max) AS JSON
		) cte
		CROSS APPLY OPENJSON(cte.CatastropheDetail) WITH (
		CatastropheDetailSourceCode NVARCHAR(max)
		,LossCauseCode NVARCHAR(max)
		,LossTypeCode NVARCHAR(max)
		) cdl
GO
