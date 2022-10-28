USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLitigationDetail]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     View [StgClaim].[SrcLitigationDetail]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT hdr.SourceSystemCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,lid.LitigationDetailSourceCode AS SourceCode
	,lit.LitigationSourceCode
	,convert(DATETIME, lid.OpenDate, 127) AS OpenDate
	,convert(DATETIME, lid.ServedDate, 127) AS ServedDate
	,convert(DATETIME, lid.ReceivedDate, 127) AS ReceivedDate
	,lid.CityName
	,lid.CountyName
	,lid.PostalCode
	,lid.LitigationStatusCode
	,lid.IsTrialInd
	,convert(DATETIME, lid.TrialDate, 127) AS TrialDate
	,convert(DATETIME, lid.CloseDate, 127) AS CloseDate
	,lid.FirstPartyLiabilityPct
	,lid.ThirdPartyfLiabilityPct
	,lid.PermanentDisabilityPct
	,lid.LitigationSuitAmt
	,lid.EstimatedExpenseAmt
	,lid.EstimatedBodilyInjuryAmt
	,lid.EstimatedOtherAmt
	,lid.DeductibleAmt
	,lid.EstimatedAttorneyHighAmt
	,lid.EstimatedAttorneyLowAmt
	,lid.EstmatedVerdictRangeHighAmt
	,lid.EstimatedVerdictRangeLowAmt
	,lid.IsEvaluationSentInd
	,lid.IsInsurerNotifiedInd
	,lid.IsExcessInsurerNotifiedInd
	,convert(DATETIME, lid.ReferralDate, 127) AS ReferralDate
	,lid.IsDiscoveryCompleteInd					    
	,convert(DATETIME, lid.PreTrialConferenceDate, 127) AS PreTrialConferenceDate
	,convert(DATETIME, lid.ArbitrationDate, 127) AS ArbitrationDate
	,lid.ArbitratorNum							    
	,convert(DATETIME, lid.MediationDate, 127) AS MediationDate
	,lid.MediatorNum							    
	,convert(DATETIME, lid.StatuteOfLimitationsDate, 127) AS StatuteOfLimitationsDate
	,lid.CourtNum
	,lid.DocketNum
	,lid.JudgeNum
	,convert(DATETIME, lid.VerdictDate, 127) AS VerdictDate
	,lid.VerdictCode
	,lid.VerdictAmt
	,lid.IsAppealedInd
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
		,LitigationDetail NVARCHAR(MAX) AS JSON
		) lit
CROSS APPLY OPENJSON(lit.LitigationDetail) WITH (
		LitigationDetailSourceCode NVARCHAR(MAX)
		,OpenDate NVARCHAR(MAX)
		,ServedDate NVARCHAR(MAX)
		,ReceivedDate NVARCHAR(MAX)
		,CityName NVARCHAR(MAX)
		,CountyName NVARCHAR(MAX)
		,PostalCode NVARCHAR(MAX)
		,LitigationStatusCode NVARCHAR(MAX)
		,IsTrialInd NVARCHAR(MAX)
		,TrialDate NVARCHAR(MAX)
		,CloseDate NVARCHAR(MAX)
		,FirstPartyLiabilityPct NVARCHAR(MAX)
		,ThirdPartyfLiabilityPct NVARCHAR(MAX)
		,PermanentDisabilityPct NVARCHAR(MAX)
		,LitigationSuitAmt NVARCHAR(MAX)
		,EstimatedExpenseAmt NVARCHAR(MAX)
		,EstimatedBodilyInjuryAmt NVARCHAR(MAX)
		,EstimatedOtherAmt NVARCHAR(MAX)
		,DeductibleAmt NVARCHAR(MAX)
		,EstimatedAttorneyHighAmt NVARCHAR(MAX)
		,EstimatedAttorneyLowAmt NVARCHAR(MAX)
		,EstmatedVerdictRangeHighAmt NVARCHAR(MAX)
		,EstimatedVerdictRangeLowAmt NVARCHAR(MAX)
		,IsEvaluationSentInd NVARCHAR(MAX)
		,IsInsurerNotifiedInd NVARCHAR(MAX)
		,IsExcessInsurerNotifiedInd NVARCHAR(MAX)
		,ReferralDate NVARCHAR(MAX)
		,IsDiscoveryCompleteInd NVARCHAR(MAX)
		,PreTrialConferenceDate NVARCHAR(MAX)
		,ArbitrationDate NVARCHAR(MAX)
		,ArbitratorNum NVARCHAR(MAX)
		,MediationDate NVARCHAR(MAX)
		,MediatorNum NVARCHAR(MAX)
		,StatuteOfLimitationsDate NVARCHAR(MAX)
		,CourtNum NVARCHAR(MAX)
		,DocketNum NVARCHAR(MAX)
		,JudgeNum NVARCHAR(MAX)
		,VerdictDate NVARCHAR(MAX)
		,VerdictCode NVARCHAR(MAX)
		,VerdictAmt NVARCHAR(MAX)
		,IsAppealedInd NVARCHAR(MAX)	
		) lid
			) AS tmp
		) AS tpl
	where tpl.rn = 1
GO
