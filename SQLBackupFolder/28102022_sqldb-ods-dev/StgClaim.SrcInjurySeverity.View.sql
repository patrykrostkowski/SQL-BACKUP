USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcInjurySeverity]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcInjurySeverity]
AS

SELECT SourceSystemCode
	,InjurySeverityCode
	,InjurySeverityName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, InjurySeverityCode ORDER BY InjurySeverityName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.InjurySeverityCode 
			,ISNULL(clm.InjurySeverityDesc, '') AS InjurySeverityName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (InjurySeverityCode NVARCHAR(MAX), InjurySeverityDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.InjurySeverityCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
