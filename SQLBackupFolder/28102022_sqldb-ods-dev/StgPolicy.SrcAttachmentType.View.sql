USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcAttachmentType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgPolicy].[SrcAttachmentType]
AS
SELECT distinct SourceSystemCode
	,AttachmentTypeCode
	,AttachmentTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AttachmentTypeCode ORDER BY AttachmentTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,pol.AttachmentTypeCode
			,ISNULL(pol.AttachmentTypeDesc, '') AS AttachmentTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				SourceSystemCode NVARCHAR(max)
				,Policy NVARCHAR(max) AS JSON
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (
				AttachmentTypeCode NVARCHAR(max)
				,AttachmentTypeDesc NVARCHAR(max)
				) pol
			WHERE ISNULL(pol.AttachmentTypeCode, '') <> ''
		) tpl
	) trn
WHERE trn.rn = 1
GO
