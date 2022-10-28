USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcPartyEmployee]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE      VIEW [StgPolicy].[SrcPartyEmployee]
AS


SELECT
	SourceSystemCode	
	,SourceCode
	,ProcessDateTime
	,PartySourceCode
	,EmployeeNum	  
	,HireDate		  
	,ServiceDate	  
	,TerminationDate  


	,DepartmentCode
	,DepartmentDesc
	,EmployeeTypeCode 
	,FullTimeInd	
	,OccupationCode	
	,SocialSecurityNum
	,OccupationDesc
	,PartyRoleCode
	,a.IsValidInd
FROM
(
SELECT 
	hdr.SourceSystemCode	
	,pti.PartyInfoSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode AS PartySourceCode
	,pti.EmployeeNum	  --no data in JSON FILE
	,pti.HireDate		  --no data in JSON FILE
	,pti.ServiceDate	  --no data in JSON FILE
	,pti.TerminationDate  --no data in JSON FILE


	,pol.DepartmentCode
	,pol.DepartmentDesc
	,pti.PartyTypeCode AS EmployeeTypeCode --?
	,pti.FullTimeInd	--no data in JSON FILE
	,pti.OccupationCode	--no data in JSON FILE
	,pti.SocialSecurityNum
	,pti.OccupationDesc
	,ptr.PartyRoleCode
	,line.IsValidInd
FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		Policy NVARCHAR(MAX) AS JSON
		,SourceSystemCode NVARCHAR(MAX)
		,SourceSystemDesc NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Account NVARCHAR(MAX) AS JSON
	,DepartmentCode NVARCHAR(MAX)
	,DepartmentDesc NVARCHAR(MAX)
	) pol	
	CROSS APPLY OPENJSON(pol.Account) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
	CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
		PartyInfoSourceCode NVARCHAR(MAX)
		,PartyTypeCode NVARCHAR(MAX)
		,PartyTypeDesc NVARCHAR(MAX)
		,PartyTypeCode NVARCHAR(MAX)
		,SocialSecurityNum NVARCHAR(MAX)
		,OccupationDesc NVARCHAR(MAX)
		,EmployeeNum NVARCHAR(MAX)
		,HireDate NVARCHAR(MAX)
		,ServiceDate NVARCHAR(MAX)
		,TerminationDate NVARCHAR(MAX)
		,FullTimeInd NVARCHAR(MAX)	
		,OccupationCode NVARCHAR(MAX)
		,PartyRole NVARCHAR(MAX) AS JSON
		) pti
	OUTER APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
	) ptr

UNION ALL 

SELECT 
	hdr.SourceSystemCode	
	,pti.PartyInfoSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode AS PartySourceCode
	,pti.EmployeeNum	  --no data in JSON FILE
	,pti.HireDate		  --no data in JSON FILE
	,pti.ServiceDate	  --no data in JSON FILE
	,pti.TerminationDate  --no data in JSON FILE


	,pol.DepartmentCode
	,pol.DepartmentDesc
	,pti.PartyTypeCode AS EmployeeTypeCode --?
	,pti.FullTimeInd	--no data in JSON FILE
	,pti.OccupationCode	--no data in JSON FILE
	,pti.SocialSecurityNum
	,pti.OccupationDesc
	,ptr.PartyRoleCode
	,line.IsValidInd
FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		Policy NVARCHAR(MAX) AS JSON
		,SourceSystemCode NVARCHAR(MAX)
		,SourceSystemDesc NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Agency NVARCHAR(MAX) AS JSON
	,DepartmentCode NVARCHAR(MAX)
	,DepartmentDesc NVARCHAR(MAX)
	) pol	
	CROSS APPLY OPENJSON(pol.Agency) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
	CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
		PartyInfoSourceCode NVARCHAR(MAX)
		,PartyTypeCode NVARCHAR(MAX)
		,PartyTypeDesc NVARCHAR(MAX)
		,PartyTypeCode NVARCHAR(MAX)
		,SocialSecurityNum NVARCHAR(MAX)
		,OccupationDesc NVARCHAR(MAX)
		,EmployeeNum NVARCHAR(MAX)
		,HireDate NVARCHAR(MAX)
		,ServiceDate NVARCHAR(MAX)
		,TerminationDate NVARCHAR(MAX)
		,FullTimeInd NVARCHAR(MAX)	
		,OccupationCode NVARCHAR(MAX)
		,PartyRole NVARCHAR(MAX) AS JSON
		) pti
	OUTER APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
	) ptr

UNION ALL

