USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcAssignmentStatus]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcAssignmentStatus]
AS

SELECT SourceSystemCode
	,AssignmentStatusCode
	,AssignmentStatusName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AssignmentStatusCode ORDER BY AssignmentStatusName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,loc.AssignmentStatusCode
			,ISNULL(loc.AssignmentStatusDesc, '') AS AssignmentStatusName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr

		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossOccurrence NVARCHAR(MAX) AS JSON) lvt
		CROSS APPLY OPENJSON(lvt.LossOccurrence) WITH (AssignmentStatusCode NVARCHAR(MAX), AssignmentStatusDesc NVARCHAR(MAX)) loc
		WHERE ISNULL(loc.AssignmentStatusCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
