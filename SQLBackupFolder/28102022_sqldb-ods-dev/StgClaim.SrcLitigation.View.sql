USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLitigation]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE     VIEW [StgClaim].[SrcLitigation]
AS
	
-- LitigationSourceCode from 3 levels

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT  
	hdr.SourceSystemCode
	,lgt.LitigationSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,clm.ClaimSourceCode
	,lgt.LitigationNum
	,lgt.SummonsComplaintDesc
	,lgt.LitigationStatusCode
	,lgt.CaseNum
	,lgt.CourtNum
	,lgt.CaseDesc
	,lgt.VenueDesc
	,lgt.CourtTypeCode
	,lgt.VenueRatingCode
	,lgt.AreaCode
	,lgt.ResolutionCode
	,lgt.ClaimCurrencyCode
	,try_convert(DATETIME, lgt.OpenDate, 127) AS OpenDate
	,try_convert(DATETIME, lgt.ReceivedDate, 127) AS ReceivedDate
	,try_convert(DATETIME, lgt.CloseDate, 127) AS CloseDate
	,try_convert(DATETIME, lgt.TrialArbitrationDate, 127) AS TrialArbitrationDate
	,try_convert(DATETIME, lgt.StatuteofLimitationsDate, 127) AS StatuteofLimitationsDate
	,try_convert(DATETIME, lgt.MediationDate, 127) AS MediationDate
	,lgt.TotalLitigationAmt
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(max)
	,ProcessDateTime NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	Litigation NVARCHAR(max) AS JSON
	,ClaimSourceCode NVARCHAR(max)
	) clm
CROSS APPLY OPENJSON(clm.Litigation) WITH (
	LitigationSourceCode NVARCHAR(MAX)
	,LitigationNum NVARCHAR(MAX)
	,SummonsComplaintDesc NVARCHAR(MAX)
	,LitigationStatusCode NVARCHAR(MAX)
	,CaseNum NVARCHAR(MAX)
	,CourtNum NVARCHAR(MAX)
	,CaseDesc NVARCHAR(MAX)
	,VenueDesc NVARCHAR(MAX)
	,CourtTypeCode NVARCHAR(MAX)
	,VenueRatingCode NVARCHAR(MAX)
	,AreaCode NVARCHAR(MAX)
	,ResolutionCode NVARCHAR(MAX)
	,ClaimCurrencyCode NVARCHAR(MAX)
	,OpenDate date
	,ReceivedDate date
	,CloseDate date
	,TrialArbitrationDate date
	,StatuteofLimitationsDate date
	,MediationDate date
	,TotalLitigationAmt decimal
	) lgt

UNION ALL

	SELECT  
		hdr.SourceSystemCode
		,mdt.LitigationSourceCode AS SourceCode
		,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,clm.ClaimSourceCode
		,null as LitigationNum
		,null as SummonsComplaintDesc
		,clm.LitigationStatusCode
		,null as CaseNum
		,null as CourtNum
		,null as CaseDesc
		,null as VenueDesc
		,null as CourtTypeCode
		,null as VenueRatingCode
		,null as AreaCode
		,null as ResolutionCode
		,clm.ClaimCurrencyCode
		,null as OpenDate
		,null as ReceivedDate
		,null as CloseDate
		,null as TrialArbitrationDate
		,null as StatuteofLimitationsDate
		,null as MediationDate
		,null as TotalLitigationAmt
		,line.IsValidInd
	FROM StgClaim.ClaimData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Claim) WITH (
		Claimant NVARCHAR(max) AS JSON
		,LitigationStatusCode NVARCHAR(max)
		,ClaimSourceCode NVARCHAR(max)
		,ClaimCurrencyCode NVARCHAR(max)
		) clm
	CROSS APPLY OPENJSON(clm.Claimant) WITH (MedicareDetail NVARCHAR(max) AS JSON) clt
	CROSS APPLY OPENJSON(clt.MedicareDetail) WITH (LitigationSourceCode NVARCHAR(max)) mdt

UNION ALL

	SELECT  
		hdr.SourceSystemCode
		,srg.LitigationSourceCode AS SourceCode
		,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,clm.ClaimSourceCode
		,null as LitigationNum
		,null as SummonsComplaintDesc
		,clm.LitigationStatusCode
		,null as CaseNum
		,null as CourtNum
		,null as CaseDesc
		,null as VenueDesc
		,null as CourtTypeCode
		,null as VenueRatingCode
		,null as AreaCode
		,null as ResolutionCode
		,clm.ClaimCurrencyCode
		,null as OpenDate
		,null as ReceivedDate
		,null as CloseDate
		,null as TrialArbitrationDate
		,null as StatuteofLimitationsDate
		,null as MediationDate
		,null as TotalLitigationAmt
		,line.IsValidInd
	FROM StgClaim.ClaimData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Claim NVARCHAR(max) AS JSON
		) hdr
	CROSS APPLY OPENJSON(hdr.Claim) WITH (
		Subrogation NVARCHAR(max) AS JSON
		,LitigationStatusCode NVARCHAR(max)
		,ClaimSourceCode NVARCHAR(max)
		,ClaimCurrencyCode NVARCHAR(max)
		) clm
	CROSS APPLY OPENJSON(clm.Subrogation) WITH (LitigationSourceCode NVARCHAR(max)) srg
	) AS tmp
		) AS tpl
	where tpl.rn = 1
GO
