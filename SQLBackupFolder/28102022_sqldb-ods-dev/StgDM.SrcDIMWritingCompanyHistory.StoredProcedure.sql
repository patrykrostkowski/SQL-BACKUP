USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcDIMWritingCompanyHistory]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [StgDM].[SrcDIMWritingCompanyHistory] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT 
	row.*
FROM (
	SELECT ROW_NUMBER() OVER (
			PARTITION BY pwc.SourceCode
			,pwc.WritingCompanyCode
			,pwc.WritingCompanyName ORDER BY src.SourceSystemCode
				,pwc.WritingCompanyName
			) row_num
		,pwc.SourceCode AS [SourceCode]
		,pwc.[WritingCompanyName]
		,pwc.[WritingCompanyCode]
		,src.[SourceSystemCode] AS SourceSystemCode
		,pwc.ProcessDateTime AS [HistoricalSnapshotEffectiveFromDtm]
		,CAST('3000-01-01' AS DATETIME) AS [HistoricalSnapshotEffectiveToDtm]
		,CAST(WritingCompanyCode AS VARCHAR(20)) AS [WritingCompanyAbrv]		
		,CAST(NULL AS DATE) AS [WritingCompanyEffectiveDate]
		,CAST(NULL AS DATE) AS [WritingCompanyTerminationDate]
		,pwc.FederalEmployerIdentificationNumberCode AS [NationalTaxID]
		,NULL AS [PhoneNbr]
		,NULL AS [AddressLine1]
		,NULL AS [AddressLine2]
		,NULL AS [AddressLine3]
		,NULL AS [CityName]
		,NULL AS [StateSK]
		,NULL AS [PostalCode]
		,NULL AS [CountrySK]
		,pwc.AMBestCode AS [AMBestInsuringCompanyID]
		,pwc.NCCICompanyCode AS [NCCIInsuringCompanyID]
		,pwc.NorthAmericanIndustryClassificationCode AS [NAICWritingCompanyID]
		,NULL AS [NAICLineOfBusinessID]
		,NULL AS [NAICLineOfBusinessName]
		,NULL AS [WCIRBInsuringCompanyID]
	FROM [Party].[WritingCompany] pwc
	JOIN Typelist.SourceSystem src ON pwc.SourceSystemSK = src.SourceSystemSK
	WHERE pwc.ETLUpdateDateTime >  @DateFrom
	) row
WHERE row.row_num = 1
GO
