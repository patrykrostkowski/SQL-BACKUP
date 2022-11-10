USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcPartyType]    Script Date: 10.11.2022 14:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[StgPolicy].[SrcPartyType]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [StgPolicy].[SrcPartyType]
AS
SELECT SourceSystemCode
	,PartyTypeCode
	,PartyTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PartyTypeCode ORDER BY PartyTypeName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,pti.PartyTypeCode
			,ISNULL(pti.PartyTypeDesc, '''') AS PartyTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Account NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.Account) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
		CROSS APPLY OPENJSON(acc.PartyInfo) WITH (PartyTypeCode NVARCHAR(MAX), PartyTypeDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.PartyTypeCode, '''') <> ''''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.PartyTypeCode
			,ISNULL(pti.PartyTypeDesc, '''') AS PartyTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Agency NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.Agency) WITH (PartyInfo NVARCHAR(MAX) AS JSON) agc
		CROSS APPLY OPENJSON(agc.PartyInfo) WITH (PartyTypeCode NVARCHAR(MAX), PartyTypeDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.PartyTypeCode, '''') <> ''''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.PartyTypeCode
			,ISNULL(pti.PartyTypeDesc, '''') AS PartyTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.Insured) WITH (PartyInfo NVARCHAR(MAX) AS JSON) ins
		CROSS APPLY OPENJSON(ins.PartyInfo) WITH (PartyTypeCode NVARCHAR(MAX), PartyTypeDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.PartyTypeCode, '''') <> ''''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.PartyTypeCode
			,ISNULL(pti.PartyTypeDesc, '''') AS PartyTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyTypeCode NVARCHAR(MAX), PartyTypeDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.PartyTypeCode, '''') <> ''''

		) AS tmp
	) AS tpl
' 
GO
