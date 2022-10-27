USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDIMWritingCompanyHistory]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [StgADM].[SrcDIMWritingCompanyHistory]   @CutOffDateFrom VARCHAR(100)

AS 
DECLARE @DateFrom DATETIME =  cast(@CutOffDateFrom AS DATETIME);

SELECT 
	row.*
FROM (
	SELECT ROW_NUMBER() OVER (
			PARTITION BY pwc.SourceCode
			,pwc.WritingCompanyCode
			,pwc.WritingCompanyName
			,src.SourceSystemSk
			ORDER BY src.SourceSystemCode
				,pwc.WritingCompanyName
			) row_num
		,pwc.SourceCode AS [SourceCode] 
		,pwc.[WritingCompanyName] 
		,pwc.[WritingCompanyCode]
		,src.[SourceSystemCode] AS SourceSystemCode
		,pwc.ProcessDateTime AS [HistoricalSnapshotEffectiveFromDtm]
		,CAST('3000-01-01' AS DATETIME) AS [HistoricalSnapshotEffectiveToDtm]
		,0 AS GovernanceValidationInd
		,'NoStdVal' AS StandardValueCk
		,0 AS StandardValueInd
		,CAST(WritingCompanyCode AS VARCHAR(20)) AS [WritingCompanyAbrv]
		,null as [WritingCompanyDefn]

	FROM [Party].[WritingCompany] pwc
	JOIN Typelist.SourceSystem src ON pwc.SourceSystemSK = src.SourceSystemSK
	WHERE pwc.ETLUpdateDateTime >  @DateFrom
	) row
WHERE row.row_num = 1
GO
