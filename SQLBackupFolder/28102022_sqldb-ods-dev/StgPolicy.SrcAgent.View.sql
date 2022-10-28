USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcAgent]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgPolicy].[SrcAgent]
AS

SELECT
SourceSystemCode	
,SourceCode
,ProcessDateTime
,AgencySourceCode
,PartyInfoSourceCode
,LicenseNum 
,LicenseName 
,SurplusLicenseNum 
,FirstName 
,MiddleName 
,LastName 
,FullName 
,OrganizationName 
,BranchNum 
,IsAppointedInd
,IsActiveInd 
,IsValidInd

FROM (
SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
		FROM(
SELECT 
	hdr.SourceSystemCode
	,agt.AgentSourceCode AS SourceCode
	,agt.AgencySourceCode	
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,pti.PartyInfoSourceCode
	,agt.LicenseNum 
	,agt.LicenseName 
	,agt.SurplusLicenseNum 
	,agt.FirstName 
	,agt.MiddleName 
	,agt.LastName 
	,agt.FullName 
	,agt.OrganizationName 
	,agt.BranchNum 
	,agt.IsAppointedInd
	,agt.IsActiveInd 
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.MiscParty) WITH (
	PartyInfo NVARCHAR(MAX) AS JSON
	) mpt
CROSS APPLY OPENJSON(mpt.PartyInfo) WITH (
	PartyInfoSourceCode NVARCHAR(MAX)
	,PartyRole NVARCHAR(MAX) AS JSON
	) pti
CROSS APPLY OPENJSON(pti.PartyRole) WITH (
	Agent NVARCHAR(MAX) AS JSON
	) prl
CROSS APPLY OPENJSON(prl.Agent) WITH (
	AgentSourceCode NVARCHAR(MAX)
	,AgencySourceCode NVARCHAR(MAX)
	,LicenseNum NVARCHAR(MAX)
	,LicenseName NVARCHAR(MAX)
	,SurplusLicenseNum NVARCHAR(MAX)
	,FirstName NVARCHAR(MAX)
	,MiddleName NVARCHAR(MAX)
	,LastName NVARCHAR(MAX)
	,FullName NVARCHAR(MAX)
	,OrganizationName NVARCHAR(MAX)
	,BranchNum NVARCHAR(MAX)
	,IsAppointedInd INT
	,IsActiveInd INT
	) agt
	) tmp
	)tpl
	where tpl.rn = 1
GO
