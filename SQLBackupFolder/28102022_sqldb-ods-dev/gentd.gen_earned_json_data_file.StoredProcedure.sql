USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [gentd].[gen_earned_json_data_file]    Script Date: 28.10.2022 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [gentd].[gen_earned_json_data_file] as 

delete from [StgPolicy].[EarningsDataInput] where FileName = 'EP'
/*
This query generates sample earnings data.

The query pulls premium from the coverage/subcoverage level with all necessary earnings attributes
This is unioned to commissions from various locations available in Data Magnifier

It joins to the CTE "AccountingPeriods" that is just a group by of months from the financialsreportingperiod typelist

Then, by joining to the FinancialsReportingPeriod by date for all dates within the coverage period, the query generates a pro-rata calculation by divding the premium
by the number of days the premium is allocated to in the financial period.

This method allows for shaping earnings by excluding weekends, holidays, etc. in the periods
Rounding is handled at the end by adjusting the last period


*/

;WITH AccountingPeriods (FinancialReportingPeriod, StartDate, EndDate)
AS (SELECT FinancialReportingPeriod.FinancialReportingPeriodYearMonthLabelYYYYMMAbrv AS FinancialReportingPeriod
	, MIN(FinancialReportingPeriod.FinancialReportingPeriodDate) AS StartDate
	, MAX(FinancialReportingPeriod.FinancialReportingPeriodDate) AS EndDate
	FROM Typelist.FinancialReportingPeriod
	GROUP BY FinancialReportingPeriod.FinancialReportingPeriodYearMonthLabelYYYYMMAbrv 
	)
