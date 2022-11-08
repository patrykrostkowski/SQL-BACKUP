﻿USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcLeadExcessQuota]    Script Date: 08.11.2022 08:47:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcLeadExcessQuota]
AS
SELECT SourceSystemCode
	,LeadExcessQuotaCode
	,LeadExcessQuotaName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, LeadExcessQuotaCode ORDER BY LeadExcessQuotaName DESC) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,pol.LeadExcessQuotaCode 
			,ISNULL(pol.LeadExcessQuotaDesc, '') AS LeadExcessQuotaName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (LeadExcessQuotaCode NVARCHAR(MAX), LeadExcessQuotaDesc NVARCHAR(MAX)) pol		
		WHERE ISNULL(pol.LeadExcessQuotaCode, '') <> ''

		) AS tmp
	) AS tpl
GO
