USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcDriverRoleType]    Script Date: 02.11.2022 12:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcDriverRoleType]
AS
SELECT SourceSystemCode
	,DriverRoleTypeCode
	,DriverRoleTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, DriverRoleTypeCode ORDER BY DriverRoleTypeName DESC) AS rn
	FROM (
	   	SELECT hdr.SourceSystemCode
			,drv.DriverRoleTypeCode
			,ISNULL(drv.DriverRoleTypeDesc, '') AS DriverRoleTypeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (MiscParty NVARCHAR(MAX) AS JSON) pol	
		CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) msp
		CROSS APPLY OPENJSON(msp.PartyInfo) WITH (PartyRole NVARCHAR(MAX) AS JSON) pti
		CROSS APPLY OPENJSON(pti.PartyRole) WITH (Driver NVARCHAR(MAX) AS JSON) ptr
		CROSS APPLY OPENJSON(ptr.Driver) WITH (DriverRoleTypeCode NVARCHAR(MAX), DriverRoleTypeDesc NVARCHAR(MAX)) drv
		WHERE ISNULL(drv.DriverRoleTypeCode, '') <> ''

		) AS tmp
	) AS tpl
GO