, CoverageAndCommissions (SourceSystemCode,SourceSystemDesc,EarnedPremiumDetailSourceCode,ProcessDateTime,PolicySourceCode,PolicyNum,PolicyEffectiveDate,PolicyExpirationDate
,PolicyTransSourceCode,PolicyTransNum,PolicyTransEffectiveDate,PolicyTransExpirationDate,PolicyTransTypeCode,PolicyTransTypeDesc,LineofBusinessCode
,LineofBusinessDesc,CoverageCode,CoverageDesc,AnnualStatementLineofBusinessCode,AnnualStatementLineofBusinessDesc,ClassCode,ClassCodeDesc,StatCode
,StatCodeDesc,SubCoverageCode,SubCoverageDesc,CountryCode,CountryDesc,StateCode,StateDesc,InsuredSourceCode,InsuredName,AgencySourceCode,AgencyNum
,WritingCompanyCode,WritingCompanyName,ProfitAnalysisCode,ProfitAnalysisDesc,BaseCurrencyCode,BaseCurrencyDesc,IsFullyEarnedInd,IsPremiumWaivedInd
,IsIncludedInPremiumInd,DirectWrittenPremiumBaseAmt,DirectTaxBaseAmt,DirectSurchargeBaseAmt,DirectFeeBaseAmt,DirectWrittenPremiumITDBaseAmt,DirectTaxSurchargeFeeITDBaseAmt
,WrittenPremiumOriginalAmt,WrittenPremiumReportingAmt,DirectEarnedPremiumBaseAmt,DirectEarnedTaxSurchargeFeeBaseAmt,AssumedWrittenPremiumBaseAmt,AssumedTaxBaseAmt
,AssumedFeeBaseAmt,AssumedSurchargeBaseAmt,AssumedWrittenPremiumITDBaseAmt,AssumedTaxSurchargeFeeITDBaseAmt,AssumedEarnedPremiumBaseAmt,AssumedEarnedTaxSurchargeFeeBaseAmt
,AssumedUnearnedPremiumBaseAmt,AssumedUnearnedTaxSurchargeFeeBaseAmt,CededPremiumBaseAmt,CededEarnedPremiumBaseAmt,CededUnearnedPremiumBaseAmt,CommissionBaseAmt,EarnedCommissionBaseAmt
,CommissionPct,DirectExposureBaseAmt,AssumedExposureBaseAmt,EarnedExposureBaseAmt,UnearnedExposureBaseAmt,CoverageEffectiveDate,CoverageExpirationDate,CancellationDate,EarnKey)
AS (
--Premium
SELECT
	SourceSystem.SourceSystemCode
	, SourceSystem.SourceSystemName AS SourceSystemDesc
	, PolicyCoverage.SourceCode + COALESCE(PolicySubCoverage.SourceCode,'') AS EarnedPremiumDetailSourceCode
	, GETDATE() AS ProcessDateTime
	, Policy.SourceCode AS PolicySourceCode
	, Policy.PolicyNum AS PolicyNum
	, Policy.EffectiveDate AS PolicyEffectiveDate
	, Policy.ExpirationDate AS PolicyExpirationDate
	, PolicyTrans.SourceCode AS PolicyTransSourceCode
	, PolicyTrans.PolicyTransNum AS PolicyTransNum
	, PolicyTrans.TransStartDatetime AS PolicyTransEffectiveDate
	, PolicyTrans.TransEndDatetime AS PolicyTransExpirationDate
	, PolicyTransType.PolicyTransTypeCode AS PolicyTransTypeCode
	, PolicyTransType.PolicyTransTypeName AS PolicyTransTypeDesc
	, LineofBusiness.LineofBusinessCode AS LineofBusinessCode
	, LineofBusiness.LineofBusinessName AS LineofBusinessDesc
	, Coverage.CoverageCode AS CoverageCode
	, Coverage.CoverageName AS CoverageDesc
	, AnnualStatementLineofBusiness.AnnualStatementLineofBusinessCode AS AnnualStatementLineofBusinessCode
	, AnnualStatementLineofBusiness.AnnualStatementLineofBusinessName AS AnnualStatementLineofBusinessDesc
	, ClassCode.ClassCode AS ClassCode
	, ClassCode.ClassCodeDesc AS ClassCodeDesc
	, StatCode.StatCode AS StatCode
	, StatCode.StatCodeDesc AS StatCodeDesc
	, SubCoverage.SubCoverageCode AS SubCoverageCode
	, SubCoverage.SubCoverageName AS SubCoverageDesc
	, Country.CountryCode AS CountryCode
	, Country.CountryName AS CountryDesc
	, State.StateCode AS StateCode
	, State.StateName AS StateDesc
	, Insured.SourceCode AS InsuredSourceCode
	, InsuredPartyMaster.FullName AS InsuredName
	, Agency.SourceCode AS AgencySourceCode
	, Agency.AgencyNum AS AgencyNum
	, WritingCompany.WritingCompanyCode AS WritingCompanyCode
	, WritingCompany.WritingCompanyName AS WritingCompanyName
	, '' AS ProfitAnalysisCode
	, '' AS ProfitAnalysisDesc
	, COALESCE(SubCoverageCurrency.CurrencyCode,CoverageCurrency.CurrencyCode) AS BaseCurrencyCode
	, COALESCE(SubCoverageCurrency.CurrencyName,CoverageCurrency.CurrencyName) AS BaseCurrencyDesc
	, 0 AS IsFullyEarnedInd
	, (SELECT MAX(IsPremiumWaivedInd) FROM (VALUES (Policy.IsPremiumWaivedInd),(PolicyTrans.IsPremiumWaivedInd),(PolicySubLine.IsPremiumWaivedInd)) AS AllWaivedIndicators(IsPremiumWaivedInd)) AS IsPremiumWaivedInd
	, PolicyCoverage.IsIncludedInPremiumInd AS IsIncludedInPremiumInd

	--These seem wrong v
	, COALESCE(PolicySubCoverage.WrittenPremiumBaseAmt,PolicyCoverage.WrittenPremiumBaseAmt) AS DirectWrittenPremiumBaseAmt
	, (SELECT SUM(CoveragefeeBaseAmt) FROM Policy.PolicyCoverageFee WHERE PolicyCoverageFee.PolicyCoverageSK = PolicyCoverage.PolicyCoverageSK) AS DirectTaxBaseAmt
	, (SELECT SUM(CoveragefeeBaseAmt) FROM Policy.PolicyCoverageFee WHERE PolicyCoverageFee.IsSurchargeInd = 1 AND PolicyCoverageFee.PolicyCoverageSK = PolicyCoverage.PolicyCoverageSK) AS DirectSurchargeBaseAmt
	, (SELECT SUM(CoveragefeeBaseAmt) FROM Policy.PolicyCoverageFee WHERE PolicyCoverageFee.PolicyCoverageSK = PolicyCoverage.PolicyCoverageSK) AS DirectFeeBaseAmt
	--These seem wrong ^

	, COALESCE(PolicySubCoverage.WrittenPremiumBaseAmt,PolicyCoverage.WrittenPremiumBaseAmt) AS DirectWrittenPremiumITDBaseAmt
	, (SELECT SUM(CoveragefeeBaseAmt) FROM Policy.PolicyCoverageFee WHERE PolicyCoverageFee.PolicyCoverageSK = PolicyCoverage.PolicyCoverageSK)
	  + (SELECT SUM(CoveragefeeBaseAmt) FROM Policy.PolicyCoverageFee WHERE PolicyCoverageFee.IsSurchargeInd = 1 AND PolicyCoverageFee.PolicyCoverageSK = PolicyCoverage.PolicyCoverageSK)
	  + (SELECT SUM(CoveragefeeBaseAmt) FROM Policy.PolicyCoverageFee WHERE PolicyCoverageFee.PolicyCoverageSK = PolicyCoverage.PolicyCoverageSK)
	   AS DirectTaxSurchargeFeeITDBaseAmt
	
	, COALESCE(PolicySubCoverage.WrittenPremiumOriginalAmt,PolicyCoverage.WrittenPremiumOriginalAmt) AS WrittenPremiumOriginalAmt
	, COALESCE(PolicySubCoverage.WrittenPremiumReportingAmt,PolicyCoverage.WrittenPremiumReportingAmt) AS WrittenPremiumReportingAmt
	
	/* This is the basic allocation of premium to each day within the financial period */
	,DirectEarnedPremiumBaseAmt = COALESCE(PolicySubCoverage.WrittenPremiumBaseAmt,PolicyCoverage.WrittenPremiumBaseAmt)
	,DirectEarnedTaxSurchargeFeeBaseAmt = (SELECT SUM(CoveragefeeBaseAmt) FROM Policy.PolicyCoverageFee WHERE PolicyCoverageFee.PolicyCoverageSK = PolicyCoverage.PolicyCoverageSK)+(SELECT SUM(CoveragefeeBaseAmt) FROM Policy.PolicyCoverageFee WHERE PolicyCoverageFee.IsSurchargeInd = 1 AND PolicyCoverageFee.PolicyCoverageSK = PolicyCoverage.PolicyCoverageSK)+(SELECT SUM(CoveragefeeBaseAmt) FROM Policy.PolicyCoverageFee WHERE PolicyCoverageFee.PolicyCoverageSK = PolicyCoverage.PolicyCoverageSK)

	--Need to calculate these
	--DirectEarnedPremiumBaseAmt
	--DirectEarnedTaxSurchargeFeeBaseAmt
	--DirectUnearnedPremiumBaseAmt
	--DirectUnearnedTaxSurchargeFeeBaseAmt

	--Finance.ReinsFinancialTransaction??

	, 0 AS AssumedWrittenPremiumBaseAmt
	, 0 AS AssumedTaxBaseAmt
	, 0 AS AssumedFeeBaseAmt
	, 0 AS AssumedSurchargeBaseAmt
	, 0 AS AssumedWrittenPremiumITDBaseAmt
	, 0 AS AssumedTaxSurchargeFeeITDBaseAmt
	, 0 AS AssumedEarnedPremiumBaseAmt
	, 0 AS AssumedEarnedTaxSurchargeFeeBaseAmt
	, 0 AS AssumedUnearnedPremiumBaseAmt
	, 0 AS AssumedUnearnedTaxSurchargeFeeBaseAmt
	, 0 AS CededPremiumBaseAmt
	, 0 AS CededEarnedPremiumBaseAmt
	, 0 AS CededUnearnedPremiumBaseAmt

	--Not available for coverage
	, 0 AS CommissionBaseAmt
	, 0 AS EarnedCommissionBaseAmt
	--, 0 AS UnEarnedCommissionBaseAmt
	, 0 AS CommissionPct

	--Not available always at coverage
	, 0 AS DirectExposureBaseAmt
	, 0 AS AssumedExposureBaseAmt
	, 0 AS EarnedExposureBaseAmt
	, 0 AS UnearnedExposureBaseAmt
	, PolicyCoverage.EffectiveDate AS CoverageEffective
	, PolicyCoverage.ExpirationDate AS CoverageExpiration
	, Policy.CancellationDate
	, CAST(PolicyCoverage.PolicyCoverageSK AS VARCHAR(20)) + CAST(COALESCE(PolicySubCoverage.PolicySubCoverageSK,'') AS VARCHAR(20)) AS EarnKey
FROM
	Policy.PolicyCoverage
		INNER JOIN Typelist.SourceSystem ON SourceSystem.SourceSystemSK = PolicyCoverage.SourceSystemSK
	INNER JOIN Policy.PolicyTrans ON PolicyTrans.PolicyTransSK = PolicyCoverage.PolicyTransSK
		INNER JOIN Policy.Policy ON Policy.PolicySK = PolicyTrans.PolicySK
			INNER JOIN Party.Insured ON Insured.InsuredSK = Policy.InsuredSK
				INNER JOIN Party.PartyMaster  AS InsuredPartyMaster ON InsuredPartyMaster.PartySK = Insured.PartySK
			INNER JOIN Party.Agency ON Agency.AgencySK = Policy.AgencySK 
			INNER JOIN Party.WritingCompany ON WritingCompany.WritingCompanySK = Policy.WritingCompanySK

		INNER JOIN Typelist.PolicyTransType ON PolicyTransType.PolicyTransTypeSK = Policytrans.PolicyTransTypeSK
	
	INNER JOIN Policy.PolicyLineofBusiness ON PolicyLineofBusiness.PolicyLineofBusinessSK = PolicyCoverage.PolicyLineofBusinessSK
		INNER JOIN Typelist.LineofBusiness ON LineofBusiness.LineofBusinessSK = PolicyLineofBusiness.LineofBusinessSK

	LEFT JOIN Typelist.Coverage ON Coverage.CoverageSK = PolicyCoverage.CoverageSK
	LEFT JOIN Typelist.AnnualStatementLineofBusiness ON AnnualStatementLineofBusiness.AnnualStatementLineofBusinessSK = PolicyCoverage.AnnualStatementLineofBusinessSK
	LEFT JOIN Typelist.ClassCode ON ClassCode.ClassCodeSK = PolicyCoverage.ClassCodeSK
	LEFT JOIN TypeList.StatCode ON StatCode.StatCodeSK = PolicyCoverage.StatCodeSK

	/* Duplicative !!!*/
	LEFT JOIN Policy.PolicySubCoverage ON PolicySubCoverage.PolicyCoverageSK = PolicyCoverage.PolicyCoverageSK
		LEFT JOIN TypeList.SubCoverage ON SubCoverage.SubCoverageSK = PolicySubCoverage.SubCoverageSK
		LEFT JOIN Typelist.Currency SubCoverageCurrency ON SubCoverageCurrency.CurrencySK = PolicySubCoverage.BaseCurrencySK

	LEFT JOIN Policy.PolicyGeography ON PolicyGeography.PolicyGeographySK = PolicyCoverage.PolicyGeographySK
		LEFT JOIN Typelist.Country ON Country.CountrySK = PolicyGeography.CountrySK
		LEFT JOIN Typelist.State ON State.StateSK = PolicyGeography.StateSK

	LEFT JOIN Typelist.Currency CoverageCurrency ON CoverageCurrency.CurrencySK = PolicyCoverage.BaseCurrencySK
	LEFT JOIN Policy.PolicySubLine ON PolicySubLine.PolicySubLineSK = PolicyCoverage.PolicySubLineSK

--PolicySubLine Commissions
UNION ALL SELECT
	SourceSystem.SourceSystemCode
	, SourceSystem.SourceSystemName AS SourceSystemDesc
	, PolicyLineOfBusiness.SourceCode AS EarnedPremiumDetailSourceCode
	, GETDATE() AS ProcessDateTime
	--FinancialReportingPeriod --Typelist.FinancialReportingPeriod.FinancialReportingPeriodNum
	, Policy.SourceCode AS PolicySourceCode
	, Policy.PolicyNum AS PolicyNum
	, Policy.EffectiveDate AS PolicyEffectiveDate
	, Policy.ExpirationDate AS PolicyExpirationDate
	, PolicyTrans.SourceCode AS PolicyTransSourceCode
	, PolicyTrans.PolicyTransNum AS PolicyTransNum
	, PolicyTrans.TransStartDatetime AS PolicyTransEffectiveDate
	, PolicyTrans.TransEndDatetime AS PolicyTransExpirationDate
	, PolicyTransType.PolicyTransTypeCode AS PolicyTransTypeCode
	, PolicyTransType.PolicyTransTypeName AS PolicyTransTypeDesc
	, LineofBusiness.LineofBusinessCode AS LineofBusinessCode
	, LineofBusiness.LineofBusinessName AS LineofBusinessDesc
	, '' AS CoverageCode
	, '' AS CoverageDesc
	, '' AS AnnualStatementLineofBusinessCode
	, '' AS AnnualStatementLineofBusinessDesc
	, '' AS ClassCode
	, '' AS ClassCodeDesc
	, '' AS StatCode
	, '' AS StatCodeDesc
	, '' AS SubCoverageCode
	, '' AS SubCoverageDesc
	, '' AS CountryCode
	, '' AS CountryDesc
	, '' AS StateCode
	, '' AS StateDesc
	, Insured.SourceCode AS InsuredSourceCode
	, InsuredPartyMaster.FullName AS InsuredName
	, Agency.SourceCode AS AgencySourceCode
	, Agency.AgencyNum AS AgencyNum
	, WritingCompany.WritingCompanyCode AS WritingCompanyCode
	, WritingCompany.WritingCompanyName AS WritingCompanyName
	, '' AS ProfitAnalysisCode
	, '' AS ProfitAnalysisDesc
	, BaseCurrency.CurrencyCode AS BaseCurrencyCode
	, BaseCurrency.CurrencyName AS BaseCurrencyDesc
	, 0 AS IsFullyEarnedInd
	, 0 AS IsPremiumWaivedInd
	, 0 AS IsIncludedInPremiumInd
	, 0 AS DirectWrittenPremiumBaseAmt
	, 0 AS DirectTaxBaseAmt
	, 0 AS DirectSurchargeBaseAmt
	, 0 AS DirectFeeBaseAmt
	, 0 AS DirectWrittenPremiumITDBaseAmt
	, 0 AS DirectTaxSurchargeFeeITDBaseAmt
	, 0 AS WrittenPremiumOriginalAmt
	, 0 AS WrittenPremiumReportingAmt
	, 0 AS DirectEarnedPremiumBaseAmt
	, 0 AS DirectEarnedTaxSurchargeFeeBaseAmt
	--, 0 AS DirectUnearnedPremiumBaseAmt
	--, 0 AS DirectUnearnedTaxSurchargeFeeBaseAmt
	, 0 AS AssumedWrittenPremiumBaseAmt
	, 0 AS AssumedTaxBaseAmt
	, 0 AS AssumedFeeBaseAmt
	, 0 AS AssumedSurchargeBaseAmt
	, 0 AS AssumedWrittenPremiumITDBaseAmt
	, 0 AS AssumedTaxSurchargeFeeITDBaseAmt
	, 0 AS AssumedEarnedPremiumBaseAmt
	, 0 AS AssumedEarnedTaxSurchargeFeeBaseAmt
	, 0 AS AssumedUnearnedPremiumBaseAmt
	, 0 AS AssumedUnearnedTaxSurchargeFeeBaseAmt
	, 0 AS CededPremiumBaseAmt
	, 0 AS CededEarnedPremiumBaseAmt
	, 0 AS CededUnearnedPremiumBaseAmt

	, PolicySubLine.CommissionBaseAmt AS CommissionBaseAmt
	, PolicySubLine.CommissionBaseAmt AS EarnedCommissionBaseAmt
	--, 0 AS UnEarnedCommissionBaseAmt
	, PolicySubLine.CommissionPct AS CommissionPct

	, 0 AS DirectExposureBaseAmt
	, 0 AS AssumedExposureBaseAmt
	, 0 AS EarnedExposureBaseAmt
	, 0 AS UnearnedExposureBaseAmt
	, Policy.EffectiveDate AS CoverageEffective
	, Policy.ExpirationDate AS CoverageExpiration
	, Policy.CancellationDate
	, CAST(PolicySubLine.PolicySubLineSK AS VARCHAR(20)) AS EarnKey
FROM
	Policy.PolicyTrans
		INNER JOIN Typelist.SourceSystem ON SourceSystem.SourceSystemSK = PolicyTrans.SourceSystemSK
		INNER JOIN Policy.Policy ON Policy.PolicySK = PolicyTrans.PolicySK
			INNER JOIN Party.Insured ON Insured.InsuredSK = Policy.InsuredSK
				INNER JOIN Party.PartyMaster  AS InsuredPartyMaster ON InsuredPartyMaster.PartySK = Insured.PartySK
			INNER JOIN Party.Agency ON Agency.AgencySK = Policy.AgencySK 
			INNER JOIN Party.WritingCompany ON WritingCompany.WritingCompanySK = Policy.WritingCompanySK

		INNER JOIN Typelist.PolicyTransType ON PolicyTransType.PolicyTransTypeSK = Policytrans.PolicyTransTypeSK
	
	INNER JOIN Policy.PolicyLineofBusiness ON PolicyLineofBusiness.PolicyTransSK = PolicyTrans.PolicyTransSK
		INNER JOIN Typelist.LineofBusiness ON LineofBusiness.LineofBusinessSK = PolicyLineofBusiness.LineofBusinessSK
		INNER JOIN Policy.PolicySubLine ON PolicySubLine.PolicyLineofBusinessSK = PolicyLineofBusiness.PolicyLineofBusinessSK
			LEFT JOIN Typelist.Currency BaseCurrency ON BaseCurrency.CurrencySK = PolicySubLine.BaseCurrencySK
WHERE
	PolicySubLine.CommissionBaseAmt <> 0

--Policy Commissions
UNION ALL SELECT
	SourceSystem.SourceSystemCode
	, SourceSystem.SourceSystemName AS SourceSystemDesc
	, Policy.SourceCode --EarnedPremiumDetailSourceCode
	, GETDATE() AS ProcessDateTime
	--FinancialReportingPeriod --Typelist.FinancialReportingPeriod.FinancialReportingPeriodNum
	, Policy.SourceCode AS PolicySourceCode
	, Policy.PolicyNum AS PolicyNum
	, Policy.EffectiveDate AS PolicyEffectiveDate
	, Policy.ExpirationDate AS PolicyExpirationDate
	, PolicyTrans.SourceCode AS PolicyTransSourceCode
	, PolicyTrans.PolicyTransNum AS PolicyTransNum
	, PolicyTrans.TransStartDatetime AS PolicyTransEffectiveDate
	, PolicyTrans.TransEndDatetime AS PolicyTransExpirationDate
	, PolicyTransType.PolicyTransTypeCode AS PolicyTransTypeCode
	, PolicyTransType.PolicyTransTypeName AS PolicyTransTypeDesc
	, '' AS LineofBusinessCode
	, '' AS LineofBusinessDesc
	, '' AS CoverageCode
	, '' AS CoverageDesc
	, '' AS AnnualStatementLineofBusinessCode
	, '' AS AnnualStatementLineofBusinessDesc
	, '' AS ClassCode
	, '' AS ClassCodeDesc
	, '' AS StatCode
	, '' AS StatCodeDesc
	, '' AS SubCoverageCode
	, '' AS SubCoverageDesc
	, '' AS CountryCode
	, '' AS CountryDesc
	, '' AS StateCode
	, '' AS StateDesc
	, Insured.SourceCode AS InsuredSourceCode
	, InsuredPartyMaster.FullName AS InsuredName
	, Agency.SourceCode AS AgencySourceCode
	, Agency.AgencyNum AS AgencyNum
	, WritingCompany.WritingCompanyCode AS WritingCompanyCode
	, WritingCompany.WritingCompanyName AS WritingCompanyName
	, '' AS ProfitAnalysisCode
	, '' AS ProfitAnalysisDesc
	, BaseCurrency.CurrencyCode AS BaseCurrencyCode
	, BaseCurrency.CurrencyName AS BaseCurrencyDesc
	, 0 AS IsFullyEarnedInd
	, 0 AS IsPremiumWaivedInd
	, 0 AS IsIncludedInPremiumInd
	, 0 AS DirectWrittenPremiumBaseAmt
	, 0 AS DirectTaxBaseAmt
	, 0 AS DirectSurchargeBaseAmt
	, 0 AS DirectFeeBaseAmt
	, 0 AS DirectWrittenPremiumITDBaseAmt
	, 0 AS DirectTaxSurchargeFeeITDBaseAmt	
	, 0 AS WrittenPremiumOriginalAmt
	, 0 AS WrittenPremiumReportingAmt
	, 0 AS DirectEarnedPremiumBaseAmt
	, 0 AS DirectEarnedTaxSurchargeFeeBaseAmt
	--, 0 AS DirectUnearnedPremiumBaseAmt
	--, 0 AS DirectUnearnedTaxSurchargeFeeBaseAmt
	, 0 AS AssumedWrittenPremiumBaseAmt
	, 0 AS AssumedTaxBaseAmt
	, 0 AS AssumedFeeBaseAmt
	, 0 AS AssumedSurchargeBaseAmt
	, 0 AS AssumedWrittenPremiumITDBaseAmt
	, 0 AS AssumedTaxSurchargeFeeITDBaseAmt
	, 0 AS AssumedEarnedPremiumBaseAmt
	, 0 AS AssumedEarnedTaxSurchargeFeeBaseAmt
	, 0 AS AssumedUnearnedPremiumBaseAmt
	, 0 AS AssumedUnearnedTaxSurchargeFeeBaseAmt
	, 0 AS CededPremiumBaseAmt
	, 0 AS CededEarnedPremiumBaseAmt
	, 0 AS CededUnearnedPremiumBaseAmt

	--Not available for coverage
	, Policy.CommissionBaseAmt AS CommissionBaseAmt
	, Policy.CommissionBaseAmt AS EarnedCommissionBaseAmt
	--, 0 AS UnEarnedCommissionBaseAmt
	, Policy.CommissionPct AS CommissionPct

	--Not available always at coverage
	, 0 AS DirectExposureBaseAmt
	, 0 AS AssumedExposureBaseAmt
	, 0 AS EarnedExposureBaseAmt
	, 0 AS UnearnedExposureBaseAmt
	, Policy.EffectiveDate AS CoverageEffective
	, Policy.ExpirationDate AS CoverageExpiration
	, Policy.CancellationDate
	, CAST(Policy.PolicySK AS VARCHAR(20)) AS EarnKey
FROM
	Policy.PolicyTrans
		INNER JOIN Typelist.SourceSystem ON SourceSystem.SourceSystemSK = PolicyTrans.SourceSystemSK
		INNER JOIN Policy.Policy ON Policy.PolicySK = PolicyTrans.PolicySK
			INNER JOIN Party.Insured ON Insured.InsuredSK = Policy.InsuredSK
				INNER JOIN Party.PartyMaster  AS InsuredPartyMaster ON InsuredPartyMaster.PartySK = Insured.PartySK
			INNER JOIN Party.Agency ON Agency.AgencySK = Policy.AgencySK 
			INNER JOIN Party.WritingCompany ON WritingCompany.WritingCompanySK = Policy.WritingCompanySK

		INNER JOIN Typelist.PolicyTransType ON PolicyTransType.PolicyTransTypeSK = Policytrans.PolicyTransTypeSK
		LEFT JOIN Typelist.Currency BaseCurrency ON BaseCurrency.CurrencySK = Policy.BaseCurrencySK
WHERE
	Policy.CommissionBaseAmt <> 0

--PolicyGeography Commissions
UNION ALL SELECT
	SourceSystem.SourceSystemCode
	, SourceSystem.SourceSystemName AS SourceSystemDesc
	, PolicyGeography.SourceCode --EarnedPremiumDetailSourceCode
	, GETDATE() AS ProcessDateTime
	--FinancialReportingPeriod --Typelist.FinancialReportingPeriod.FinancialReportingPeriodNum
	, Policy.SourceCode AS PolicySourceCode
	, Policy.PolicyNum AS PolicyNum
	, Policy.EffectiveDate AS PolicyEffectiveDate
	, Policy.ExpirationDate AS PolicyExpirationDate
	, PolicyTrans.SourceCode AS PolicyTransSourceCode
	, PolicyTrans.PolicyTransNum AS PolicyTransNum
	, PolicyTrans.TransStartDatetime AS PolicyTransEffectiveDate
	, PolicyTrans.TransEndDatetime AS PolicyTransExpirationDate
	, PolicyTransType.PolicyTransTypeCode AS PolicyTransTypeCode
	, PolicyTransType.PolicyTransTypeName AS PolicyTransTypeDesc
	, LineofBusiness.LineofBusinessCode AS LineofBusinessCode
	, LineofBusiness.LineofBusinessName AS LineofBusinessDesc
	, '' AS CoverageCode
	, '' AS CoverageDesc
	, '' AS AnnualStatementLineofBusinessCode
	, '' AS AnnualStatementLineofBusinessDesc
	, '' AS ClassCode
	, '' AS ClassCodeDesc
	, '' AS StatCode
	, '' AS StatCodeDesc
	, '' AS SubCoverageCode
	, '' AS SubCoverageDesc
	, Country.CountryCode AS CountryCode
	, Country.CountryName AS CountryDesc
	, State.StateCode AS StateCode
	, State.StateName AS StateDesc
	, Insured.SourceCode AS InsuredSourceCode
	, InsuredPartyMaster.FullName AS InsuredName
	, Agency.SourceCode AS AgencySourceCode
	, Agency.AgencyNum AS AgencyNum
	, WritingCompany.WritingCompanyCode AS WritingCompanyCode
	, WritingCompany.WritingCompanyName AS WritingCompanyName
	, '' AS ProfitAnalysisCode
	, '' AS ProfitAnalysisDesc
	, BaseCurrency.CurrencyCode AS BaseCurrencyCode
	, BaseCurrency.CurrencyName AS BaseCurrencyDesc
	, 0 AS IsFullyEarnedInd
	, 0 AS IsPremiumWaivedInd
	, 0 AS IsIncludedInPremiumInd
	, 0 AS DirectWrittenPremiumBaseAmt
	, 0 AS DirectTaxBaseAmt
	, 0 AS DirectSurchargeBaseAmt
	, 0 AS DirectFeeBaseAmt
	, 0 AS DirectWrittenPremiumITDBaseAmt
	, 0 AS DirectTaxSurchargeFeeITDBaseAmt	
	, 0 AS WrittenPremiumOriginalAmt
	, 0 AS WrittenPremiumReportingAmt
	, 0 AS DirectEarnedPremiumBaseAmt
	, 0 AS DirectEarnedTaxSurchargeFeeBaseAmt
	--, 0 AS DirectUnearnedPremiumBaseAmt
	--, 0 AS DirectUnearnedTaxSurchargeFeeBaseAmt
	, 0 AS AssumedWrittenPremiumBaseAmt
	, 0 AS AssumedTaxBaseAmt
	, 0 AS AssumedFeeBaseAmt
	, 0 AS AssumedSurchargeBaseAmt
	, 0 AS AssumedWrittenPremiumITDBaseAmt
	, 0 AS AssumedTaxSurchargeFeeITDBaseAmt
	, 0 AS AssumedEarnedPremiumBaseAmt
	, 0 AS AssumedEarnedTaxSurchargeFeeBaseAmt
	, 0 AS AssumedUnearnedPremiumBaseAmt
	, 0 AS AssumedUnearnedTaxSurchargeFeeBaseAmt
	, 0 AS CededPremiumBaseAmt
	, 0 AS CededEarnedPremiumBaseAmt
	, 0 AS CededUnearnedPremiumBaseAmt

	--Not available for coverage
	, PolicyGeography.CommissionBaseAmt AS CommissionBaseAmt
	, PolicyGeography.CommissionBaseAmt AS EarnedCommissionBaseAmt
	--, 0 AS UnEarnedCommissionBaseAmt
	, PolicyGeography.CommissionPct AS CommissionPct

	--Not available always at coverage
	, 0 AS DirectExposureBaseAmt
	, 0 AS AssumedExposureBaseAmt
	, 0 AS EarnedExposureBaseAmt
	, 0 AS UnearnedExposureBaseAmt
	, Policy.EffectiveDate AS CoverageEffective
	, Policy.ExpirationDate AS CoverageExpiration
	, Policy.CancellationDate
	, CAST(PolicyGeography.PolicyGeographySK AS VARCHAR(20)) AS EarnKey
FROM
	Policy.PolicyTrans
		INNER JOIN Typelist.SourceSystem ON SourceSystem.SourceSystemSK = PolicyTrans.SourceSystemSK
		INNER JOIN Policy.Policy ON Policy.PolicySK = PolicyTrans.PolicySK
			INNER JOIN Party.Insured ON Insured.InsuredSK = Policy.InsuredSK
				INNER JOIN Party.PartyMaster  AS InsuredPartyMaster ON InsuredPartyMaster.PartySK = Insured.PartySK
			INNER JOIN Party.Agency ON Agency.AgencySK = Policy.AgencySK 
			INNER JOIN Party.WritingCompany ON WritingCompany.WritingCompanySK = Policy.WritingCompanySK

		INNER JOIN Typelist.PolicyTransType ON PolicyTransType.PolicyTransTypeSK = Policytrans.PolicyTransTypeSK
	
	INNER JOIN Policy.PolicyLineofBusiness ON PolicyLineofBusiness.PolicyTransSK = PolicyTrans.PolicyTransSK
		INNER JOIN Typelist.LineofBusiness ON LineofBusiness.LineofBusinessSK = PolicyLineofBusiness.LineofBusinessSK

		LEFT JOIN Policy.PolicyGeography ON PolicyGeography.PolicyLineofBusinessSK = PolicyLineofBusiness.PolicyLineofBusinessSK
			LEFT JOIN Typelist.Country ON Country.CountrySK = PolicyGeography.CountrySK
			LEFT JOIN Typelist.State ON State.StateSK = PolicyGeography.StateSK
			LEFT JOIN Typelist.Currency BaseCurrency ON BaseCurrency.CurrencySK = PolicyGeography.BaseCurrencySK
WHERE
	PolicyGeography.CommissionBaseAmt <> 0

--PolicyLineOfBusiness Commissions
UNION ALL SELECT
	SourceSystem.SourceSystemCode
	, SourceSystem.SourceSystemName AS SourceSystemDesc
	, PolicyLineOfBusiness.SourceCode --EarnedPremiumDetailSourceCode
	, GETDATE() AS ProcessDateTime
	--FinancialReportingPeriod --Typelist.FinancialReportingPeriod.FinancialReportingPeriodNum
	, Policy.SourceCode AS PolicySourceCode
	, Policy.PolicyNum AS PolicyNum
	, Policy.EffectiveDate AS PolicyEffectiveDate
	, Policy.ExpirationDate AS PolicyExpirationDate
	, PolicyTrans.SourceCode AS PolicyTransSourceCode
	, PolicyTrans.PolicyTransNum AS PolicyTransNum
	, PolicyTrans.TransStartDatetime AS PolicyTransEffectiveDate
	, PolicyTrans.TransEndDatetime AS PolicyTransExpirationDate
	, PolicyTransType.PolicyTransTypeCode AS PolicyTransTypeCode
	, PolicyTransType.PolicyTransTypeName AS PolicyTransTypeDesc
	, LineofBusiness.LineofBusinessCode AS LineofBusinessCode
	, LineofBusiness.LineofBusinessName AS LineofBusinessDesc
	, '' AS CoverageCode
	, '' AS CoverageDesc
	, '' AS AnnualStatementLineofBusinessCode
	, '' AS AnnualStatementLineofBusinessDesc
	, '' AS ClassCode
	, '' AS ClassCodeDesc
	, '' AS StatCode
	, '' AS StatCodeDesc
	, '' AS SubCoverageCode
	, '' AS SubCoverageDesc
	, '' AS CountryCode
	, '' AS CountryDesc
	, '' AS StateCode
	, '' AS StateDesc
	, Insured.SourceCode AS InsuredSourceCode
	, InsuredPartyMaster.FullName AS InsuredName
	, Agency.SourceCode AS AgencySourceCode
	, Agency.AgencyNum AS AgencyNum
	, WritingCompany.WritingCompanyCode AS WritingCompanyCode
	, WritingCompany.WritingCompanyName AS WritingCompanyName
	, '' AS ProfitAnalysisCode
	, '' AS ProfitAnalysisDesc
	, BaseCurrency.CurrencyCode AS BaseCurrencyCode
	, BaseCurrency.CurrencyName AS BaseCurrencyDesc
	, 0 AS IsFullyEarnedInd
	, 0 AS IsPremiumWaivedInd
	, 0 AS IsIncludedInPremiumInd
	, 0 AS DirectWrittenPremiumBaseAmt
	, 0 AS DirectTaxBaseAmt
	, 0 AS DirectSurchargeBaseAmt
	, 0 AS DirectFeeBaseAmt
	, 0 AS DirectWrittenPremiumITDBaseAmt
	, 0 AS DirectTaxSurchargeFeeITDBaseAmt
	, 0 AS WrittenPremiumOriginalAmt
	, 0 AS WrittenPremiumReportingAmt
	, 0 AS DirectEarnedPremiumBaseAmt
	, 0 AS DirectEarnedTaxSurchargeFeeBaseAmt
	--, 0 AS DirectUnearnedPremiumBaseAmt
	--, 0 AS DirectUnearnedTaxSurchargeFeeBaseAmt
	, 0 AS AssumedWrittenPremiumBaseAmt
	, 0 AS AssumedTaxBaseAmt
	, 0 AS AssumedFeeBaseAmt
	, 0 AS AssumedSurchargeBaseAmt
	, 0 AS AssumedWrittenPremiumITDBaseAmt
	, 0 AS AssumedTaxSurchargeFeeITDBaseAmt
	, 0 AS AssumedEarnedPremiumBaseAmt
	, 0 AS AssumedEarnedTaxSurchargeFeeBaseAmt
	, 0 AS AssumedUnearnedPremiumBaseAmt
	, 0 AS AssumedUnearnedTaxSurchargeFeeBaseAmt
	, 0 AS CededPremiumBaseAmt
	, 0 AS CededEarnedPremiumBaseAmt
	, 0 AS CededUnearnedPremiumBaseAmt

	, PolicyLineofBusiness.CommissionBaseAmt AS CommissionBaseAmt
	, PolicyLineofBusiness.CommissionBaseAmt AS EarnedCommissionBaseAmt
	--UnEarnedCommissionBaseAmt
	, PolicyLineOfBusiness.CommissionPct AS CommissionPct

	, 0 AS DirectExposureBaseAmt
	, 0 AS AssumedExposureBaseAmt
	, 0 AS EarnedExposureBaseAmt
	, 0 AS UnearnedExposureBaseAmt
	, Policy.EffectiveDate AS CoverageEffective
	, Policy.ExpirationDate AS CoverageExpiration
	, Policy.CancellationDate
	, CAST(PolicyLineofBusiness.PolicyLineofBusinessSK AS VARCHAR(20)) AS EarnKey
FROM
	Policy.PolicyTrans
		INNER JOIN Typelist.SourceSystem ON SourceSystem.SourceSystemSK = PolicyTrans.SourceSystemSK
		INNER JOIN Policy.Policy ON Policy.PolicySK = PolicyTrans.PolicySK
			INNER JOIN Party.Insured ON Insured.InsuredSK = Policy.InsuredSK
				INNER JOIN Party.PartyMaster  AS InsuredPartyMaster ON InsuredPartyMaster.PartySK = Insured.PartySK
			INNER JOIN Party.Agency ON Agency.AgencySK = Policy.AgencySK 
			INNER JOIN Party.WritingCompany ON WritingCompany.WritingCompanySK = Policy.WritingCompanySK

		INNER JOIN Typelist.PolicyTransType ON PolicyTransType.PolicyTransTypeSK = Policytrans.PolicyTransTypeSK
	
	INNER JOIN Policy.PolicyLineofBusiness ON PolicyLineofBusiness.PolicyTransSK = PolicyTrans.PolicyTransSK
		INNER JOIN Typelist.LineofBusiness ON LineofBusiness.LineofBusinessSK = PolicyLineofBusiness.LineofBusinessSK
		LEFT JOIN Typelist.Currency BaseCurrency ON BaseCurrency.CurrencySK = PolicyLineofBusiness.BaseCurrencySK
WHERE
	PolicyLineofBusiness.CommissionBaseAmt <> 0
)

