﻿USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcDirectAssumed]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [StgPolicy].[SrcDirectAssumed]
AS
SELECT SourceSystemCode
	,DirectAssumedCode
	,DirectAssumedName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, DirectAssumedCode ORDER BY DirectAssumedName DESC) AS rn
	FROM (		
		SELECT hdr.SourceSystemCode
			,pol.DirectAssumedCode 
			,ISNULL(pol.DirectAssumedDesc, '') AS DirectAssumedName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON
		,DirectAssumedCode NVARCHAR(MAX)
				,DirectAssumedDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.DirectAssumedCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
