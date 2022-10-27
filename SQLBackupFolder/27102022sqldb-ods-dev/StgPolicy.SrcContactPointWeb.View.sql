USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcContactPointWeb]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE    VIEW [StgPolicy].[SrcContactPointWeb]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT 
	 hdr.SourceSystemCode	
	,pwb.PartyWebSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode
	,ptr.PartyRoleCode
    ,pwb.WebURLDesc          
	,pwb.WebURLName         
	,pwb.IsPrimaryInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Account NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.Account) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) acc
CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyWeb NVARCHAR(MAX) AS JSON
	,PartyRoleCode NVARCHAR(MAX)
	) ptr
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
      PartyWebSourceCode  NVARCHAR(MAX)
	 ,WebURLDesc          NVARCHAR(MAX)
	 ,WebURLName          NVARCHAR(MAX)
	 ,IsPrimaryInd        INT
	 ) pwb

UNION ALL


SELECT 
	 hdr.SourceSystemCode	
	,pwb.PartyWebSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode
	,ptr.PartyRoleCode
    ,pwb.WebURLDesc          
	,pwb.WebURLName         
	,pwb.IsPrimaryInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
  CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Agency NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.Agency) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) agc
CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyWeb NVARCHAR(MAX) AS JSON
	,PartyRoleCode NVARCHAR(MAX)
	) ptr 
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
      PartyWebSourceCode  NVARCHAR(MAX)
	 ,WebURLDesc          NVARCHAR(MAX)
	 ,WebURLName          NVARCHAR(MAX)
	 ,IsPrimaryInd        INT
	 ) pwb

UNION ALL


SELECT 
	 hdr.SourceSystemCode	
	,pwb.PartyWebSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode
	,ptr.PartyRoleCode
    ,pwb.WebURLDesc          
	,pwb.WebURLName         
	,pwb.IsPrimaryInd 
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Insured NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.Insured) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) ins
CROSS APPLY OPENJSON(ins.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyWeb NVARCHAR(MAX) AS JSON
	,PartyRoleCode NVARCHAR(MAX)
	) ptr
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
      PartyWebSourceCode  NVARCHAR(MAX)
	 ,WebURLDesc          NVARCHAR(MAX)
	 ,WebURLName          NVARCHAR(MAX)
	 ,IsPrimaryInd        INT
	 ) pwb

UNION ALL

SELECT 
	 hdr.SourceSystemCode	
	,pwb.PartyWebSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode
	,ptr.PartyRoleCode
    ,pwb.WebURLDesc          
	,pwb.WebURLName         
	,pwb.IsPrimaryInd 
	,line.IsValidInd
FROM StgPolicy.PolicyData line

CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) msp
CROSS APPLY OPENJSON(msp.PartyInfo) WITH (
	PartyRole NVARCHAR(MAX) AS JSON
	,PartyInfoSourceCode NVARCHAR(MAX)
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	PartyWeb NVARCHAR(MAX) AS JSON
	,PartyRoleCode NVARCHAR(MAX)
	) ptr
CROSS APPLY OPENJSON(ptr.PartyWeb) WITH (
      PartyWebSourceCode  NVARCHAR(MAX)
	 ,WebURLDesc          NVARCHAR(MAX)
	 ,WebURLName          NVARCHAR(MAX)
	 ,IsPrimaryInd        INT
	 ) pwb
	 			)tpl
	 	)tmp
	where tmp.rn = 1
GO
