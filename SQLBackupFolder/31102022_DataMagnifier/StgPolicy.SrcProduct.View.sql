USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcProduct]    Script Date: 31.10.2022 12:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcProduct]
AS
SELECT SourceSystemCode
	,ProductCode
	,ProductName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ProductCode ORDER BY ProductName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,prd.ProductCode 
			,ISNULL(prd.ProductName, '') AS ProductName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (Product NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.Product) WITH (ProductCode NVARCHAR(MAX), ProductName NVARCHAR(MAX)) prd		
		WHERE ISNULL(prd.ProductCode, '') <> ''

		UNION ALL

		SELECT hdr.SourceSystemCode
			,atd.AntiTheftProductCode AS ProductCode 
			,ISNULL(atd.AntiTheftProductDesc, '') AS ProductName
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
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Vehicle NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Vehicle) WITH (AntiTheftDevice NVARCHAR(MAX) AS JSON) vhc
		CROSS APPLY OPENJSON(vhc.AntiTheftDevice) WITH (AntiTheftProductCode NVARCHAR(MAX), AntiTheftProductDesc NVARCHAR(MAX)) atd
		WHERE ISNULL(atd.AntiTheftProductCode, '') <> ''

		) AS tmp
	) AS tpl
GO
