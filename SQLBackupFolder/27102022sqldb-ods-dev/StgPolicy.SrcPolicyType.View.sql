﻿USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPolicyType]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcPolicyType]
AS
SELECT SourceSystemCode
	,PolicyTypeCode
	,PolicyTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, PolicyTypeCode ORDER BY PolicyTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,pol.PolicyTypeCode 
			,ISNULL(pol.PolicyTypeDesc, '') AS PolicyTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTypeCode NVARCHAR(MAX), PolicyTypeDesc NVARCHAR(MAX)) pol		
		WHERE ISNULL(pol.PolicyTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
