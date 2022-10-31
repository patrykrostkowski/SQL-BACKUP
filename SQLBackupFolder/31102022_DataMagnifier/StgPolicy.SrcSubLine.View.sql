USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcSubLine]    Script Date: 31.10.2022 11:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcSubLine]
AS
SELECT SourceSystemCode
	,SublineCode
	,SublineName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SublineCode ORDER BY SublineName DESC) AS rn
	FROM (		
		SELECT hdr.SourceSystemCode
			,psl.SublineCode 
			,ISNULL(psl.SublineDesc, '') AS SublineName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (ProductSubLine NVARCHAR(MAX) AS JSON ) lob
		CROSS APPLY OPENJSON(lob.ProductSubLine) WITH (SublineCode NVARCHAR(MAX), SublineDesc NVARCHAR(MAX)) psl
		WHERE ISNULL(psl.SublineCode, '') <> ''

		) AS tmp
	) AS tpl
GO
