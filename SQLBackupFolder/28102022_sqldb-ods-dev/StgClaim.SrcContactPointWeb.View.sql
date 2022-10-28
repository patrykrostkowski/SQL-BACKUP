USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcContactPointWeb]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   VIEW [StgClaim].[SrcContactPointWeb]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT   hdr.SourceSystemCode
        ,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,pwb.PartyWebSourceCode AS SourceCode
		,pti.PartyInfoSourceCode
		,ptr.PartyRoleCode 
		,pwb.WebURLDesc
		,pwb.WebURLName
		,pwb.IsPrimaryInd
		,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
     SourceSystemCode NVARCHAR(max)
	,ProcessDateTime  NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
     MiscParty NVARCHAR(max) AS JSON 
	 ) clm
CROSS APPLY OPENJSON(clm.MiscParty) WITH (
     PartyInfo NVARCHAR(max) AS JSON  
	 ) msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
    PartyInfoSourceCode NVARCHAR(max)
	,PartyRole NVARCHAR(max) AS JSON  
	) Pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
     PartyRoleCode NVARCHAR(max)
     ,PartyWeb NVARCHAR(max) AS JSON 
	) ptr
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
     PartyWebSourceCode   NVARCHAR(max)
	 ,WebURLDesc   NVARCHAR(max)
	 ,WebURLName   NVARCHAR(max)
	 ,IsPrimaryInd  INT
     )pwb

UNION ALL

SELECT    hdr.SourceSystemCode
        ,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,pwb.PartyWebSourceCode AS SourceCode
		,pti.PartyInfoSourceCode
		,ptr.PartyRoleCode 
		,pwb.WebURLDesc
		,pwb.WebURLName
		,pwb.IsPrimaryInd
		,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
     SourceSystemCode NVARCHAR(max)
	,ProcessDateTime  NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
     Claimant  NVARCHAR(max) AS JSON
	 )clm
CROSS APPLY OPENJSON(clm.Claimant) WITH (
     PartyInfo NVARCHAR(max) AS JSON  
	 ) cmt
CROSS APPLY OPENJSON(cmt.PartyInfo) WITH (
     PartyInfoSourceCode NVARCHAR(max)
	,PartyRole NVARCHAR(max) AS JSON  
	)pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
       PartyRoleCode NVARCHAR(max)
      ,PartyWeb NVARCHAR(max) AS JSON 
	) ptr
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
     PartyWebSourceCode   NVARCHAR(max)
	 ,WebURLDesc   NVARCHAR(max)
	 ,WebURLName   NVARCHAR(max)
	 ,IsPrimaryInd  INT
     )pwb

UNION ALL 

SELECT   hdr.SourceSystemCode
        ,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,pwb.PartyWebSourceCode AS SourceCode
		,pti.PartyInfoSourceCode
		,ptr.PartyRoleCode 
		,pwb.WebURLDesc
		,pwb.WebURLName
		,pwb.IsPrimaryInd
		,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
     SourceSystemCode NVARCHAR(max)
	,ProcessDateTime  NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
     LossEvent NVARCHAR(max) AS JSON
    )clm
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
    MiscParty NVARCHAR(max) AS JSON
	) loe
CROSS APPLY OPENJSON(loe.MiscParty) WITH (
   PartyInfo NVARCHAR(max) AS JSON 
   )msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
   PartyInfoSourceCode NVARCHAR(max) 
    ,PartyRole NVARCHAR(max) AS JSON  
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
      PartyRoleCode NVARCHAR(max)
      ,PartyWeb NVARCHAR(max) AS JSON 
	) ptr
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
     PartyWebSourceCode   NVARCHAR(max)
	 ,WebURLDesc   NVARCHAR(max)
	 ,WebURLName   NVARCHAR(max)
	 ,IsPrimaryInd  INT
     )pwb

UNION ALL

SELECT   hdr.SourceSystemCode
        ,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
		,pwb.PartyWebSourceCode AS SourceCode
		,pti.PartyInfoSourceCode
		,ptr.PartyRoleCode 
		,pwb.WebURLDesc
		,pwb.WebURLName
		,pwb.IsPrimaryInd
		,line.IsValidInd

FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
     SourceSystemCode NVARCHAR(max)
	,ProcessDateTime  NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
     LossEvent NVARCHAR(max) AS JSON
    )clm

CROSS APPLY OPENJSON(clm.LossEvent) WITH (
     LossOccurrence  NVARCHAR(max) AS JSON
	 ) loe
CROSS APPLY OPENJSON(loe.LossOccurrence) WITH (
     MiscParty NVARCHAR(max) AS JSON
	 )loc
CROSS APPLY OPENJSON(loc.MiscParty) WITH (
      PartyInfo NVARCHAR(max) AS JSON 
   )msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
   PartyInfoSourceCode NVARCHAR(max) 
    ,PartyRole NVARCHAR(max) AS JSON  
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
      PartyRoleCode NVARCHAR(max)
      ,PartyWeb NVARCHAR(max) AS JSON 
	) ptr
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
     PartyWebSourceCode   NVARCHAR(max)
	 ,WebURLDesc   NVARCHAR(max)
	 ,WebURLName   NVARCHAR(max)
	 ,IsPrimaryInd  INT
     )pwb	
	 						)tpl
	)tmp
	where tmp.rn = 1
		
GO
