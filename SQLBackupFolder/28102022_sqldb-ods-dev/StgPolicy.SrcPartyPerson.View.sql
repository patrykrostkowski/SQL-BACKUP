USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPartyPerson]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE    VIEW [StgPolicy].[SrcPartyPerson]
AS
SELECT tbl.SourceSystemCode
	,tbl.PartySKCode
	,tbl.SourceCode
	,CAST(tbl.ProcessDateTime AS DATETIME) AS ProcessDateTime
	,tbl.DriverLicenseStateCode
	,cpt.PartyType
	,IsValidInd
FROM (
	SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.DriverLicenseStateCode
		,pti.PartyTypeCode
		,line.IsValidInd
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Policy NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (Agency NVARCHAR(MAX) AS JSON) pol
	CROSS APPLY OPENJSON(pol.Agency) WITH (PartyInfo NVARCHAR(MAX) AS JSON) agc
	CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,DriverLicenseStateCode NVARCHAR(MAX)
			) pti
	
	UNION ALL
	
	SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.DriverLicenseStateCode
		,pti.PartyTypeCode
		,line.IsValidInd
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Policy NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (Account NVARCHAR(MAX) AS JSON) pol
	CROSS APPLY OPENJSON(pol.Account) WITH (PartyInfo NVARCHAR(MAX) AS JSON) agc
	CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,DriverLicenseStateCode NVARCHAR(MAX)
			) pti
	
	UNION ALL
	
	SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.DriverLicenseStateCode
		,pti.PartyTypeCode
		,line.IsValidInd
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Policy NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(MAX) AS JSON) pol
	CROSS APPLY OPENJSON(pol.Insured) WITH (PartyInfo NVARCHAR(MAX) AS JSON) agc
	CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,DriverLicenseStateCode NVARCHAR(MAX)
			) pti
	
	UNION ALL
	
	SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.DriverLicenseStateCode
		,pti.PartyTypeCode
		,line.IsValidInd
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Policy NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol
	CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) agc
	CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,DriverLicenseStateCode NVARCHAR(MAX)
			) pti
	) tbl
JOIN Config.PartyType cpt ON cpt.sourcesystemcode = tbl.sourcesystemcode
	AND cpt.partytypecode = tbl.partytypecode
WHERE cpt.PartyType = 'Person'


GO
