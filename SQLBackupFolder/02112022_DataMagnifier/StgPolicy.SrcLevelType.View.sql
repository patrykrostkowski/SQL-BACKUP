USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcLevelType]    Script Date: 02.11.2022 14:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcLevelType]
AS
SELECT SourceSystemCode
	,LevelTypeCode
	,LevelTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LevelTypeCode ORDER BY LevelTypeName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,rtp.LevelTypeCode
			,ISNULL(rtp.LevelTypeDesc, '') AS LevelTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (RatingIntegrationPlan NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.RatingIntegrationPlan) WITH (RatingPlan NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.RatingPlan) WITH (LevelTypeCode NVARCHAR(MAX), LevelTypeDesc NVARCHAR(MAX)) rtp
		WHERE ISNULL(rtp.LevelTypeCode, '') <> ''

		) AS tmp
	) AS tpl
GO
