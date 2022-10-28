USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimReserve]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [StgClaim].[SrcClaimReserve]
AS
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT  
	 hdr.SourceSystemCode
	,cts.ClaimTransactionSourceCode as SourceCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,ClaimSourceCode
	,LossOccurrenceSourceCode
	,CostTypeCode
	,CostCategoryTypeCode AS ReserveCategorySKCode
	,BaseCurrencyCode
	,OriginalCurrencyCode
	,ReportingCurrencyCode
	,TransactionBaseAmt AS ReserveBaseAmt
	,TransactionOriginalAmt AS ReserveOriginalAmt
	,TransactionReportingAmt AS ReserveReportingAmt
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(max)
	,ProcessDateTime NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	ClaimTransaction NVARCHAR(max) AS JSON
	,ClaimSourceCode NVARCHAR(max)
	) clm
CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (
	ClaimTransactionSourceCode NVARCHAR(max)
	,LossOccurrenceSourceCode NVARCHAR(max)
	,CostTypeCode NVARCHAR(max)
	,CostCategoryTypeCode NVARCHAR(max)
	,BaseCurrencyCode NVARCHAR(max)
	,OriginalCurrencyCode NVARCHAR(max)
	,ReportingCurrencyCode NVARCHAR(max)
	,TransactionBaseAmt NVARCHAR(max)
	,TransactionOriginalAmt NVARCHAR(max)
	,TransactionReportingAmt NVARCHAR(max)
	,ClaimTransactionTypeCode NVARCHAR(max)
	) cts
	WHERE cts.ClaimTransactionTypeCode = 'R'
	) AS tmp
	) AS tpl
	WHERE tpl.rn = 1
GO
