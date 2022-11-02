USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcDwellingUsageType]    Script Date: 02.11.2022 09:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcDwellingUsageType]
AS
SELECT SourceSystemCode
	,DwellingUsageTypeCode
	,DwellingUsageTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, DwellingUsageTypeCode ORDER BY DwellingUsageTypeName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,dwe.DwellingUsageTypeCode
			,ISNULL(dwe.DwellingUsageTypeDesc, '') AS DwellingUsageTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Property NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Property) WITH (Dwelling NVARCHAR(MAX) AS JSON) prp
		CROSS APPLY OPENJSON(prp.Dwelling) WITH (DwellingUsageTypeCode NVARCHAR(MAX), DwellingUsageTypeDesc NVARCHAR(MAX)) dwe
		WHERE ISNULL(dwe.DwellingUsageTypeCode, '') <> ''

		) AS tmp
	) AS tpl
GO
