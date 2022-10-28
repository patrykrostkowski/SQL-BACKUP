USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcVenueRating]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcVenueRating]
AS

SELECT SourceSystemCode
	,VenueRatingCode
	,VenueRatingName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, VenueRatingCode ORDER BY VenueRatingName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,lgt.VenueRatingCode
			,ISNULL(lgt.VenueRatingDesc, '') AS VenueRatingName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Litigation NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Litigation) WITH (VenueRatingCode NVARCHAR(MAX), VenueRatingDesc NVARCHAR(MAX)) lgt
		WHERE ISNULL(lgt.VenueRatingCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
