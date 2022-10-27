USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimPayment]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE     VIEW [StgClaim].[SrcClaimPayment]
AS
SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT  
	 hdr.SourceSystemCode
	,clp.ClaimPayentSourceCode as SourceCode
	,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,cast(clp.PaymentDate as date) AS FinancialReportingPeriodSKCode
	,cts.ClaimTransactionSourceCode AS ClaimtransactionSourceSKCode
	,clp.TransactionStatusCode AS TransactionStatusSKCode
	,clp.ClaimantSourceCode AS ClaimantSourceSKCode
	,clp.SequenceNum
	,clp.CheckTypeCode AS CheckTypeSKCode
	,clp.InvoiceNum
	,clp.CheckNum
	,clp.PayeeName
	,clp.PayeeTypeCode AS PayeeTypeSKCode
	,clp.PaymentMethodCode AS PaymentMethodSKCode
	,clp.BankAccountCode AS BankAccountSKCode
	,clp.BankAccountTypeCode AS BankAccountTypeSKCode
	,clp.BankRoutingNum
	,clp.PaymentDate
	,clp.MailToName
	,clp.MailToAddress
	,clp.IsReportabldeInd
	,clp.ReportableAmt
	,clp.CommentTxt
	,clp.CheckDate
	,clt.ClaimantSourceCode
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(max)
	,ProcessDateTime NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	ClaimTransaction NVARCHAR(max) AS JSON
	,Claimant nvarchar(max) as json
	) clm
	cross apply openjson(clm.Claimant) with(
	ClaimantSourceCode nvarchar(max)
	) clt
CROSS APPLY OPENJSON(clm.ClaimTransaction) WITH (
	ClaimTransactionSourceCode NVARCHAR(max)
	,ClaimPayment NVARCHAR(max) AS JSON
	) cts
CROSS APPLY OPENJSON(cts.ClaimPayment) WITH (
	 InvoiceNum NVARCHAR(max)
	,ClaimantSourceCode NVARCHAR(max)
	,MailToName NVARCHAR(max)
	,ClaimantNum NVARCHAR(max)
	,FinancialReportingPeriodNum NVARCHAR(max)
	,CheckTypeCode NVARCHAR(max)
	,IsReportabldeInd NVARCHAR(max)
	,TransactionStatusDesc NVARCHAR(max)
	,CheckNum NVARCHAR(max)
	,BankRoutingNum NVARCHAR(max)
	,BankAccountCode NVARCHAR(max)
	,MailToAddress NVARCHAR(max)
	,CommentTxt NVARCHAR(max)
	,PayeeTypeDesc NVARCHAR(max)
	,BankAccountTypeDesc NVARCHAR(max)
	,PaymentMethodDesc NVARCHAR(max)
	,TransactionStatusCode NVARCHAR(max)
	,PayeeName NVARCHAR(max)
	,BankAccountTypeCode NVARCHAR(max)
	,ReportableAmt DECIMAL
	,BankAccountDesc NVARCHAR(max)
	,ClaimPayentSourceCode NVARCHAR(max)
	,SequenceNum NVARCHAR(max)
	,PaymentDate DATETIME
	,PayeeTypeCode NVARCHAR(max)
	,CheckTypeDesc NVARCHAR(max)
	,PaymentMethodCode NVARCHAR(max)
	,CheckDate DATETIME
	) clp
				) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
