USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcClaimStatusHistory]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgClaim].[SrcClaimStatusHistory]
AS
SELECT * FROM 
	(
	SELECT *
		,row_number() OVER (PARTITION BY SourceCode, ClaimStatusCode, SequenceNum ORDER BY SourceCode) AS rn
	FROM (
		SELECT hdr.SourceSystemCode
			,csh.ClaimStatusHistorySourceCode AS SourceCode
			,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
			,clm.ClaimSourceCode AS ClaimSourceCodeSK
			,clm.ClaimNum
			,'1900-01-01' AS StartDate		-- missing in JSON
			,'3000-01-01' AS EndDate		-- missing in JSON
			,1 AS IsRowCurrentInd
		--,csh.ClaimHandlerName
			,try_convert(DATETIME, csh.OpenDate, 127) AS OpenDate
			,try_convert(DATETIME, csh.CloseDate, 127) AS CloseDate
			,csh.CloseReasonDesc
			,try_convert(DATETIME, csh.ReOpenDate, 127) AS ReOpenDate
			,csh.ReOpenReasonDesc
			,try_convert(DATETIME, clm.RecentActivityDate, 127) AS RecentActivityDate
			,csh.ClaimStatushistorySourceCode
			,csh.SequenceNum
			,csh.ClaimStatusCode
			,line.IsValidInd
		FROM StgClaim.ClaimData line
		CROSS APPLY OPENJSON(line.JsonLine) WITH (
				SourceSystemCode NVARCHAR(max)
				,ProcessDateTime NVARCHAR(max)
				,Claim NVARCHAR(max) AS JSON
				) hdr
		CROSS APPLY OPENJSON(hdr.Claim) WITH (
				OpenedDate DATE
				,ClaimSourceCode NVARCHAR(max)
				,ClaimNum NVARCHAR(max)
				,CloseDate DATE
				,ReOpenDate DATE
				,ReopenReasonDesc NVARCHAR(max)
				,RecentActivityDate NVARCHAR(max)
				,ClaimTransaction NVARCHAR(max) AS JSON
				,ClaimStatusHistory NVARCHAR(max) AS JSON
				) clm
		CROSS APPLY OPENJSON(clm.ClaimStatusHistory) WITH (
				ClaimStatusHistorySourceCode NVARCHAR(max)
				,SequenceNum DECIMAL
				,ClaimStatusCode NVARCHAR(max)
				,OpenDate DATE
				,CloseReasonDesc NVARCHAR(max)
				,CloseDate DATE
				,ReOpenReasonDesc NVARCHAR(max)
				,ReOpenDate DATE
				) csh
		) tbl
	) tmp
	WHERE tmp.rn = 1
GO
