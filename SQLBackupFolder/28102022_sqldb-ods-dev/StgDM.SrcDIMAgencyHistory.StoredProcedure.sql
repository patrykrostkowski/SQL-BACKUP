USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcDIMAgencyHistory]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgDM].[SrcDIMAgencyHistory] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = CAST(@CutOffDateFrom AS DATETIME)

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemSKCode,SourceCode ORDER BY SourceCode DESC) AS rn
	FROM (
		SELECT 
			agn.SourceCode
			,src.SourceSystemCode AS SourceSystemSKCode
			,agn.ProcessDateTime AS HistoricalSnapshotEffectiveFromDtm
			,CAST('3000-01-01' AS DATETIME) AS HistoricalSnapshotEffectiveToDtm
			,agn.AgencyNum AS AgencyNbr
			,CASE 
				WHEN agn.OrganizationName IS NOT NULL
					THEN agn.OrganizationName
				ELSE CASE 
						WHEN agn.OrganizationName IS NULL
							THEN pma.LegalName
						ELSE CASE 
								WHEN pma.LegalName IS NULL
									THEN pma.FullName
								ELSE NULL
								END
						END
				END AS AgencyName
				,NULL AS DoingBusinessAsName
				,NULL AS LegacyAgencyCode
				,NULL AS AgencyLicenseID
				,NULL AS NationalTaxID
				,NULL AS AgencyAppointmentStatusCK
				,NULL AS AgencyContractTypeCK
				,NULL AS AgencyMainPhoneNbr
				,NULL AS AgencyTypeCK
			,CAST(NULL AS DATE) AS AppointmentEffectiveDate
			,CAST(NULL AS DATE) AS AppointmentExpirationDate
				,NULL AS CommissionPct
			,CAST(NULL AS DATE) AS ContractDate
				,NULL AS MarketSegmentCK
				,NULL AS MarketTerritorySK
				,NULL AS NorthAmericanIndustryClassificationCode
				,NULL AS ProducingBranchSK
				,NULL AS ProducingBranchCode
				,NULL AS ProducingBranchName
				,NULL AS ProfitCenterCK
				,NULL AS TerminationDate
				,NULL AS AddressLine1
				,NULL AS AddressLine2
			,cpa.CityName
			,'STATE' AS StateType
				,NULL AS StateAbrv
				,NULL AS StateName
			,cpa.PostalCode
			,sta.StateCode
		FROM Party.Agency agn
		JOIN Typelist.SourceSystem src ON agn.SourceSystemSK = src.SourceSystemSK
		LEFT JOIN Party.PartyMaster pma ON agn.PartySK = pma.PartySK
		LEFT JOIN Party.ContactPoint ctp ON ctp.PartySK = pma.PartySK
		LEFT JOIN Party.ContactPointAddress cpa ON cpa.ContactPointSK = ctp.ContactPointSK
		LEFT JOIN Typelist.STATE sta ON sta.StateSK = cpa.StateSK
		WHERE agn.ETLUpdateDateTime > @DateFrom

		) tpl
	) rn

WHERE rn.rn = 1

GO