SELECT
CoverageAndCommissions.*
, TotalDaysOfCoverage = CAST((
		SELECT COUNT(*) FROM Typelist.FinancialReportingPeriod 
		WHERE FinancialReportingPeriod.FinancialReportingPeriodDate BETWEEN 
		CoverageAndCommissions.CoverageEffectiveDate
		AND LEAST(CoverageAndCommissions.CancellationDate,CoverageAndCommissions.CoverageExpirationDate)
		) AS MONEY)
	, DaysOfCoverageInPeriod = CAST((
		SELECT COUNT(*) FROM Typelist.FinancialReportingPeriod 
		WHERE FinancialReportingPeriod.FinancialReportingPeriodDate BETWEEN 
		GREATEST(CoverageAndCommissions.CoverageEffectiveDate,AccountingPeriods.StartDate)
		AND LEAST(CoverageAndCommissions.CancellationDate,CoverageAndCommissions.CoverageExpirationDate,AccountingPeriods.EndDate)
		) AS MONEY)
	, AccountingPeriods.StartDate AS FinancialPeriodStart
	, AccountingPeriods.FinancialReportingPeriod
INTO #PremiumData
FROM
	CoverageAndCommissions
	INNER JOIN AccountingPeriods ON AccountingPeriods.StartDate <= COALESCE(CoverageAndCommissions.CancellationDate,CoverageAndCommissions.CoverageExpirationDate) AND AccountingPeriods.EndDate >= CoverageAndCommissions.CoverageEffectiveDate
