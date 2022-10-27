﻿USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcAssessmentStatus]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcAssessmentStatus]
AS

SELECT SourceSystemCode
	,AssessmentStatusCode
	,AssessmentStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AssessmentStatusCode ORDER BY AssessmentStatusName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,lep.AssessmentStatusCode
			,ISNULL(lep.AssessmentStatusDesc, '') AS AssessmentStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH 
				(
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventProperty NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventProperty) WITH (AssessmentStatusDesc NVARCHAR(MAX), AssessmentStatusCode NVARCHAR(MAX)) lep
		WHERE ISNULL(lep.AssessmentStatusCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
