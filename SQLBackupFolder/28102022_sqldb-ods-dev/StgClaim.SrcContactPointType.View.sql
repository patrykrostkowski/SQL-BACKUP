﻿USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcContactPointType]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcContactPointType]
AS
SELECT SourceSystemCode
	,'Email' AS ContactPointTypeCode
	,'Email' AS ContactPointTypeName
FROM (	
		SELECT DISTINCT  hdr.SourceSystemCode		
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (				
				SourceSystemCode NVARCHAR(MAX)
				) hdr
				
	) AS tpl	

UNION ALL

SELECT SourceSystemCode
	,'Web' AS ContactPointTypeCode
	,'Web' AS ContactPointTypeName
FROM (	
		SELECT DISTINCT  hdr.SourceSystemCode		
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (				
				SourceSystemCode NVARCHAR(MAX)
				) hdr
				
	) AS tpl	

UNION ALL

SELECT SourceSystemCode
	,'Phone' AS ContactPointTypeCode
	,'Phone' AS ContactPointTypeName
FROM (	
		SELECT DISTINCT  hdr.SourceSystemCode		
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (				
				SourceSystemCode NVARCHAR(MAX)
				) hdr
				
	) AS tpl

UNION ALL

SELECT SourceSystemCode
	,'Address' AS ContactPointTypeCode
	,'Address' AS ContactPointTypeName
FROM (	
		SELECT DISTINCT  hdr.SourceSystemCode		
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (				
				SourceSystemCode NVARCHAR(MAX)
				) hdr
				
	) AS tpl
	
	
GO
