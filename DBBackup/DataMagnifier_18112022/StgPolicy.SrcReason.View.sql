USE [DataMagnifier]
GO
/****** Object:  View [StgPolicy].[SrcReason]    Script Date: 18.11.2022 16:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [StgPolicy].[SrcReason]
AS
SELECT SourceSystemCode
	,ReasonCode
	,ReasonName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, ReasonCode ORDER BY ReasonName DESC) AS rn
	FROM (		
		SELECT hdr.SourceSystemCode
			,dvr.AssignedRiskReasonCode AS ReasonCode
			,ISNULL(dvr.AssignedRiskReasonDesc, '') AS ReasonName
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
		CROSS APPLY OPENJSON(ptr.Driver) WITH (AssignedRiskReasonCode NVARCHAR(MAX), AssignedRiskReasonDesc NVARCHAR(MAX)) dvr		
		WHERE ISNULL(dvr.AssignedRiskReasonCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,dvr.SuspensionRevocationReasonCode AS ReasonCode
			,ISNULL(dvr.SuspensionRevocationReasonDesc, '') AS ReasonName
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
		CROSS APPLY OPENJSON(ptr.Driver) WITH (SuspensionRevocationReasonCode NVARCHAR(MAX), SuspensionRevocationReasonDesc NVARCHAR(MAX)) dvr		
		WHERE ISNULL(dvr.SuspensionRevocationReasonCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,vhc.ReasonLiabilityRefusedCode AS ReasonCode
			,ISNULL(vhc.ReasonLiabilityRefusedDesc, '') AS ReasonName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (LineOfBusiness NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (Geography NVARCHAR(MAX) AS JSON) lob
		CROSS APPLY OPENJSON(lob.Geography) WITH (InsurableObject NVARCHAR(MAX) AS JSON) grg
		CROSS APPLY OPENJSON(grg.InsurableObject) WITH (Vehicle NVARCHAR(MAX) AS JSON) ino
		CROSS APPLY OPENJSON(ino.Vehicle) WITH (ReasonLiabilityRefusedCode NVARCHAR(MAX), ReasonLiabilityRefusedDesc NVARCHAR(MAX)) vhc		
		WHERE ISNULL(vhc.ReasonLiabilityRefusedCode, '') <> ''

		UNION ALL 

		SELECT hdr.SourceSystemCode
			,plr.ReasonCode 
			,ISNULL(plr.ReasonDesc, '') AS ReasonName
		FROM StgPolicy.PolicyData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				Policy NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Policy) WITH (PolicyTrans NVARCHAR(MAX) AS JSON) pol
		CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (PolicyTransReason NVARCHAR(MAX) AS JSON) plt
		CROSS APPLY OPENJSON(plt.PolicyTransReason) WITH (ReasonCode NVARCHAR(MAX), ReasonDesc NVARCHAR(MAX)) plr	
		WHERE ISNULL(plr.ReasonCode, '') <> ''

		) AS tmp
	) AS tpl
GO
