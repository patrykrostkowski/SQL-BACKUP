USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcDepartment]    Script Date: 12.11.2022 09:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[StgPolicy].[SrcDepartment]'))
EXEC dbo.sp_executesql @statement = N'
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
			,ISNULL(pol.DepartmentDesc, '''') AS DepartmentName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (DepartmentCode NVARCHAR(MAX), DepartmentDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.DepartmentCode, '''') <> ''''

		) AS tmp
	) AS tpl' 
GO
