USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcRatingPlanKey]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [StgPolicy].[SrcRatingPlanKey]
AS
SELECT SourceSystemCode
	,RatingPlanKeyCode
	,RatingPlanKeyName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, RatingPlanKeyCode ORDER BY RatingPlanKeyName DESC) AS rn
	FROM (

	   	SELECT hdr.SourceSystemCode
			,rtp.RatingPlanKeyCode
			,ISNULL(rtp.RatingPlanKeyDesc, '') AS RatingPlanKeyName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (RatingPlan NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.RatingPlan) WITH (RatingPlanKeyCode NVARCHAR(MAX), RatingPlanKeyDesc NVARCHAR(MAX)) rtp
		WHERE ISNULL(rtp.RatingPlanKeyCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1



GO
