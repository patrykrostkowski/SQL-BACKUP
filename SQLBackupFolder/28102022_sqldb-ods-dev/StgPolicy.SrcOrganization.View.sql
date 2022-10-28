USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcOrganization]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [StgPolicy].[SrcOrganization]

AS 

SELECT     tbl.SourceSystemCode
	      ,tbl.PartySKCode
	      ,tbl.SourceCode
	      ,CAST(tbl.ProcessDateTime AS DATETIME) AS ProcessDateTime
	      ,tbl.OwnershipTypeCode
	      ,cpt.PartyType
FROM (
	SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.OwnershipTypeCode
		,pti.PartyTypeCode
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Policy NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Agency NVARCHAR(MAX) AS JSON
	) pol
	CROSS APPLY OPENJSON(pol.Agency) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) agc
	CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,OwnershipTypeCode NVARCHAR(MAX)
			) pti
	
	UNION ALL
	
	SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.OwnershipTypeCode
		,pti.PartyTypeCode
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Policy NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Account NVARCHAR(MAX) AS JSON
	) pol
	CROSS APPLY OPENJSON(pol.Account) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) acc
	CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,OwnershipTypeCode NVARCHAR(MAX)
			) pti
	
	UNION ALL
	
	SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.OwnershipTypeCode
		,pti.PartyTypeCode
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Policy NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Insured NVARCHAR(MAX) AS JSON
	) pol
	CROSS APPLY OPENJSON(pol.Insured) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) ins
	CROSS APPLY OPENJSON(ins.PartyInfo) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,OwnershipTypeCode NVARCHAR(MAX)
			) pti
	
	UNION ALL
	
	SELECT hdr.SourceSystemCode
		,pti.PartyInfoSourceCode AS PartySKCode
		,pti.PartyInfoSourceCode AS SourceCode
		,hdr.ProcessDateTime
		,pti.OwnershipTypeCode
		,pti.PartyTypeCode
	FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
			ProcessDateTime NVARCHAR(MAX)
			,Policy NVARCHAR(MAX) AS JSON
			,SourceSystemCode NVARCHAR(MAX)
			,SourceSystemDesc NVARCHAR(MAX)
			) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) pol
	CROSS APPLY OPENJSON(pol.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) mis
	CROSS APPLY OPENJSON(mis.PartyInfo) WITH (
			PartyInfoSourceCode NVARCHAR(MAX)
			,PartyTypeCode NVARCHAR(MAX)
			,OwnershipTypeCode NVARCHAR(MAX)
			) pti
	) tbl
JOIN Config.PartyType cpt ON cpt.sourcesystemcode = tbl.SourceSystemCode
	AND cpt.partytypecode = tbl.PartyTypeCode
WHERE cpt.PartyType = 'Organisation' 

GO
