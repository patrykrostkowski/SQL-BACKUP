USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcInsurableObject]    Script Date: 10.11.2022 14:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[StgPolicy].[SrcInsurableObject]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [StgPolicy].[SrcInsurableObject]
AS
SELECT SourceSystemCode
	,InsurableObjectTypeCode
	,InsurableObjectTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, InsurableObjectTypeCode ORDER BY InsurableObjectTypeName DESC) AS rn
	FROM (		
		SELECT hdr.SourceSystemCode
			,ino.InsurableObjectTypeCode 
			,ISNULL(ino.InsurableObjectTypeDesc, '''') AS InsurableObjectTypeName
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
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (InsurableObjectTypeCode NVARCHAR(MAX), InsurableObjectTypeDesc NVARCHAR(MAX)) ino
		WHERE ISNULL(ino.InsurableObjectTypeCode, '''') <> ''''

		) AS tmp
	) AS tpl' 
GO
