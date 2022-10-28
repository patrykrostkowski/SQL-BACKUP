USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcFinanceEarnedPremiumDetail]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE  VIEW [StgPolicy].[SrcFinanceEarnedPremiumDetail]
AS
SELECT SourceSystemCode
	,ssr.PolicySourceSystemCode
	,AgencyNum 
        ,AgencySourceCode 
        ,AnnualStatementLineofBusinessCode 
        ,AnnualStatementLineofBusinessDesc 
        ,AssumedEarnedPremiumBaseAmt 
        ,AssumedEarnedTaxSurchargeFeeBaseAmt 
        ,AssumedExposureBaseAmt 
        ,AssumedFeeBaseAmt 
        ,AssumedSurchargeBaseAmt 
        ,AssumedTaxBaseAmt 
        ,AssumedTaxSurchargeFeeITDBaseAmt 
        ,AssumedUnearnedPremiumBaseAmt 
        ,AssumedUnearnedTaxSurchargeFeeBaseAmt 
        ,AssumedWrittenPremiumBaseAmt 
        ,AssumedWrittenPremiumITDBaseAmt 
        ,BaseCurrencyCode 
        ,BaseCurrencyDesc 
        ,CededEarnedPremiumBaseAmt 
        ,CededPremiumBaseAmt 
        ,CededUnearnedPremiumBaseAmt 
        ,ClassCode 
        ,ClassCodeDesc 
        ,CommissionBaseAmt 
        ,CommissionPct 
        ,CountryCode 
        ,CountryDesc 
        ,CoverageCode 
        ,CoverageDesc 
        ,DirectEarnedPremiumBaseAmt 
        ,DirectEarnedTaxSurchargeFeeBaseAmt 
        ,DirectExposureBaseAmt 
        ,DirectFeeBaseAmt 
        ,DirectSurchargeBaseAmt 
        ,DirectTaxBaseAmt 
        ,DirectTaxSurchargeFeeITDBaseAmt 
        ,DirectUnearnedPremiumBaseAmt 
        ,DirectUnearnedTaxSurchargeFeeBaseAmt 
        ,DirectWrittenPremiumBaseAmt 
        ,DirectWrittenPremiumITDBaseAmt 
        ,EarnedCommissionBaseAmt 
        ,EarnedExposureBaseAmt 
        ,EarnedPremiumDetailSourceCode 
        ,FinancialReportingPeriod
        ,InsuredName 
        ,InsuredSourceCode 
        ,IsFullyEarnedInd 
        ,IsIncludedInPremiumInd 
        ,IsPremiumWaivedInd 
        ,LineofBusinessCode 
        ,LineofBusinessDesc 
        ,PolicyEffectiveDate 
        ,PolicyExpirationDate 
        ,PolicyNum 
        ,PolicySourceCode 
        ,PolicyTransEffectiveDate 
        ,PolicyTransExpirationDate 
        ,PolicyTransNum 
        ,PolicyTransSourceCode 
        ,PolicyTransTypeCode 
        ,PolicyTransTypeDesc 
        ,PremiumTypeCode 
        ,PremiumTypeDesc 
        ,convert(datetime, ProcessDateTime, 127) as ProcessDateTime 
        ,ProfitAnalysisCode 
        ,ProfitAnalysisDesc 
        ,StatCode 
        ,StatCodeDesc 
        ,StateCode 
        ,StateDesc 
        ,SubCoverageCode 
        ,SubCoverageDesc 
        ,UnEarnedCommissionBaseAmt 
        ,UnearnedExposureBaseAmt 
        ,WritingCompanyCode 
        ,WritingCompanyName 

