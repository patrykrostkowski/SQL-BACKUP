USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcAircraftType]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcAircraftType]
AS

SELECT SourceSystemCode
	,AircraftTypeCode
	,AircraftTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, AircraftTypeCode ORDER BY AircraftTypeName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,lea.AircraftTypeCode
			,ISNULL(lea.AircraftTypeDesc, '') AS AircraftTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm	
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventAircraft NVARCHAR(MAX) AS JSON) lev

		CROSS APPLY OPENJSON(lev.LossEventAircraft) WITH (AircraftTypeCode NVARCHAR(MAX), AircraftTypeDesc NVARCHAR(MAX)) lea
		WHERE ISNULL(lea.AircraftTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