WHERE
	--Limit the result set to only records that can possibly earn
	GREATEST(CoverageAndCommissions.CoverageEffectiveDate,AccountingPeriods.StartDate)
		<= LEAST(CoverageAndCommissions.CancellationDate,CoverageAndCommissions.CoverageExpirationDate,AccountingPeriods.EndDate)
;
/* At this point, we have everything we need in a temp table
The premium has been split into rows for each accounting period that the premoim/commission earns in
The following update just does the pro-rata math
*/
UPDATE #PremiumData
SET DirectEarnedPremiumBaseAmt = CASE WHEN TotalDaysOfCoverage = 0 THEN 0 ELSE
														ROUND((CAST(DaysOfCoverageInPeriod AS MONEY) / CAST(TotalDaysOfCoverage AS MONEY)) * DirectEarnedPremiumBaseAmt,2) END
	,DirectEarnedTaxSurchargeFeeBaseAmt = CASE WHEN TotalDaysOfCoverage = 0 THEN 0 ELSE
														ROUND((CAST(DaysOfCoverageInPeriod AS MONEY) / CAST(TotalDaysOfCoverage AS MONEY)) * DirectEarnedTaxSurchargeFeeBaseAmt,2) END
	,EarnedCommissionBaseAmt = CASE WHEN TotalDaysOfCoverage = 0 THEN 0 ELSE
														ROUND((CAST(DaysOfCoverageInPeriod AS MONEY) / CAST(TotalDaysOfCoverage AS MONEY)) * EarnedCommissionBaseAmt,2) END
