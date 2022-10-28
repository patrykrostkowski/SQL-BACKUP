USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcInjuryType]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcInjuryType]
AS

SELECT SourceSystemCode
	,InjuryTypeCode
	,InjuryTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, InjuryTypeCode ORDER BY InjuryTypeName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,lei.InjuryTypeCode 
			,ISNULL(lei.InjuryTypeDesc, '') AS InjuryTypeName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (LossEventInjury NVARCHAR(MAX) AS JSON) lev
		CROSS APPLY OPENJSON(lev.LossEventInjury) WITH (InjuryTypeCode NVARCHAR(MAX), InjuryTypeDesc NVARCHAR(MAX)) lei
		WHERE ISNULL(lei.InjuryTypeCode, '') <> ''

		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
