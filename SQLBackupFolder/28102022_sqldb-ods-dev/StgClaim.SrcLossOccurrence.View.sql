USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossOccurrence]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     View [StgClaim].[SrcLossOccurrence]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
select 
	hdr.SourceSystemCode
    ,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,clm.ClaimSourceCode
	,clm.ClosedOutcomeCode
	,clm.ReopenReasonCode 
	,loe.LossEventSourceCode
	,loc.LossOccurrenceSourceCode AS SourceCode
	,loc.OtherReasonDesc
	,loc.SequenceNum
	,loc.NotesTxt
	,loc.IsOtherCoverageInd
	,loc.IsContactPermittedInd
	,convert(DATETIME, loc.CloseDate, 127) AS CloseDate
	,convert(DATETIME, loc.AssignmentDate, 127) AS AssignmentDate
	,convert(DATETIME, loc.ReOpenDate, 127) AS ReOpenDate
	,loc.ClaimCoverageSourceCode
	,loc.ClaimantSourceCode
	,loc.AssignmentStatusCode
	,loc.LossOccurrenceTypeCode
	,loc.LossOccurrenceTierCode
	,loc.LossPartyTypeCode 
	,loc.ValidationLevelCode
	,loc.ClaimStrategyCode
	,loc.StateCode
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(max)
	,ProcessDateTime NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	ClaimSourceCode  NVARCHAR(max)
	,ClosedOutcomeCode  NVARCHAR(max)
	,ReopenReasonCode  NVARCHAR(max)
	,LossEvent  NVARCHAR(max) AS JSON
	) clm
    CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	    LossEventSourceCode NVARCHAR(max)
	,LossOccurrence NVARCHAR(max) AS JSON
	,LossEventProperty NVARCHAR(max) AS JSON
	) loe  
	CROSS APPLY OPENJSON(loe.LossOccurrence) WITH (
	    LossOccurrenceSourceCode NVARCHAR(max)
	,ClaimCoverageSourceCode NVARCHAR(max)
	,ClaimantSourceCode NVARCHAR(max)
	,ClaimStrategyCode NVARCHAR(max)
	,OtherReasonDesc NVARCHAR(max)
	,ReOpenDate NVARCHAR(max)
	,SequenceNum NVARCHAR(max)
	,AssignmentDate NVARCHAR(max)
	,NotesTxt NVARCHAR(max)
	,IsOtherCoverageInd NVARCHAR(max)
	,IsContactPermittedInd NVARCHAR(max)
	,CloseDate NVARCHAR(max)
	,AssignmentStatusCode  NVARCHAR(max)
	,LossOccurrenceTypeCode  NVARCHAR(max)
	,LossOccurrenceTierCode NVARCHAR(max)
	,LossPartyTypeCode  NVARCHAR(max)
	,ValidationLevelCode NVARCHAR(max)
	,StateCode NVARCHAR(max)
	,LossEventProperty  NVARCHAR(max) AS JSON
	) loc
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
