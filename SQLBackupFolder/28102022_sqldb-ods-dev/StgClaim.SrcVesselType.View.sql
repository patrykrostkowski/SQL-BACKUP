USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcVesselType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcVesselType]
AS

SELECT SourceSystemCode
	,VesselTypeCode
	,VesselTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, VesselTypeCode ORDER BY VesselTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,lep.VesselTypeCode
			,ISNULL(lep.VesselTypeDesc, '') AS VesselTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH 
				(
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventWatercraft NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventWatercraft) WITH (VesselTypeCode NVARCHAR(MAX), VesselTypeDesc NVARCHAR(MAX)) lep
		WHERE ISNULL(lep.VesselTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
