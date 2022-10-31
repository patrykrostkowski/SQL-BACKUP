﻿USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcDepartment]    Script Date: 31.10.2022 12:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcDepartment]
AS
SELECT SourceSystemCode
	,DepartmentCode
	,DepartmentName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, DepartmentCode ORDER BY DepartmentName DESC) AS rn
	FROM (
	    SELECT hdr.SourceSystemCode
			,pol.DepartmentCode
			,ISNULL(pol.DepartmentDesc, '') AS DepartmentName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (DepartmentCode NVARCHAR(MAX), DepartmentDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.DepartmentCode, '') <> ''

		) AS tmp
	) AS tpl
GO
