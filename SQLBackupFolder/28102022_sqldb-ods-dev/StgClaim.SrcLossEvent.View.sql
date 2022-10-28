USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossEvent]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    View [StgClaim].[SrcLossEvent]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,loe.LossEventSourceCode AS SourceCode
	,clm.ClaimSourceCode
	,loe.LossEventTypeCode
	,loe.LossEventDesc
	,loe.SeverityCode
	,les.LossEventSalvageSourceCode
	,loe.ClaimCurrencyCode
	,loe.IsSalvageOwnerRetainedInd
	,loe.IsSalvageWaivedInd
	,loe.LossEstimateAmt
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
		ClaimSourceCode NVARCHAR(max)
		,LossEvent NVARCHAR(max) AS JSON
		) clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
		LossEventTypeCode NVARCHAR(MAX) 
		,LossEventSourceCode NVARCHAR(MAX)
		,LossEventDesc NVARCHAR(MAX)
		,SeverityCode NVARCHAR(MAX)
		,LossEventSalvage NVARCHAR(MAX) AS JSON 
		,ClaimCurrencyCode NVARCHAR(MAX)
		,IsSalvageOwnerRetainedInd NVARCHAR(MAX)
		,IsSalvageWaivedInd NVARCHAR(MAX)
		,LossEstimateAmt NVARCHAR(MAX)
		) loe
OUTER APPLY OPENJSON(loe.LossEventSalvage) WITH (
		LossEventSalvageSourceCode NVARCHAR(MAX)
		) les
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
