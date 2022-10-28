USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimRelationship]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   VIEW [StgClaim].[SrcClaimRelationship]
AS
SELECT  hdr.SourceSystemCode
	   ,clm.ClaimSourceCode 
	   ,clm.ClaimNum
	   ,NULL AS SequenceNum
	   ,Null AS ActivityDate
	   ,NULL AS IsCurrentInd
	   ,loe.LossEventSourceCode
	   ,clp.ClaimPolicySourceCode
	   ,loc.LossOccurrenceSourceCode
	   ,clp.PolicyNum   
	   ,line.IsValidInd

FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Claim) WITH (
	ClaimSourceCode NVARCHAR(max)
	,ClaimNum       NVARCHAR(max)
	,ClaimPolicy    NVARCHAR(max) AS JSON
	,LossEvent      NVARCHAR(max) AS JSON
	) clm		 
CROSS APPLY OPENJSON(clm.ClaimPolicy) WITH (
    ClaimPolicySourceCode NVARCHAR(max) 
	,PolicyNum            NVARCHAR(max) 
	) clp
CROSS APPLY OPENJSON(clm.LossEvent) WITH (
     LossEventSourceCode  NVARCHAR(max)
	 ,LossOccurrence NVARCHAR(max) AS JSON
	 ) loe
CROSS APPLY OPENJSON(loe.LossOccurrence) WITH (
     LossOccurrenceSourceCode   NVARCHAR(max)
	 )loc
GO
