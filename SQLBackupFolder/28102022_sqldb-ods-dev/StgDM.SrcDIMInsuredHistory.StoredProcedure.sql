USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcDIMInsuredHistory]    Script Date: 28.10.2022 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    PROCEDURE [StgDM].[SrcDIMInsuredHistory] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME)

SELECT 
	pid.SourceCode AS SourceCode
	,pid.ProcessDateTime AS HistoricalSnapshotEffectiveFromDtm
--	,tcp.ContactPointTypeSK
--	,ctp.ContactPointSK
	,cast('3000-01-01' AS DATETIME) AS HistoricalSnapshotEffectiveToDtm
	,src.SourceSystemCode AS SourceSystemCode
		,cast(NULL AS VARCHAR(30)) AS PartyTypeCKCode
		,cast(NULL AS VARCHAR(30)) AS FirstName
		,cast(NULL AS VARCHAR(30)) AS MiddleName
		,cast(NULL AS VARCHAR(30)) AS LastName
		,cast(NULL AS VARCHAR(75)) AS DoingBusinessAsName
	,isnull(pmr.LegalName, pmr.FullName) AS FullLegalName
		,cast(NULL AS VARCHAR(75)) AS OrganizationName
		,cast(NULL AS VARCHAR(25)) AS NationalTaxID
		,cast(NULL AS VARCHAR(30)) AS GenderCKCode
		,cast(NULL AS VARCHAR(25)) AS PhoneNumber
		,cast(NULL AS VARCHAR(80)) AS AddressLine1
		,cast(NULL AS VARCHAR(80)) AS AddressLine2
		,cast(NULL AS VARCHAR(75)) AS CityName
		,cast(NULL AS VARCHAR(30)) AS StateSKCode
	--,cpa.PostalCode AS PostalCode
		,cast(NULL AS VARCHAR(30)) AS CountrySKCode
		,cast(NULL AS VARCHAR(30)) AS MarketTerritorySKCode
		,cast(NULL AS VARCHAR(25)) AS AMBestInsuredID
		,cast(NULL AS VARCHAR(25)) AS NAICSInsuredID
		,cast(NULL AS VARCHAR(25)) AS SICSInsuredID
	,pid.ETLCreateDateTime
	,pid.ETLUpdateDateTime
FROM Party.Insured pid
JOIN Typelist.SourceSystem src ON pid.SourceSystemSK = src.SourceSystemSK
JOIN Party.PartyMaster pmr ON pmr.PartySK = pid.PartySK

WHERE pid.ETLUpdateDateTime > @DateFrom
GO
