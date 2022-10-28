﻿USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcInsurableObjectType]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcInsurableObjectType]
AS
SELECT SourceSystemCode
	,InsurableObjectTypeCode
	,InsurableObjectTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, InsurableObjectTypeCode ORDER BY InsurableObjectTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,ino.InsurableObjectTypeCode AS InsurableObjectTypeCode
			,ISNULL(ino.InsurableObjectTypeDesc, '') AS InsurableObjectTypeName
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
		WHERE ISNULL(ino.InsurableObjectTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
