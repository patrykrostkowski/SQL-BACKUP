USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcDateofLossQualifier]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcDateofLossQualifier]
AS

SELECT SourceSystemCode
	,DateofLossQualifierCode
	,DateofLossQualifierName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, DateofLossQualifierCode ORDER BY DateofLossQualifierName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.DateofLossQualifierCode 
			,ISNULL(clm.DateofLossQualifierDesc, '') AS DateofLossQualifierName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (DateofLossQualifierCode NVARCHAR(MAX), DateofLossQualifierDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.DateofLossQualifierCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
