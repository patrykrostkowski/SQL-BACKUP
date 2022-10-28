USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcClassCode]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [StgPolicy].[SrcClassCode]
AS
SELECT SourceSystemCode
	,ClassCode
	,ClassCodeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (
			PARTITION BY SourceSystemCode
			,ClassCode ORDER BY ClassCodeName DESC
			) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,rtp.ClassCode
			,ISNULL(rtp.ClassCodeDesc, '') AS ClassCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (RatingIntegrationPlan NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.RatingIntegrationPlan) WITH (RatingPlan NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.RatingPlan) WITH (
				ClassCode NVARCHAR(MAX)
				,ClassCodeDesc NVARCHAR(MAX)
				) rtp
		WHERE ISNULL(rtp.ClassCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,rtp.ClassCode
			,ISNULL(rtp.ClassCodeDesc, '') AS ClassCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyFee NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.PolicyFee) WITH (
				ClassCode NVARCHAR(MAX)
				,ClassCodeDesc NVARCHAR(MAX)
				) rtp
		WHERE ISNULL(rtp.ClassCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,rtp.ClassCode
			,ISNULL(rtp.ClassCodeDesc, '') AS ClassCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyExposure NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.PolicyExposure) WITH (
				ClassCode NVARCHAR(MAX)
				,ClassCodeDesc NVARCHAR(MAX)
				) rtp
		WHERE ISNULL(rtp.ClassCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,cov.ClassCode
			,ISNULL(cov.ClassCodeDesc, '') AS ClassCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (GEOGRAPHY NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.GEOGRAPHY) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Coverage NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Coverage) WITH (
				ClassCode NVARCHAR(MAX)
				,ClassCodeDesc NVARCHAR(MAX)
				) cov
		WHERE ISNULL(cov.ClassCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pex.ClassCode
			,ISNULL(pex.ClassCodeDesc, '') AS ClassCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (GEOGRAPHY NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.GEOGRAPHY) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Coverage NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Coverage) WITH (PolicyExposure NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyExposure) WITH (
				ClassCode NVARCHAR(MAX)
				,ClassCodeDesc NVARCHAR(MAX)
				) pex
		WHERE ISNULL(pex.ClassCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pex.ClassCode
			,ISNULL(pex.ClassCodeDesc, '') AS ClassCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (GEOGRAPHY NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.GEOGRAPHY) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Coverage NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Coverage) WITH (PolicyFee NVARCHAR(MAX) AS JSON) cov
		CROSS APPLY OPENJSON(cov.PolicyFee) WITH (
				ClassCode NVARCHAR(MAX)
				,ClassCodeDesc NVARCHAR(MAX)
				) pex
		WHERE ISNULL(pex.ClassCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pex.ClassCode
			,ISNULL(pex.ClassCodeDesc, '') AS ClassCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Coverage NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.Coverage) WITH (
				ClassCode NVARCHAR(MAX)
				,ClassCodeDesc NVARCHAR(MAX)
				) pex
		WHERE ISNULL(pex.ClassCode, '') <> ''
		
		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,pex.ClassCode
			,ISNULL(pex.ClassCodeDesc, '') AS ClassCodeName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (PolicyFee NVARCHAR(MAX) AS JSON) rip
		CROSS APPLY OPENJSON(rip.PolicyFee) WITH (
				ClassCode NVARCHAR(MAX)
				,ClassCodeDesc NVARCHAR(MAX)
				) pex
		WHERE ISNULL(pex.ClassCode, '') <> ''
		) AS tmp
	) AS tpl
WHERE tpl.rn = 1
GO
