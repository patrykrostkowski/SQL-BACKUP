USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgDM].[SrcFACTPolicyEarningsMonthly]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [StgDM].[SrcFACTPolicyEarningsMonthly] @CutOffDateFrom VARCHAR(100)
AS
DECLARE @DateFrom DATETIME = cast(@CutOffDateFrom AS DATETIME);

SELECT 
	--PolicyEarningsMonthlySK            -- Target System Generated
	--,RowCreatedBySK                    -- Target System Generated 
	--,RowLastUpdatedBySK                -- Target System Generated 
	--,RowCreatedDtm                     -- Target System Generated 
	--,RowLastUpdatedDtm                 -- Target System Generated 
	tss.SourceSystemCode as SourceSystemSKCode                     
	,fep.SourceCode                
	,fep.ProcessDateTime
	,tfr.FinancialReportingPeriodDate as AccountingMonthEndDate  
	,CONVERT(VARCHAR(7), tfr.FinancialReportingPeriodDate, 126) AS YearMonthDate
	,pta.SourceCode AS AgencySourceCode						-- to retrieve AgencyHistorySK, mapping says to map by pta.AgencyNum
	,tab.AnnualStatementLineofBusinessCode as AnnualStatementLineOfBusinessSKCode 
	,'ASLOB' AS AnnualStatementLineOfBusinessLevelCode
			,null as EndorsementNbr
	,tst.StateCode as ExposureJurisdictionSKCode 
	,'STATE' AS GeoAreaTypeCode
	,1 as FullyEarnedInd                     
	,1 as IncludedInPremiumInd  
	,null as ExposureClassCK                    
	--,ppm.FirstName			-- JOIN DIM.InsuredHistory to get InsuredHistorySK - According to mapping
	--,ppm.MiddleName			-- JOIN DIM.InsuredHistory to get InsuredHistorySK - According to mapping
	--,ppm.LastName				-- JOIN DIM.InsuredHistory to get InsuredHistorySK - According to mapping
	,ppm.SourceCode AS InsuredSourceCode			-- JOIN DIM.InsuredHistory to get InsuredHistorySK - instead of names
	,pwc.SourceCode as WritingCompanyHistorySKCode	-- mapped pwc.WritingCompanyCode
	,tlob.LineofBusinessCode as  LineofBusinessSKCode
	,'LOB' AS LineOfBusinessLevelCode				-- JOIN ProductCategoryLevel, and sk to ProductCategory
	,0 as PremiumWaivedInd   
			,null as PolicyChangeEffectiveDate          
			,null as PolicyChangeID                     
			,null as PolicyChangeProcessDtm             
			,null as PolicyChangeTypeCK      
			
	,'PREMCOVG' AS PremiumCoverageLevelCode			-- JOIN ProductCategoryLevel, and sk to ProductCategory
	,cov.CoverageCode as PremiumCoverageSKCode
	,'PREMSUBCOVG' AS PremiumSubCoverageLevelCode	-- JOIN ProductCategoryLevel, and sk to ProductCategory
	,scov.SubCoverageCode as PremiumSubCoverageSKCode

	,pol.SourceCode AS PolicySourceCode				-- to get PolicyHistorySK, mapped pol.PolicyNum
			,null as ProducingBranchHistorySK        	
			,null as ProfitCenterCK                     
			,null as ProgramSK        
			,null as StatCodeCK                         
	,fep.AssumedEarnedPremiumBaseAmt as AssumedEarnedPremiumAmt            
			,null as AssumedEarnedTFSAmt      	
			,null as AssumedFeeAmt              
			,null as AssumedInforcePremiumAmt      
			,null as AssumedInforceTFSAmt               
			,null as AssumedOriginalPremiumAmt          
			,null as AssumedOriginalTFSAmt              
			,null as AssumedSurchargeAmt                
			,null as AssumedTaxAmt               
			,null as AssumedTFSITDAmt       	
	,fep.AssumedUnearnedPremiumBaseAmt as AssumedUnearnedPremiumAmt   
			,null as AssumedUnearnedTFSAmt   
	,fep.AssumedWrittenPremiumBaseAmt as AssumedWrittenPremiumAmt           
			,null as AssumedWrittenPremiumITDAmt    
			,null as CededEarnedPremiumAmt              
			,null as CededInforcePremiumAmt             
			,null as CededUnearnedPremiumAmt            
			,null as CededWrittenPremiumAmt 
	,fep.CommissionBaseAmt as CommissionAmt                      
	,0.00 as CommissionPct						-- may be derived using CommissionBaseAmt and directpremiumbaseamt           
			,null as DirectEarnedPremiumAmt  
			,null as DirectEarnedTFSAmt                 
			,null as DirectFeeAmt            
			,null as DirectInforcePremiumAmt     
			,null as DirectInforceTFSAmt                
			,null as DirectOriginalPremiumAmt           
			,null as DirectOriginalTFSAmt               
			,null as DirectTaxAmt                       
			,null as DirectSurchargeAmt                 
			,null as DirectTFSITDAmt     
			,null as DirectUnearnedPremiumAmt        
			,null as DirectUnearnedTFSAmt               
	,fep.DirectWrittenPremiumBaseAmt as DirectWrittenPremiumAmt            
			,null as DirectWrittenPremiumITDAmt         
			,null as DiscountPremiumAmt                 
			,null as EarnedCommissionAmt                
			,null as EarnedExposureAmt                  
			,null as UnEarnedCommissionAmt              
			,null as UnearnedExposureAmt    
	
FROM Finance.EarnedPremiumDetail fep
JOIN Typelist.SourceSystem tss ON tss.SourceSystemSK = fep.SourceSystemSK
JOIN Typelist.FinancialReportingPeriod tfr ON tfr.FinancialReportingPeriodSK = fep.FinancialReportingPeriodSK
JOIN Party.Agency pta ON pta.AgencySK = fep.AgencySK
JOIN Typelist.AnnualStatementLineofBusiness tab ON tab.AnnualStatementLineofBusinessSK = fep.AnnualStatementLineofBusinessSK
JOIN Typelist.LineofBusiness tlob ON tlob.LineofBusinessSK = fep.LineofBusinessSK
JOIN Typelist.Coverage cov ON cov.CoverageSK = fep.CoverageSK
JOIN Typelist.SubCoverage scov ON scov.SubCoverageSK = fep.SubCoverageSK
JOIN Typelist.State tst ON tst.StateSK = fep.StateSK
JOIN Party.Insured pis ON pis.InsuredSK = fep.InsuredSK
JOIN Party.PartyMaster ppm ON ppm.PartySK = pis.PartySK
JOIN Party.WritingCompany pwc ON pwc.WritingCompanySK = fep.WritingCompanySK
JOIN Policy.Policy pol ON pol.PolicySK = fep.PolicySK

WHERE fep.ETLUpdateDateTime > @DateFrom




GO
