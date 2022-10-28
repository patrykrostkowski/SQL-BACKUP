USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcFaultRating]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcFaultRating]
AS

SELECT SourceSystemCode
	,FaultRatingCode
	,FaultRatingName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, FaultRatingCode ORDER BY FaultRatingName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.FaultRatingCode 
			,ISNULL(clm.FaultRatingDesc, '') AS FaultRatingName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (FaultRatingCode NVARCHAR(MAX), FaultRatingDesc NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.FaultRatingCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
