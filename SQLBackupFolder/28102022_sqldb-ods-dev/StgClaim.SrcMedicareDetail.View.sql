USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcMedicareDetail]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    VIEW [StgClaim].[SrcMedicareDetail]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT hdr.SourceSystemCode
       ,convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	   ,cmt.ClaimantSourceCode
	   ,cmd.MedicareDetailSourceCode   AS SourceCode
	   ,cmd.LitigationSourceCode  
	   ,cmd.MedicareHealthInsuranceClaimNum
	   ,cmd.IsAcceptanceOfResponsibilityInd
	   ,cmd.DocumentControlNum   
	   ,Convert(DATETIME, cmd.AcceptanceOfResponsibilityDate, 127) AS AcceptanceOfResponsibilityDate
	   ,Convert(DATETIME, cmd.TotalPaymentObligationDate,     127) AS TotalPaymentObligationDate
	   ,1 As IsLitigationInd
	   ,line.IsValidInd

FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.Jsonline) WITH (
     SourceSystemCode NVARCHAR(max)
	,ProcessDateTime  NVARCHAR(max)
	,Claim            NVARCHAR(max)  AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
    Claimant  NVARCHAR(max)  AS JSON
	) clm
CROSS APPLY OPENJSON(clm.Claimant) WITH (
    ClaimantSourceCode NVARCHAR(max)
   ,MedicareDetail     NVARCHAR(max)  AS JSON
   )cmt
CROSS APPLY OPENJSON(cmt.MedicareDetail) WITH (
     MedicareDetailSourceCode         NVARCHAR(max)
	,LitigationSourceCode             NVARCHAR(max)
	,MedicareHealthInsuranceClaimNum  NVARCHAR(max)
	,IsAcceptanceOfResponsibilityInd  INT
	,AcceptanceOfResponsibilityDate   NVARCHAR(max)
	,DocumentControlNum               NVARCHAR(max)
	,TotalPaymentObligationDate       NVARCHAR(max)
	,IsLitigationInd                  INT
	)cmd
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
