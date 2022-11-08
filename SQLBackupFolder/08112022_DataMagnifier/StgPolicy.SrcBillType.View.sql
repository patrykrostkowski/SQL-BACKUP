USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcBillType]    Script Date: 08.11.2022 08:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcBillType]
AS
SELECT SourceSystemCode
	,BillTypeCode
	,BillTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, BillTypeCode ORDER BY BillTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
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
GO
