USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcFACTClaimPaymentTrans]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create      procedure [StgDM].[SrcFACTClaimPaymentTrans] @CutOffDateFrom varchar(100)
as

declare @DateFrom datetime = cast(@CutOffDateFrom as datetime)

SELECT clp.SourceCode
	,clp.ProcessDateTime
	,src.SourceSystemCode as SourceSystemCode
	,clp.InvoiceNum as ProductCategorySourceCode
	,clp.CheckNum as PolicyHistorySourceCode
	,clt.TransactionBaseAmt as PaymentTransactionAmt
	,clp.ETLCreateDateTime
	,clp.ETLUpdateDateTime
  FROM Finance.ClaimPayment clp
  join Typelist.SourceSystem src on clp.SourceSystemSK = src.SourceSystemSK
  join Finance.ClaimTransaction clt on clt.ClaimTransactionSK = clp.ClaimTransactionSK
  where clp.ETLUpdateDateTime > @DateFrom
 
GO
