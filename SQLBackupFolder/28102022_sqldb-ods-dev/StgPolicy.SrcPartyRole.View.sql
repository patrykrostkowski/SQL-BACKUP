USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPartyRole]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcPartyRole]
AS
SELECT SourceSystemCode
	,PartyRoleCode
	,PartyRoleName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PartyRoleCode ORDER BY PartyRoleName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,ptr.PartyRoleCode
			,ISNULL(ptr.PartyRoleDesc, '') AS PartyRoleName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Account NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Account) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
		CROSS APPLY OPENJSON(acc.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyRoleCode NVARCHAR(MAX), PartyRoleDesc NVARCHAR(MAX)) ptr
		WHERE ISNULL(ptr.PartyRoleCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,ptr.PartyRoleCode
			,ISNULL(ptr.PartyRoleDesc, '') AS PartyRoleName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Agency NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Agency) WITH (PartyInfo NVARCHAR(MAX) AS JSON) agc
		CROSS APPLY OPENJSON(agc.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyRoleCode NVARCHAR(MAX), PartyRoleDesc NVARCHAR(MAX)) ptr
		WHERE ISNULL(ptr.PartyRoleCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,ptr.PartyRoleCode
			,ISNULL(ptr.PartyRoleDesc, '') AS PartyRoleName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Insured) WITH (PartyInfo NVARCHAR(MAX) AS JSON) ins
		CROSS APPLY OPENJSON(ins.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyRoleCode NVARCHAR(MAX), PartyRoleDesc NVARCHAR(MAX)) ptr
		WHERE ISNULL(ptr.PartyRoleCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,ptr.PartyRoleCode
			,ISNULL(ptr.PartyRoleDesc, '') AS PartyRoleName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (PartyRoleCode NVARCHAR(MAX), PartyRoleDesc NVARCHAR(MAX)) ptr
		WHERE ISNULL(ptr.PartyRoleCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