;
/*
Performance is starting to be an issue, so we can index this monster by the earning key
- this key represents the gran of the money being earned and there is effectively one row per financial period for each earning key
*/

CREATE CLUSTERED INDEX idx_cl_tmp_1 ON #PremiumData(EarnKey)



/*
Now we get the unearned in the CTE
We will use the unearned in the final query to handle rounding errors
*/
;WITH EarnedUnearned (SourceSystemCode,SourceSystemDesc,EarnedPremiumDetailSourceCode,ProcessDateTime,FinancialReportingPeriod,PolicySourceCode,PolicyNum,PolicyEffectiveDate,PolicyExpirationDate,PolicyTransSourceCode,PolicyTransNum
,PolicyTransEffectiveDate,PolicyTransExpirationDate,PolicyTransTypeCode,PolicyTransTypeDesc,LineofBusinessCode,LineofBusinessDesc,CoverageCode,CoverageDesc,AnnualStatementLineofBusinessCode,AnnualStatementLineofBusinessDesc
,ClassCode,ClassCodeDesc,StatCode,StatCodeDesc,SubCoverageCode,SubCoverageDesc,CountryCode,CountryDesc,StateCode,StateDesc,InsuredSourceCode,InsuredName,AgencySourceCode,AgencyNum,WritingCompanyCode,WritingCompanyName
,ProfitAnalysisCode,ProfitAnalysisDesc,BaseCurrencyCode,BaseCurrencyDesc,IsFullyEarnedInd,IsPremiumWaivedInd,IsIncludedInPremiumInd,DirectWrittenPremiumBaseAmt,DirectTaxBaseAmt,DirectSurchargeBaseAmt,DirectFeeBaseAmt
,DirectWrittenPremiumITDBaseAmt,DirectTaxSurchargeFeeITDBaseAmt,WrittenPremiumOriginalAmt,WrittenPremiumReportingAmt
,DirectEarnedPremiumBaseAmt,DirectEarnedTaxSurchargeFeeBaseAmt,DirectUnearnedPremiumBaseAmt,DirectUnearnedTaxSurchargeFeeBaseAmt
,AssumedWrittenPremiumBaseAmt,AssumedTaxBaseAmt,AssumedFeeBaseAmt,AssumedSurchargeBaseAmt,AssumedWrittenPremiumITDBaseAmt
,AssumedTaxSurchargeFeeITDBaseAmt,AssumedEarnedPremiumBaseAmt,AssumedEarnedTaxSurchargeFeeBaseAmt,AssumedUnearnedPremiumBaseAmt,AssumedUnearnedTaxSurchargeFeeBaseAmt,CededPremiumBaseAmt,CededEarnedPremiumBaseAmt,CededUnearnedPremiumBaseAmt
,CommissionBaseAmt,CommissionPct,DirectExposureBaseAmt,AssumedExposureBaseAmt,EarnedExposureBaseAmt,UnearnedExposureBaseAmt,TotalDaysOfCoverage,DaysOfCoverageInPeriod,EarnKey,FinancialPeriodStart,MaxPeriodStart,PriorPeriodStart) AS
(
SELECT
	SourceSystemCode
	,SourceSystemDesc
	,EarnedPremiumDetailSourceCode
	,ProcessDateTime
	,FinancialReportingPeriod
	,PolicySourceCode
	,PolicyNum
	,PolicyEffectiveDate
	,PolicyExpirationDate
	,PolicyTransSourceCode
	,PolicyTransNum
	,PolicyTransEffectiveDate
	,PolicyTransExpirationDate
	,PolicyTransTypeCode
	,PolicyTransTypeDesc
	,LineofBusinessCode
	,LineofBusinessDesc
	,CoverageCode
	,CoverageDesc
	,AnnualStatementLineofBusinessCode
	,AnnualStatementLineofBusinessDesc
	,ClassCode
	,ClassCodeDesc
	,StatCode
	,StatCodeDesc
	,SubCoverageCode
	,SubCoverageDesc
	,CountryCode
	,CountryDesc
	,StateCode
	,StateDesc
	,InsuredSourceCode
	,InsuredName
	,AgencySourceCode
	,AgencyNum
	,WritingCompanyCode
	,WritingCompanyName
	,ProfitAnalysisCode
	,ProfitAnalysisDesc
	,BaseCurrencyCode
	,BaseCurrencyDesc
	,IsFullyEarnedInd
	,IsPremiumWaivedInd
	,IsIncludedInPremiumInd
	,DirectWrittenPremiumBaseAmt
	,DirectTaxBaseAmt
	,DirectSurchargeBaseAmt
	,DirectFeeBaseAmt
	,DirectWrittenPremiumITDBaseAmt
	,DirectTaxSurchargeFeeITDBaseAmt
	,WrittenPremiumOriginalAmt
	,WrittenPremiumReportingAmt

	,DirectEarnedPremiumBaseAmt
	,DirectEarnedTaxSurchargeFeeBaseAmt

	--Get the unearned by subtracting what was already earned from the written
	,DirectUnearnedPremiumBaseAmt =
		DirectWrittenPremiumBaseAmt-
		COALESCE((SELECT SUM(X.DirectEarnedPremiumBaseAmt) FROM #PremiumData X WHERE X.EarnKey = PremiumData.EarnKey AND X.FinancialPeriodStart <= PremiumData.FinancialPeriodStart),0)
	,DirectUnearnedTaxSurchargeFeeBaseAmt =
		(DirectTaxBaseAmt+DirectSurchargeBaseAmt+DirectFeeBaseAmt)-
		COALESCE((SELECT SUM(X.DirectEarnedTaxSurchargeFeeBaseAmt) FROM #PremiumData X WHERE X.EarnKey = PremiumData.EarnKey AND X.FinancialPeriodStart <= PremiumData.FinancialPeriodStart),0)

	,AssumedWrittenPremiumBaseAmt
	,AssumedTaxBaseAmt
	,AssumedFeeBaseAmt
	,AssumedSurchargeBaseAmt
	,AssumedWrittenPremiumITDBaseAmt
	,AssumedTaxSurchargeFeeITDBaseAmt
	,AssumedEarnedPremiumBaseAmt
	,AssumedEarnedTaxSurchargeFeeBaseAmt
	,AssumedUnearnedPremiumBaseAmt
	,AssumedUnearnedTaxSurchargeFeeBaseAmt
	,CededPremiumBaseAmt
	,CededEarnedPremiumBaseAmt
	,CededUnearnedPremiumBaseAmt
	,CommissionBaseAmt
	,CommissionPct
	,DirectExposureBaseAmt
	,AssumedExposureBaseAmt
	,EarnedExposureBaseAmt
	,UnearnedExposureBaseAmt
	,TotalDaysOfCoverage
	,DaysOfCoverageInPeriod
	,EarnKey
	,FinancialPeriodStart
	,(SELECT MAX(X.FinancialPeriodStart) FROM #PremiumData X WHERE X.EarnKey = PremiumData.EarnKey) AS MaxPeriodStart
	,(SELECT MAX(X.FinancialPeriodStart) FROM #PremiumData X WHERE X.EarnKey = PremiumData.EarnKey AND X.FinancialPeriodStart < PremiumData.FinancialPeriodStart) AS PriorPeriodStart
FROM #PremiumData PremiumData
)
, Root (SourceSystemCode,SourceSystemDesc) AS (SELECT DISTINCT SourceSystemCode,SourceSystemDesc FROM #PremiumData)

insert into [StgPolicy].[EarningsDataInput](JsonLine, FileName, IsValidInd)
select jsonline, 'EP' as FileName, 1 as IsValidInd from (
select (
--finally, our JSON uses a root node for the source system, so this handled that magic
SELECT
	Root.SourceSystemCode
	, Root.SourceSystemDesc
,(
SELECT
	EarnedPremiumDetailSourceCode
	,ProcessDateTime
	,FinancialReportingPeriod
	,PolicySourceCode
	,PolicyNum
	,PolicyEffectiveDate
	,PolicyExpirationDate
	,PolicyTransSourceCode
	,PolicyTransNum
	,PolicyTransEffectiveDate
	,PolicyTransExpirationDate
	,PolicyTransTypeCode
	,PolicyTransTypeDesc
	,LineofBusinessCode
	,LineofBusinessDesc
	,CoverageCode
	,CoverageDesc
	,AnnualStatementLineofBusinessCode
	,AnnualStatementLineofBusinessDesc
	,ClassCode
	,ClassCodeDesc
	,StatCode
	,StatCodeDesc
	,SubCoverageCode
	,SubCoverageDesc
	,CountryCode
	,CountryDesc
	,StateCode
	,StateDesc
	,InsuredSourceCode
	,InsuredName
	,AgencySourceCode
	,AgencyNum
	,WritingCompanyCode
	,WritingCompanyName
	,ProfitAnalysisCode
	,ProfitAnalysisDesc
	,BaseCurrencyCode
	,BaseCurrencyDesc
	,IsFullyEarnedInd
	,IsPremiumWaivedInd
	,IsIncludedInPremiumInd
	,DirectWrittenPremiumBaseAmt
	,DirectTaxBaseAmt
	,DirectSurchargeBaseAmt
	,DirectFeeBaseAmt
	,DirectWrittenPremiumITDBaseAmt
	,DirectTaxSurchargeFeeITDBaseAmt
	,WrittenPremiumOriginalAmt
	,WrittenPremiumReportingAmt
	--The case statements handle rounding errors
	--Rounding is handled by adjusting the last earnings period by taking the prior unearned and making that the earned
	--This ensures the sum of the earned matches the written
	--This is not the best rounding solution, but this is test data
	,DirectEarnedPremiumBaseAmt = CASE WHEN FinancialPeriodStart=MaxPeriodStart THEN (SELECT X.DirectUnearnedPremiumBaseAmt FROM EarnedUnearned X WHERE X.EarnKey = EarnedUnearned.EarnKey AND X.FinancialPeriodStart = EarnedUnearned.PriorPeriodStart)
										ELSE DirectEarnedPremiumBaseAmt END
	,DirectEarnedTaxSurchargeFeeBaseAmt = CASE WHEN FinancialPeriodStart=MaxPeriodStart THEN (SELECT X.DirectEarnedTaxSurchargeFeeBaseAmt FROM EarnedUnearned X WHERE X.EarnKey = EarnedUnearned.EarnKey AND X.FinancialPeriodStart = EarnedUnearned.PriorPeriodStart)
										ELSE DirectEarnedTaxSurchargeFeeBaseAmt END
	,DirectUnearnedPremiumBaseAmt = CASE WHEN FinancialPeriodStart=MaxPeriodStart THEN 0 ELSE DirectUnearnedPremiumBaseAmt END
	,DirectUnearnedTaxSurchargeFeeBaseAmt = CASE WHEN FinancialPeriodStart=MaxPeriodStart THEN 0 ELSE DirectUnearnedTaxSurchargeFeeBaseAmt END
	,AssumedWrittenPremiumBaseAmt
	,AssumedTaxBaseAmt
	,AssumedFeeBaseAmt
	,AssumedSurchargeBaseAmt
	,AssumedWrittenPremiumITDBaseAmt
	,AssumedTaxSurchargeFeeITDBaseAmt
	,AssumedEarnedPremiumBaseAmt
	,AssumedEarnedTaxSurchargeFeeBaseAmt
	,AssumedUnearnedPremiumBaseAmt
	,AssumedUnearnedTaxSurchargeFeeBaseAmt
	,CededPremiumBaseAmt
	,CededEarnedPremiumBaseAmt
	,CededUnearnedPremiumBaseAmt
	,CommissionBaseAmt
	,CommissionPct
	,DirectExposureBaseAmt
	,AssumedExposureBaseAmt
	,EarnedExposureBaseAmt
	,UnearnedExposureBaseAmt
FROM
	EarnedUnearned
where
	EarnedUnearned.SourceSystemCode = Root.SourceSystemCode AND EarnedUnearned.SourceSystemDesc = Root.SourceSystemDesc
FOR JSON PATH--,INCLUDE_NULL_VALUES
) AS 'EarnedPremiumDetail'
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
) jsonline
FROM Root
)a

--clean up that temp table!!!
DROP TABLE #PremiumData


/*
select jsonline, 'EP' as FileName from (
select (
--finally, our JSON uses a root node for the source system, so this handled that magic
SELECT
	Root.SourceSystemCode
	, Root.SourceSystemDesc

,(
SELECT
	EarnedPremiumDetailSourceCode
	,ProcessDateTime
	,FinancialReportingPeriod
	,PolicySourceCode
	,PolicyNum
	,PolicyEffectiveDate
	,PolicyExpirationDate
	,PolicyTransSourceCode
	,PolicyTransNum
	,PolicyTransEffectiveDate
	,PolicyTransExpirationDate
	,PolicyTransTypeCode
	,PolicyTransTypeDesc
	,LineofBusinessCode
	,LineofBusinessDesc
	,CoverageCode
	,CoverageDesc
	,AnnualStatementLineofBusinessCode
	,AnnualStatementLineofBusinessDesc
	,ClassCode
	,ClassCodeDesc
	,StatCode
	,StatCodeDesc
	,SubCoverageCode
	,SubCoverageDesc
	,CountryCode
	,CountryDesc
	,StateCode
	,StateDesc
	,InsuredSourceCode
	,InsuredName
	,AgencySourceCode
	,AgencyNum
	,WritingCompanyCode
	,WritingCompanyName
	,ProfitAnalysisCode
	,ProfitAnalysisDesc
	,BaseCurrencyCode
	,BaseCurrencyDesc
	,IsFullyEarnedInd
	,IsPremiumWaivedInd
	,IsIncludedInPremiumInd
	,DirectWrittenPremiumBaseAmt
	,DirectTaxBaseAmt
	,DirectSurchargeBaseAmt
	,DirectFeeBaseAmt
	,DirectWrittenPremiumITDBaseAmt
	,DirectTaxSurchargeFeeITDBaseAmt
	,WrittenPremiumOriginalAmt
	,WrittenPremiumReportingAmt
	--The case statements handle rounding errors
	--Rounding is handled by adjusting the last earnings period by taking the prior unearned and making that the earned
	--This ensures the sum of the earned matches the written
	--This is not the best rounding solution, but this is test data
	,DirectEarnedPremiumBaseAmt = CASE WHEN FinancialPeriodStart=MaxPeriodStart THEN (SELECT X.DirectUnearnedPremiumBaseAmt FROM EarnedUnearned X WHERE X.EarnKey = EarnedUnearned.EarnKey AND X.FinancialPeriodStart = EarnedUnearned.PriorPeriodStart)
										ELSE DirectEarnedPremiumBaseAmt END
	,DirectEarnedTaxSurchargeFeeBaseAmt = CASE WHEN FinancialPeriodStart=MaxPeriodStart THEN (SELECT X.DirectEarnedTaxSurchargeFeeBaseAmt FROM EarnedUnearned X WHERE X.EarnKey = EarnedUnearned.EarnKey AND X.FinancialPeriodStart = EarnedUnearned.PriorPeriodStart)
										ELSE DirectEarnedTaxSurchargeFeeBaseAmt END
	,DirectUnearnedPremiumBaseAmt = CASE WHEN FinancialPeriodStart=MaxPeriodStart THEN 0 ELSE DirectUnearnedPremiumBaseAmt END
	,DirectUnearnedTaxSurchargeFeeBaseAmt = CASE WHEN FinancialPeriodStart=MaxPeriodStart THEN 0 ELSE DirectUnearnedTaxSurchargeFeeBaseAmt END
	,AssumedWrittenPremiumBaseAmt
	,AssumedTaxBaseAmt
	,AssumedFeeBaseAmt
	,AssumedSurchargeBaseAmt
	,AssumedWrittenPremiumITDBaseAmt
	,AssumedTaxSurchargeFeeITDBaseAmt
	,AssumedEarnedPremiumBaseAmt
	,AssumedEarnedTaxSurchargeFeeBaseAmt
	,AssumedUnearnedPremiumBaseAmt
	,AssumedUnearnedTaxSurchargeFeeBaseAmt
	,CededPremiumBaseAmt
	,CededEarnedPremiumBaseAmt
	,CededUnearnedPremiumBaseAmt
	,CommissionBaseAmt
	,CommissionPct
	,DirectExposureBaseAmt
	,AssumedExposureBaseAmt
	,EarnedExposureBaseAmt
	,UnearnedExposureBaseAmt
FROM
	EarnedUnearned
WHERE
	EarnedUnearned.SourceSystemCode = Root.SourceSystemCode AND EarnedUnearned.SourceSystemDesc = Root.SourceSystemDesc
FOR JSON PATH) AS EarnedPremiumDetail
FROM
	Root
FOR JSON PATH
) jsonline
)a
*/



GO
