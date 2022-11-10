USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcOwnershipType]    Script Date: 10.11.2022 14:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[StgPolicy].[SrcOwnershipType]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [StgPolicy].[SrcOwnershipType]
AS
SELECT SourceSystemCode
	,OwnershipTypeCode
	,OwnershipTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, OwnershipTypeCode ORDER BY OwnershipTypeName DESC) AS rn
	FROM (

	   	SELECT hdr.SourceSystemCode
			,pti.OwnershipTypeCode
			,ISNULL(pti.OwnershipTypeDesc, '''') AS OwnershipTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Account NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.Account) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
		CROSS APPLY OPENJSON(acc.PartyInfo) WITH (OwnershipTypeCode NVARCHAR(MAX), OwnershipTypeDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.OwnershipTypeCode, '''') <> ''''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.OwnershipTypeCode
			,ISNULL(pti.OwnershipTypeDesc, '''') AS OwnershipTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Agency NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.Agency) WITH (PartyInfo NVARCHAR(MAX) AS JSON) agc
		CROSS APPLY OPENJSON(agc.PartyInfo) WITH (OwnershipTypeCode NVARCHAR(MAX), OwnershipTypeDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.OwnershipTypeCode, '''') <> ''''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.OwnershipTypeCode
			,ISNULL(pti.OwnershipTypeDesc, '''') AS OwnershipTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Insured NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.Insured) WITH (PartyInfo NVARCHAR(MAX) AS JSON) ins
		CROSS APPLY OPENJSON(ins.PartyInfo) WITH (OwnershipTypeCode NVARCHAR(MAX), OwnershipTypeDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.OwnershipTypeCode, '''') <> ''''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,pti.OwnershipTypeCode
			,ISNULL(pti.OwnershipTypeDesc, '''') AS OwnershipTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (OwnershipTypeCode NVARCHAR(MAX), OwnershipTypeDesc NVARCHAR(MAX)) pti
		WHERE ISNULL(pti.OwnershipTypeCode, '''') <> ''''

		) AS tmp
	) AS tpl
' 
GO
