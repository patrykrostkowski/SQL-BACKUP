USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcCurrency]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE     VIEW [StgClaim].[SrcCurrency]
AS

SELECT SourceSystemCode
	,CurrencyCode
	,CurrencyName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, CurrencyCode ORDER BY CurrencyName DESC) AS rn
	FROM (

		SELECT hdr.SourceSystemCode
			,clm.CurrencyCode 
			,ISNULL(clm.CurrencyDesc, '') AS CurrencyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (CurrencyDesc NVARCHAR(MAX), CurrencyCode NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.CurrencyCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,clm.ClaimCurrencyCode 
			,ISNULL(clm.ClaimCurrencyDesc, '') AS ClaimCurrencyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimCurrencyDesc NVARCHAR(MAX), ClaimCurrencyCode NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.ClaimCurrencyCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,clm.CatLossEstimateCurrencyCode AS CurrencyCode
			,ISNULL(clm.CatLossEstimateCurrencyDesc, '') AS CurrencyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (CatLossEstimateCurrencyDesc NVARCHAR(MAX), CatLossEstimateCurrencyCode NVARCHAR(MAX)) clm
		WHERE ISNULL(clm.CatLossEstimateCurrencyCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,ccv.PolicyCurrencyCode	AS CurrencyCode 
			,ISNULL(ccv.PolicyCurrencyDesc, '') AS CurrencyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (ClaimCoverage NVARCHAR(MAX) AS JSON) clp
		CROSS APPLY OPENJSON(clp.ClaimCoverage) WITH (
			PolicyCurrencyDesc	 NVARCHAR(MAX)
			,PolicyCurrencyCode	 NVARCHAR(MAX)
			,ClaimCurrencyDesc	 NVARCHAR(MAX)
			,ClaimCurrencyCode	 NVARCHAR(MAX)
			) ccv
		WHERE ISNULL(ccv.PolicyCurrencyCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,ccv.ClaimCurrencyCode	AS CurrencyCode 
			,ISNULL(ccv.ClaimCurrencyDesc, '') AS CurrencyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (ClaimCoverage NVARCHAR(MAX) AS JSON) clp
		CROSS APPLY OPENJSON(clp.ClaimCoverage) WITH (
			PolicyCurrencyDesc	 NVARCHAR(MAX)
			,PolicyCurrencyCode	 NVARCHAR(MAX)
			,ClaimCurrencyDesc	 NVARCHAR(MAX)
			,ClaimCurrencyCode	 NVARCHAR(MAX)
			) ccv
		WHERE ISNULL(ccv.PolicyCurrencyCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,ltg.ClaimCurrencyCode	AS CurrencyCode 
			,ISNULL(ltg.ClaimCurrencyDesc, '') AS CurrencyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (Litigation NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.Litigation) WITH (
			ClaimCurrencyCode		 NVARCHAR(MAX)
			,ClaimCurrencyDesc		 NVARCHAR(MAX)
			) ltg
		WHERE ISNULL(ltg.ClaimCurrencyCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,lvt.ClaimCurrencyCode	AS CurrencyCode 
			,ISNULL(lvt.ClaimCurrencyDesc, '') AS CurrencyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (LossEvent NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (
			ClaimCurrencyCode		 NVARCHAR(MAX)
			,ClaimCurrencyDesc		 NVARCHAR(MAX)
			) lvt
		WHERE ISNULL(lvt.ClaimCurrencyCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,clt.ReportingCurrencyCode	AS CurrencyCode 
			,ISNULL(clt.ReportingCurrencyDesc, '') AS CurrencyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (
			ReportingCurrencyCode	 NVARCHAR(MAX)
			,ReportingCurrencyDesc	 NVARCHAR(MAX)
			) clt
		WHERE ISNULL(clt.ReportingCurrencyCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,clt.OriginalCurrencyCode	AS CurrencyCode 
			,ISNULL(clt.OriginalCurrencyDesc, '') AS CurrencyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (
			OriginalCurrencyDesc	 NVARCHAR(MAX)
			,OriginalCurrencyCode	 NVARCHAR(MAX)
			) clt
		WHERE ISNULL(clt.OriginalCurrencyCode, '') <> ''

UNION ALL

		SELECT hdr.SourceSystemCode
			,clt.BaseCurrencyCode	AS CurrencyCode 
			,ISNULL(clt.BaseCurrencyDesc, '') AS CurrencyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimTransaction NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (
			BaseCurrencyCode		 NVARCHAR(MAX)
			,BaseCurrencyDesc		 NVARCHAR(MAX)
			) clt
		WHERE ISNULL(clt.BaseCurrencyCode, '') <> ''

		UNION ALL
		
		SELECT hdr.SourceSystemCode
			,clp.PolicyCurrencyCode	AS CurrencyCode 
			,ISNULL(clp.PolicyCurrencyDesc, '') AS CurrencyName
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				ProcessDateTime NVARCHAR(MAX)
				,Claim NVARCHAR(MAX) AS JSON
				,SourceSystemCode NVARCHAR(MAX)
				,SourceSystemDesc NVARCHAR(MAX)
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (ClaimPolicy NVARCHAR(MAX) AS JSON) clm
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (PolicyCurrencyCode NVARCHAR(MAX), PolicyCurrencyDesc NVARCHAR(MAX)) clp
		
		WHERE ISNULL(clp.PolicyCurrencyCode, '') <> ''


		) AS tmp
	) AS tpl
	where tpl.rn = 1

GO
