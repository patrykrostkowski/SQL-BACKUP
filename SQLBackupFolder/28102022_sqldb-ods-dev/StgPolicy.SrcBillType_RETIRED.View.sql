﻿USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcBillType_RETIRED]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [StgPolicy].[SrcBillType_RETIRED]
AS
SELECT distinct SourceSystemCode
	,BillTypeCode
	,BillTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, BillTypeCode ORDER BY BillTypeName DESC) AS rn
	FROM (
		SELECT distinct hdr.SourceSystemCode
			,pol.BillTypeCode
			,ISNULL(pol.BillTypeDesc, '') AS BillTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (BillTypeCode NVARCHAR(MAX), BillTypeDesc NVARCHAR(MAX)) pol
		WHERE ISNULL(pol.BillTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
