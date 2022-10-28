USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimTransaction]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [StgClaim].[SrcClaimTransaction]
AS
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
		SELECT 
			hdr.SourceSystemCode
			,Convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
			,clt.ClaimTransactionSourceCode as SourceCode
			,clm.ClaimSourceCode 
			,clt.ClaimCoverageSourceCode 
			,clt.AuthorizationStatusCode 
			,clt.ClaimTransactionTypeCode
			,clt.PaymentTypeCode 
			,clt.BaseCurrencyCode  
			,clt.OriginalCurrencyCode  
			,clt.ReportingCurrencyCode  
			,clt.TransactionBaseAmt  
			,clt.TransactionOriginalAmt 
			,clt.TransactionReportingAmt
			,Convert(DATETIME, clt.TransactionDate, 127) AS TransactionDate
			,clt.LossOccurrenceSourceCode  
			,wtc.WritingCompanySourceCode
			,clp.ClaimPolicySourceCode
			,isnull(clt.CostTypeCode,'costtype') as CostTypeCode
			,clt.CostTypeDesc---------added
			,clt.CostCategoryTypeCode
			,clt.LossOccurrenceSequenceNumber   
			,clt.RecoveryCategoryTypeCode-----------added
			,clt.RecoveryCategoryTypeDesc -----------added
			,clt.ClaimTransactionCategoryTypeCode
			,clt.ClaimTransactionCategoryTypeDesc------added
			,lev.LossEventSourceCode
			,line.IsValidInd
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
			SourceSystemCode	NVARCHAR(max)
			,ProcessDateTime	NVARCHAR(max)
			,Claim				NVARCHAR(max) AS JSON
			) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
			ClaimSourceCode		NVARCHAR(max) 
			,ClaimTransaction	NVARCHAR(max) AS JSON
			,ClaimPolicy		NVARCHAR(max) AS JSON 
			,LossEvent			NVARCHAR(max) AS JSON
			) clm
		CROSS APPLY OPENJSON(clm.LossEvent) WITH (
			LossEventSourceCode NVARCHAR(max)
			) lev
		CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (  
			ClaimTransactionSourceCode	NVARCHAR(max)
			,ClaimCoverageSourceCode    NVARCHAR(max)
			,AuthorizationStatusCode    NVARCHAR(max)
			,ClaimTransactionTypeCode   NVARCHAR(max)
			,PaymentTypeCode            NVARCHAR(max)
			,BaseCurrencyCode           NVARCHAR(max)
			,OriginalCurrencyCode       NVARCHAR(max)
			,ReportingCurrencyCode      NVARCHAR(max)
			,TransactionBaseAmt         DECIMAL
			,TransactionOriginalAmt     DECIMAL
			,TransactionReportingAmt    DECIMAL
			,TransactionDate            NVARCHAR(max)
			,CostTypeCode				NVARCHAR(max)
			,CostTypeDesc               NVARCHAR(max)
			,CostCategoryTypeCode		NVARCHAR(max)
			,LossOccurrenceSourceCode	NVARCHAR(max)
			,LossOccurrenceSequenceNumber NVARCHAR(max)
			,RecoveryCategoryTypeCode	 NVARCHAR(max)-----added
			,RecoveryCategoryTypeDesc    NVARCHAR(max)-----added
			,ClaimTransactionCategoryTypeCode NVARCHAR(max)
			,ClaimTransactionCategoryTypeDesc NVARCHAR(max)-----added
	

			) clt
		CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (
			WritingCompany NVARCHAR(max)  AS JSON
			,ClaimPolicySourceCode	NVARCHAR(max)
			) clp
		CROSS APPLY OPENJSON(clp.WritingCompany) WITH (
			WritingCompanySourceCode NVARCHAR(max)
			) wtc
	) AS tmp
) AS tpl
where tpl.rn = 1

GO
