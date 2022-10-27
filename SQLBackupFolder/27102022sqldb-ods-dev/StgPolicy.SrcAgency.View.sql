USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcAgency]    Script Date: 27.10.2022 12:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     VIEW [StgPolicy].[SrcAgency]
AS

SELECT
SourceSystemCode	
,SourceCode
,ProcessDateTime
,AgencyNum
,NewBusinessCommissionPct
,RenewalCommissionPct
,PartyInfoSourceCode
	,null as BrokerSourceCode			
	,LicenseNum
	,AppointmentEffectiveDate
	,AppointmentExpirationDate
	,LicenseName
	,SurplusLicenseNum
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
	,agc.AgencySourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,agc.AgencyNum
	,agc.NewBusinessCommissionPct
	,agc.RenewalCommissionPct
	,pti.PartyInfoSourceCode
	,null as BrokerSourceCode			
	,agc.LicenseNum
	,agc.AppointmentEffectiveDate
	,agc.AppointmentExpirationDate
	,agc.LicenseName
	,agc.SurplusLicenseNum
	,agc.OrganizationName
	,agc.BranchNum
	,agc.IsAppointedInd
	,agc.IsActiveInd
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	Agency NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.Agency) WITH (
	AgencySourceCode NVARCHAR(MAX)
	,BrokerSourceCode NVARCHAR(MAX)
	,AgencyNum NVARCHAR(MAX)
	,NewBusinessCommissionPct decimal(8,2)
	,RenewalCommissionPct decimal(8,2)
	,LicenseNum NVARCHAR(MAX)
	,AppointmentEffectiveDate date
	,AppointmentExpirationDate date
	,LicenseName NVARCHAR(MAX)
	,SurplusLicenseNum NVARCHAR(MAX)
	,OrganizationName NVARCHAR(MAX)
	,BranchNum NVARCHAR(MAX)
	,IsAppointedInd tinyint
	,IsActiveInd tinyint
	,PartyInfo NVARCHAR(MAX) AS JSON
	) agc
CROSS APPLY OPENJSON(agc.PartyInfo) WITH (
	PartyInfoSourceCode NVARCHAR(MAX)
	) pti
	) tmp
	)tpl
	where tpl.rn = 1
GO