FROM StgPolicy.EarningsData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,EarnedPremiumDetail NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.EarnedPremiumDetail) WITH (
		AgencyNum NVARCHAR(max)
        ,AgencySourceCode NVARCHAR(max)
        ,AnnualStatementLineofBusinessCode NVARCHAR(max)
        ,AnnualStatementLineofBusinessDesc NVARCHAR(max)
        ,AssumedEarnedPremiumBaseAmt NVARCHAR(max)
        ,AssumedEarnedTaxSurchargeFeeBaseAmt NVARCHAR(max)
        ,AssumedExposureBaseAmt NVARCHAR(max)
        ,AssumedFeeBaseAmt NVARCHAR(max)
        ,AssumedSurchargeBaseAmt NVARCHAR(max)
        ,AssumedTaxBaseAmt NVARCHAR(max)
        ,AssumedTaxSurchargeFeeITDBaseAmt NVARCHAR(max)
        ,AssumedUnearnedPremiumBaseAmt NVARCHAR(max)
        ,AssumedUnearnedTaxSurchargeFeeBaseAmt NVARCHAR(max)
        ,AssumedWrittenPremiumBaseAmt NVARCHAR(max)
        ,AssumedWrittenPremiumITDBaseAmt NVARCHAR(max)
        ,BaseCurrencyCode NVARCHAR(max)
        ,BaseCurrencyDesc NVARCHAR(max)
        ,CededEarnedPremiumBaseAmt NVARCHAR(max)
        ,CededPremiumBaseAmt NVARCHAR(max)
        ,CededUnearnedPremiumBaseAmt NVARCHAR(max)
        ,ClassCode NVARCHAR(max)
        ,ClassCodeDesc NVARCHAR(max)
        ,CommissionBaseAmt NVARCHAR(max)
        ,CommissionPct NVARCHAR(max)
        ,CountryCode NVARCHAR(max)
        ,CountryDesc NVARCHAR(max)
        ,CoverageCode NVARCHAR(max)
        ,CoverageDesc NVARCHAR(max)
        ,DirectEarnedPremiumBaseAmt NVARCHAR(max)
        ,DirectEarnedTaxSurchargeFeeBaseAmt NVARCHAR(max)
        ,DirectExposureBaseAmt NVARCHAR(max)
        ,DirectFeeBaseAmt NVARCHAR(max)
        ,DirectSurchargeBaseAmt NVARCHAR(max)
        ,DirectTaxBaseAmt NVARCHAR(max)
        ,DirectTaxSurchargeFeeITDBaseAmt NVARCHAR(max)
        ,DirectUnearnedPremiumBaseAmt NVARCHAR(max)
        ,DirectUnearnedTaxSurchargeFeeBaseAmt NVARCHAR(max)
        ,DirectWrittenPremiumBaseAmt NVARCHAR(max)
        ,DirectWrittenPremiumITDBaseAmt NVARCHAR(max)
        ,EarnedCommissionBaseAmt NVARCHAR(max)
        ,EarnedExposureBaseAmt NVARCHAR(max)
        ,EarnedPremiumDetailSourceCode NVARCHAR(max)
        ,FinancialReportingPeriod NVARCHAR(max)
        ,InsuredName NVARCHAR(max)
        ,InsuredSourceCode NVARCHAR(max)
        ,IsFullyEarnedInd NVARCHAR(max)
        ,IsIncludedInPremiumInd NVARCHAR(max)
        ,IsPremiumWaivedInd NVARCHAR(max)
        ,LineofBusinessCode NVARCHAR(max)
        ,LineofBusinessDesc NVARCHAR(max)
        ,PolicyEffectiveDate NVARCHAR(max)
        ,PolicyExpirationDate NVARCHAR(max)
        ,PolicyNum NVARCHAR(max)
        ,PolicySourceCode NVARCHAR(max)
        ,PolicyTransEffectiveDate NVARCHAR(max)
        ,PolicyTransExpirationDate NVARCHAR(max)
        ,PolicyTransNum NVARCHAR(max)
        ,PolicyTransSourceCode NVARCHAR(max)
        ,PolicyTransTypeCode NVARCHAR(max)
        ,PolicyTransTypeDesc NVARCHAR(max)
        ,PremiumTypeCode NVARCHAR(max)
        ,PremiumTypeDesc NVARCHAR(max)
        ,ProcessDateTime NVARCHAR(max)
        ,ProfitAnalysisCode NVARCHAR(max)
        ,ProfitAnalysisDesc NVARCHAR(max)
        ,StatCode NVARCHAR(max)
        ,StatCodeDesc NVARCHAR(max)
        ,StateCode NVARCHAR(max)
        ,StateDesc NVARCHAR(max)
        ,SubCoverageCode NVARCHAR(max)
        ,SubCoverageDesc NVARCHAR(max)
        ,UnEarnedCommissionBaseAmt NVARCHAR(max)
        ,UnearnedExposureBaseAmt NVARCHAR(max)
        ,WritingCompanyCode NVARCHAR(max)
        ,WritingCompanyName NVARCHAR(max)
		) ear
		join Config.SourceSystemRelationshipConfig ssr on ssr.EarningsSourceSystemCode = hdr.SourceSystemCode

WHERE 1 = 1
GO
