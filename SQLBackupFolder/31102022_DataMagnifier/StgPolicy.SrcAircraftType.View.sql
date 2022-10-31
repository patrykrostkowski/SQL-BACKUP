USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcAircraftType]    Script Date: 31.10.2022 12:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcAircraftType]
AS
SELECT SourceSystemCode
	,AircraftTypeCode
	,AircraftTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AircraftTypeCode ORDER BY AircraftTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,acf.AircraftTypeCode
			,ISNULL(acf.AircraftTypeDesc, '') AS AircraftTypeName
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
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Aircraft NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Aircraft) WITH (AircraftTypeCode NVARCHAR(MAX), AircraftTypeDesc NVARCHAR(MAX)) acf
		WHERE ISNULL(acf.AircraftTypeCode, '') <> ''
		) AS tmp
	) AS tpl
GO
