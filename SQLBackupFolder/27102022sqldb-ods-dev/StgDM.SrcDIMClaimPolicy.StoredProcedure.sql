USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcDIMClaimPolicy]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   PROC [StgDM].[SrcDIMClaimPolicy] @CutOffDateFrom VARCHAR(100)
AS	
DECLARE @DateFrom DATETIME = CAST(@CutOffDateFrom AS DATETIME)

		SELECT
			--ClaimPolicySK                         -- system generated
			--,RowCreatedBySK                       -- system generated
			--,RowLastUpdateBySK                    -- system generated
			--,RowCreatedDtm                        -- system generated
			--,RowLastUpdateDtm                     -- system generated
			tps.SourceSystemCode
			,pss.SourceSystemCode as PolicySourceSystemCode
			,ccp.SourceCode
			,CAST('1900-01-01' AS DATETIME) as RowEffectiveFromDate		-- default, system generated			   
			,CAST('3000-01-01' AS DATETIME) as RowEffectiveToDate		-- default, system generated
			,ccp.ProcessDateTime
			,ccp.EffectiveDate
			,ccp.ExpirationDate 
			,ccp.PolicyNum as PolicyNbr	
			,pol.SourceCode as PolicySourceCode
			--,PolicyTermID							-- JOIN DIMPolicyHistory, populated by PolicySourceCode and date condition	in ADF							
			--,PolicyHistorySK						-- JOIN DIMPolicyHistory, populated by PolicySourceCode and date condition in ADF
			,ccp.EffectiveDate as PolicyTermEffectiveDate						
			,ccp.ExpirationDate as PolicyTermExpirationDate					
			,lob.LineofBusinessCode     
			,'INSURTYP' AS ProductCategoryLevelCode

			,IIF(ccl.StateSK IS NULL, tcn.CountryCode, tss.StateCode) AS ExposureJurisdictionSKCode
			,IIF(ccl.StateSK IS NULL, 'CNTRY', 'STATE') AS  ExposureJurisdictionLevelCode
			,pin.SourceCode as InsuredHistorySKCode
			,pwc.SourceCode as WritingCompanyHistorySKCode			-- JOIN DIMWritingCompanyHistory	
		FROM Claim.ClaimPolicy ccp
		JOIN Typelist.SourceSystem tps ON tps.SourceSystemSK = ccp.SourceSystemSK
		LEFT JOIN Policy.Policy pol ON pol.PolicyNum = ccp.PolicyNum
			AND ccp.EffectiveDate >= pol.EffectiveDate
			AND	ccp.ExpirationDate <= pol.ExpirationDate
		LEFT JOIN Party.WritingCompany pwc ON pwc.WritingCompanySK = pol.WritingCompanySK
		LEFT JOIN Party.Insured pin ON pin.InsuredSK = pol.InsuredSK
		LEFT JOIN Claim.ClaimRelationship ccr ON ccr.ClaimPolicySK = ccp.ClaimPolicySK
		LEFT JOIN Claim.ClaimLocation ccl ON ccl.ClaimSK = ccr.ClaimSK
		LEFT JOIN Typelist.State tss ON tss.StateSK = ccl.StateSK
		LEFT JOIN Typelist.Country tcn ON tcn.CountrySK = ccl.CountrySK
		LEFT JOIN Typelist.LineofBusiness lob ON lob.LineofBusinessSK = ccp.LineofBusinessSK
		join Typelist.SourceSystem pss on pss.SourceSystemSK = pol.SourceSystemSK
	
WHERE ccp.ETLUpdateDateTime > @DateFrom

GO
