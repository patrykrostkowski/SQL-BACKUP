USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgADM].[SrcDimClaimFinancialTransactionType]    Script Date: 28.10.2022 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgADM].[SrcDimClaimFinancialTransactionType] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (
			PARTITION BY SourceSystemCode
			,SourceCode ORDER BY SourceCode ASC
			) AS rn
	FROM (
		SELECT ctt.ClaimTransactionTypeCode AS ClaimFinancialTransactionTypeCode
			,ctt.ClaimTransactionTypeCode AS SourceCode
			,tss.SourceSystemCode AS SourceSystemCode
			,ctt.ClaimTransactionTypeName AS ClaimFinancialTransactionTypeName
			,ctt.ClaimTransactionTypeCode AS ClaimFinancialTransactionTypeAbrv
			,ctt.ClaimTransactionTypeName AS ClaimFinancialTransactionTypeDefn
			,cast('1900-01-01' AS DATE) AS RowEffectiveFromDate
			,cast('3000-01-01' AS DATE) AS RowEffectiveToDate
			,0 AS GovernanceValidationInd
			,'NoStdVal' AS StandardValueCkCode
			,NULL AS StandardValueInd
		FROM Typelist.ClaimTransactionType ctt
		JOIN typelist.SourceSystem tss ON tss.SourceSystemSK = ctt.SourceSystemSK
		WHERE ctt.ETLUpdateDateTime > @DateFrom
		) tmp
	) tpl
WHERE tpl.rn = 1
GO
