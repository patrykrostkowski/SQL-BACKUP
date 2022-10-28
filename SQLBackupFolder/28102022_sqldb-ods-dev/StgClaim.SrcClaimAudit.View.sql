USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimAudit]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE    VIEW [StgClaim].[SrcClaimAudit]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT  hdr.SourceSystemCode
       ,Convert(DATETIME, hdr.ProcessDateTime, 127)  AS ProcessDateTime
	   ,clm.ClaimSourceCode 
	   ,cmt.ClaimantSourceCode 
	   ,cat.ClaimAuditSourceCode AS SourceCode
	   ,cat.AuditTransactionCode
	   ,cat.AuditDesc 
	   ,Convert(DATETIME, cat.EventDateTime,  127) AS   EventDateTime 
	   ,cmp.ClaimPolicySourceCode
	   ,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.Jsonline) WITH (
    SourceSystemCode     NVARCHAR(max)
	,ProcessDateTime     NVARCHAR(max)
	,Claim               NVARCHAR(max)  AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim)  WITH (
     ClaimSourceCode      NVARCHAR(max)
	,Claimant             NVARCHAR(max)  AS JSON
	,ClaimPolicy          NVARCHAR(max)  AS JSON
	 )clm
CROSS APPLY OPENJSON(clm.Claimant) WITH (
     ClaimantSourceCode   NVARCHAR(max)
	,ClaimAudit           NVARCHAR(max)  AS JSON
	) cmt
CROSS APPLY OPENJSON(cmt.ClaimAudit) WITH (
     ClaimAuditSourceCode NVARCHAR(max)
	,AuditTransactionCode NVARCHAR(max) 
	,EventDateTime        NVARCHAR(max) 
	,AuditDesc            NVARCHAR(max) 
	) cat
CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (
    ClaimPolicySourceCode NVARCHAR(max) 
	) cmp

	) AS tmp
		) AS tpl
	where tpl.rn = 1
GO
