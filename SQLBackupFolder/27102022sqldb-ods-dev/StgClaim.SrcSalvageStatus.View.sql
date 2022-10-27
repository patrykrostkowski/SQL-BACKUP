USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcSalvageStatus]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcSalvageStatus]
AS

SELECT SourceSystemCode
	,SalvageStatusCode
	,SalvageStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SalvageStatusCode ORDER BY SalvageStatusName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.SalvageStatusCode 
			,ISNULL(clm.SalvageStatusDesc, '') AS SalvageStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (SalvageStatusCode NVARCHAR(MAX), SalvageStatusDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.SalvageStatusCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