SELECT 
	hdr.SourceSystemCode	
	,pti.PartyInfoSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode AS PartySourceCode
	,pti.EmployeeNum	  --no data in JSON FILE
	,pti.HireDate		  --no data in JSON FILE
	,pti.ServiceDate	  --no data in JSON FILE
	,pti.TerminationDate  --no data in JSON FILE


	,pol.DepartmentCode
	,pol.DepartmentDesc
	,pti.PartyTypeCode AS EmployeeTypeCode --?
	,pti.FullTimeInd	--no data in JSON FILE
	,pti.OccupationCode	--no data in JSON FILE
	,pti.SocialSecurityNum
	,pti.OccupationDesc
	,ptr.PartyRoleCode
	,line.IsValidInd
FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		Policy NVARCHAR(MAX) AS JSON
		,SourceSystemCode NVARCHAR(MAX)
		,SourceSystemDesc NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Insured NVARCHAR(MAX) AS JSON
	,DepartmentCode NVARCHAR(MAX)
	,DepartmentDesc NVARCHAR(MAX)
	) pol	
	CROSS APPLY OPENJSON(pol.Insured) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
	CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
		PartyInfoSourceCode NVARCHAR(MAX)
		,PartyTypeCode NVARCHAR(MAX)
		,PartyTypeDesc NVARCHAR(MAX)
		,PartyTypeCode NVARCHAR(MAX)
		,SocialSecurityNum NVARCHAR(MAX)
		,OccupationDesc NVARCHAR(MAX)
		,EmployeeNum NVARCHAR(MAX)
		,HireDate NVARCHAR(MAX)
		,ServiceDate NVARCHAR(MAX)
		,TerminationDate NVARCHAR(MAX)
		,FullTimeInd NVARCHAR(MAX)	
		,OccupationCode NVARCHAR(MAX)
		,PartyRole NVARCHAR(MAX) AS JSON
		) pti
	OUTER APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
	) ptr

UNION ALL

SELECT 
	hdr.SourceSystemCode	
	,pti.PartyInfoSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,pti.PartyInfoSourceCode AS PartySourceCode
	,pti.EmployeeNum	  --no data in JSON FILE
	,pti.HireDate		  --no data in JSON FILE
	,pti.ServiceDate	  --no data in JSON FILE
	,pti.TerminationDate  --no data in JSON FILE


	,pol.DepartmentCode
	,pol.DepartmentDesc
	,pti.PartyTypeCode AS EmployeeTypeCode --?
	,pti.FullTimeInd	--no data in JSON FILE
	,pti.OccupationCode	--no data in JSON FILE
	,pti.SocialSecurityNum
	,pti.OccupationDesc
	,ptr.PartyRoleCode
	,line.IsValidInd
FROM StgPolicy.PolicyData line
	CROSS APPLY OPENJSON(line.JsonLine) WITH (
		Policy NVARCHAR(MAX) AS JSON
		,SourceSystemCode NVARCHAR(MAX)
		,SourceSystemDesc NVARCHAR(MAX)
		,ProcessDateTime NVARCHAR(MAX)
		) hdr
	CROSS APPLY OPENJSON(hdr.Policy) WITH (
	MiscParty NVARCHAR(MAX) AS JSON
	,DepartmentCode NVARCHAR(MAX)
	,DepartmentDesc NVARCHAR(MAX)
	) pol	
	CROSS APPLY OPENJSON(pol.MiscParty) WITH (PartyInfo NVARCHAR(MAX) AS JSON) acc
	CROSS APPLY OPENJSON(acc.PartyInfo) WITH (
		PartyInfoSourceCode NVARCHAR(MAX)
		,PartyTypeCode NVARCHAR(MAX)
		,PartyTypeDesc NVARCHAR(MAX)
		,PartyTypeCode NVARCHAR(MAX)
		,SocialSecurityNum NVARCHAR(MAX)
		,OccupationDesc NVARCHAR(MAX)
		,EmployeeNum NVARCHAR(MAX)
		,HireDate NVARCHAR(MAX)
		,ServiceDate NVARCHAR(MAX)
		,TerminationDate NVARCHAR(MAX)
		,FullTimeInd NVARCHAR(MAX)	
		,OccupationCode NVARCHAR(MAX)
		,PartyRole NVARCHAR(MAX) AS JSON
		) pti
	OUTER APPLY OPENJSON(pti.PartyRole) WITH (
		PartyRoleCode NVARCHAR(MAX)
	) ptr
)a
WHERE a.PartyRoleCode IN (SELECT RoleCode FROM Config.EmployeeRoleConfig) AND a.SourceSystemCode IN (SELECT SourceSystemCode FROM Config.EmployeeRoleConfig)

GO
