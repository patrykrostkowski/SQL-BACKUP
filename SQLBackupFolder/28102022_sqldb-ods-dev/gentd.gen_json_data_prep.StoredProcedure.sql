USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [gentd].[gen_json_data_prep]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [gentd].[gen_json_data_prep]
as

DROP TABLE IF EXISTS ##Root
CREATE TABLE ##Root(
	SourceSystemCode varchar(200)
	,SourceSystemDesc varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
)

DROP TABLE IF EXISTS ##Policy
CREATE TABLE ##Policy(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	--LEVEL UP COLUMNS -- END
	,PolicySourceCode varchar(200)
	,EffectiveJobNum varchar(200)
	,BaseCurrencyCode varchar(200)
	,BaseCurrencyDesc varchar(200)
	,OriginalCurrencyCode varchar(200)
	,OriginalCurrencyDesc varchar(200)
	,ReportingCurrencyCode varchar(200)
	,ReportingCurrencyDesc varchar(200)
	,IsPremiumWaivedInd int
	,PolicyTypeCode varchar(200)
	,PolicyTypeDesc varchar(200)
	,LeadExcessQuotaCode varchar(200)
	,LeadExcessQuotaDesc varchar(200)
	,BusinessUnitCode varchar(200)
	,BusinessUnitDesc varchar(200)
	,BusinessTypeCode varchar(200)
	,BusinessTypeDesc varchar(200)
	,UnderwritingStatusCode varchar(200)
	,UnderwritingStatusDesc varchar(200)
	,AttachmentTypeCode varchar(200)
	,AttachmentTypeDesc varchar(200)
	,ProjectTypeCode varchar(200)
	,ProjectTypeDesc varchar(200)
	,PolicyStatusCode varchar(200)
	,PolicyStatusDesc varchar(200)
	,GoverningStateCode varchar(200)
	,GoverningStateDesc varchar(200)
	,DomicileStateCode varchar(200)
	,DomicileStateDesc varchar(200)
	,DomicileCountryCode varchar(200)
	,DomicileCountryDesc varchar(200)
	,StandardIndustryCode varchar(200)
	,StandardIndustryCodeDesc varchar(200)
	,NorthAmericanIndustryClassificationCode varchar(200)
	,NorthAmericanIndustryClassificationDesc varchar(200)
	,ProfessionCode varchar(200)
	,ProfessionDesc varchar(200)
	,DepartmentCode varchar(200)
	,DepartmentDesc varchar(200)
	,CoverageTriggerCode varchar(200)
	,CoverageTriggerDesc varchar(200)
	,AuditTransactionCode varchar(200)
	,AuditTransactionDesc varchar(200)
	,PayPlanCode varchar(200)
	,PayPlanDesc varchar(200)
	,BillTypeCode varchar(200)
	,BillTypeDesc varchar(200)
	,UniqueMarketReferenceNum varchar(200)
	,SharePct decimal(20, 6)
	,IsNewYorkFreeTradeZoneInd int
	,NewYorkFreeTradeZoneDesc varchar(200)
	,IsFacultativeReinsurancePurchasedInd int
	,IsMultiStateInd int
	,ProjectName varchar(200)
	,IsRunoffERPInd int
	,RunoffERPDate date
	,IsPremiumAuditableInd int
	,DaysNoticeOfCancellationNum int
	,PolicyNum varchar(200)
	,LegacyPolicyNum varchar(200)
	,TermNum varchar(200)
	,DirectAssumedCode varchar(200)
	,DirectAssumedDesc varchar(200)
	,QuoteNum varchar(200)
	,QuoteVersionNum int
	,EffectiveDate date
	,OriginalEffectiveDate date
	,ExpirationDate date
	,TailDate date
	,UnderwritingYear varchar(200)
	,IssuanceDateTime datetime
	,CancellationDate date
	,CancellationTypeCode varchar(200)
	,CancellationTypeDesc varchar(200)
	,GovernClassCode varchar(200)
	,GovernClassCodeDesc varchar(200)
	,AuditFrequencyCode varchar(200)
	,AuditFrequencyDesc varchar(200)
	,CancellationRateCode varchar(200)
	,CancellationRateDesc varchar(200)
	,ProducingBranchNum varchar(200)
	,PlanGroupCode varchar(200)
	,AnnualStatementLineofBusinessCode varchar(200)
	,AnnualStatementLineofBusinessDesc varchar(200)
	,IsRetroPolicyInd int
)

DROP TABLE IF EXISTS ##PolicyTrans
CREATE TABLE ##PolicyTrans(
	 --LEVEL UP COLUMNS -- BEGIN
	 SourceSystemCode varchar(200)
	 ,ProcessDateTime datetime
	 ,PolicySourceCode varchar(200)
	 --LEVEL UP COLUMNS -- END
	 ,PolicyTransSourceCode varchar(200)
	 ,PolicyNum varchar(200)
	 ,TermNum varchar(200)
	 ,PolicyTransNum varchar(200)
	 ,PolicyTransVersionNum int
	 ,PolicyTransTypeCode varchar(200)
	 ,PolicyTransTypeDesc varchar(200)
	 ,TransStartDatetime datetime
	 ,TransEndDatetime datetime
	 ,PolicyTransStatusCode varchar(200)
	 ,PolicyTransStatusDesc varchar(200)
	 ,UnderwritingStatusCode varchar(200)
	 ,UnderwritingStatusDesc varchar(200)
	 ,RegistrationDate date
	 ,PolicyIssuanceDate date
	 ,PolicyCancellationDate date
	 ,NextRenewalCheckDate date
	 ,RetroActiveDate date
	 ,BusinessUnitCode varchar(200)
	 ,BusinessUnitDesc varchar(200)
	 ,PolicyEffectiveDate date
	 ,LegacyPolicyNum varchar(200)
	 ,PolicyExpirationDate date
	 ,IsTransportationPolicyInd int
	 ,StandardIndustryCode varchar(200)
	 ,StandardIndustryCodeDesc varchar(200)
	 ,NorthAmericanIndustryClassificationCode varchar(200)
	 ,NorthAmericanIndustryClassificationDesc varchar(200)
	 ,IsPremiumWaivedInd int
	 ,BaseCurrencyCode varchar(200)
	 ,BaseCurrencyDesc varchar(200)
	 ,OriginalCurrencyCode varchar(200)
	 ,OriginalCurrencyDesc varchar(200)
	 ,ReportingCurrencyCode varchar(200)
	 ,ReportingCurrencyDesc varchar(200)
	 ,UltimateLossRatioPct decimal(20, 6)
	 ,RevisedUltimateLossRatioPct decimal(20, 6)
	 ,PercentOfTechnicalPricePct decimal(20, 6)
	 ,PremiumChangePct decimal(20, 6)
	 ,DeductionsAttachmentsChangePct decimal(20, 6)
	 ,CoverageChangePct decimal(20, 6)
	 ,ExposureChangePct decimal(20, 6)
	 ,IsRenewalPriceIndexDataInd int
	 ,RenewalPriceIndexPct decimal(20, 6)
	 ,IsPolicyEffectiveDateProposedInd int
	 ,IsPolicyExpirationDateProposedInd int
	 ,IsProjectPolicyInd int
	 ,IsFacReinsurancePurchasedInd int
	 ,ProjectName varchar(200)
	 ,ProjectTypeCode varchar(200)
	 ,ProjectTypeDesc varchar(200)
	 ,ISOClassCode varchar(200)
	 ,IsNYFreeTradeZoneInd int
	 ,NYFreeTradeZoneClassCode varchar(200)
	 ,IsPolicyTrackAsNonRecurringPremiumInd int
	 ,IsMiddleMarketPolicyInd int
	 ,BusinessTypeCode varchar(200)
	 ,BusinessTypeDesc varchar(200)
	 ,IsMGAInd int
	 ,FrontingCompanyName varchar(200)
	 ,IsRunoffERPInd int
	 ,RunoffERPDate date
	 ,IsFirmOrderNotedInd int
	 ,WrittenLinePct decimal(20, 6)
	 ,SignedLinePct decimal(20, 6)
	 ,PremiumAllocationPct decimal(20, 6)
	 ,CoverageTriggerCode varchar(200)
	 ,CoverageTriggerDesc varchar(200)
	 ,ProfessionCode varchar(200)
	 ,ProfessionDesc varchar(200)
	 ,DomicileCountryCode varchar(200)
	 ,DomicileCountryDesc varchar(200)
	 ,DomicileStateCode varchar(200)
	 ,DomicileStateDesc varchar(200)
	 ,MinimumEarnedPremiumPct decimal(20, 6)
	 ,TreatyOrReferralAppliesDesc varchar(200)
	 ,DaysNoticeOfCancellationNum int
	 ,IsFacultativeEquipmentBreakdownInd int
	 ,IsEquipmentBreakdownPremiumIncludedInd int
	 ,IsComboPolicyInd int
	 ,IsAdmittedDeregInd int
	 ,QuotaShareAppliesInd int
	 ,IsSharedLimitInd int
	 ,PendingAndPriorLitigationDate date
	 ,IsPremiumAuditableInd int
	 ,IsTRIAOfferedInd int
	 ,IsFortune500CompanyInd int
	 ,ClassOfBusinessCode varchar(200)
	 ,IsBureauInd int
	 ,IsDeclarationPremBearingInd int
	 ,IsRiskBordereauProvidedInd int
	 ,IsClaimBordereauProvidedInd int
	 ,IsPaidPremiumBordereauProvidedInd int
	 ,IsFrontedInd int
	 ,IsCombinedPackageInd int
	 ,IsTradeAssocInd int
	 ,IndustryClassCode varchar(200)
	 ,IsMultilineDiscountInd int
	 ,IsDriverMonitoringInfoInd int
	 ,IsManualAuditInd int
	 ,MarketSegmentCode varchar(200)
	 ,IsTPAUsedInd int
	 ,NumEmployee int
	 ,IsBrokerageInd int
	 ,IsUnionInd int
	 ,IsQuoteEZPayInd int
)

DROP TABLE IF EXISTS ##LineOfBusiness
CREATE TABLE ##LineOfBusiness(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	,PolicyTransSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,LineOfBusinessSourceCode varchar(200)
	,LineOfBusinessCode varchar(200)
	,LineOfBusinessDesc varchar(200)
	,SplitNum int
	,SplitEffectiveDate date
	,SplitExpirationDate date
	,RateEffectiveDate date
	,IsSplitRateInd int
	,IsBillingWaivePremiumInd int
	,IsBillingWaivePremiumOverrideInd int
	,IsFacReinsuranceInd int
	,UnderlyingInfoDesc varchar(200)
	,MaxCommissionPct decimal(18, 6)
	,ProfitCenterCode varchar(200)
	,ProfitCenterDesc varchar(200)
)

DROP TABLE IF EXISTS ##Geography
CREATE TABLE ##Geography(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	,LineOfBusinessSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,GeographySourceCode varchar(200)
	,CountryCode varchar(200)
	,CountryDesc varchar(200)
	,TerritoryName varchar(200)
	,StateCode varchar(200)
	,StateDesc varchar(200)
	,RegionName varchar(200)
	,CountyName varchar(200)
	,GovernClassByStateCode varchar(200)
	,GovernClassByStateDesc varchar(200)
)

DROP TABLE IF EXISTS ##InsurableObject
CREATE TABLE ##InsurableObject(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	,GeographySourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,InsurableObjectSourceCode varchar(200)
	,InsurableObjectTypeCode varchar(200)
	,InsurableObjectTypeDesc varchar(200)
	,InsuredSourceCode varchar(200)
	,RiskLocationCode varchar(200)
	,RiskLocationDesc varchar(200)
	,EarthquakeZoneCode varchar(200)
	,EarthquakeZoneDesc varchar(200)
	,FireDistrictCode varchar(200)
	,FireDistrictDesc varchar(200)
	,FireStationName varchar(200)
	,FireStationLocationName varchar(200)
	,LatitudeCode varchar(200)
	,LongitudeCode varchar(200)
	,FireStationCountyTownName varchar(200)
	,FireStationTownshipName varchar(200)
	,NumEmployeesPartTime int
	,NumEmployeesFullTime int
	,BusinessHoursStartTime varchar(200)
	,BusinessHoursCloseTime varchar(200)
)

DROP TABLE IF EXISTS ##Coverage
CREATE TABLE ##Coverage(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	,master varchar(200) --LineOfBusinessCoverage OR InsurableObjectCoverage
	,LineOfBusinessSourceCode varchar(200)
	,InsurableObjectSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,CoverageSourceCode varchar(200)
	,AnnualStatementLineofBusinessCode varchar(200)
	,AnnualStatementLineofBusinessDesc varchar(200)
	,CoverageCode varchar(200)
	,CoverageDesc varchar(200)
	,CoverageClassCode varchar(200)
	,CoverageClassDesc varchar(200)
	,CoverageGroupCode varchar(200)
	,CoverageGroupDesc varchar(200)
	,CoverageTriggerCode varchar(200)
	,CoverageTriggerDesc varchar(200)
	,ClassCode varchar(200)
	,ClassCodeDesc varchar(200)
	,EffectiveDate date
	,ExpirationDate date
	,CancellationDate date
	,IsMajorCoverageInd int
	,IsIncludedInPremiumInd int
	,IsMineSubsidenceInd int
)

DROP TABLE IF EXISTS ##Insured
CREATE TABLE ##Insured(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,InsuredSourceCode varchar(200)
	,AccountNum varchar(200)
	,ParentName varchar(200)
	,ParentDUNSNum varchar(200)
	,DBAName varchar(200)
	,USTickerSymbolName varchar(200)
	,DomicileCountryCode varchar(200)
	,DomicileCountryDesc varchar(200)
	,DomicileStateCode varchar(200)
	,DomicileStateDesc varchar(200)
	,TotalEmployeesNum int
	,MarketValueAmt varchar(200)
	,SICCode varchar(200)
	,NorthAmericanIndustryClassificationCode varchar(200)
	,NorthAmericanIndustryClassificationDesc varchar(200)
	,PrimaryDBAIndustryName varchar(200)
	,StateOfIncorporationName varchar(200)
)

DROP TABLE IF EXISTS ##Account
CREATE TABLE ##Account(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,AccountSourceCode varchar(200)
	,AccountNum varchar(200)
	,EffectiveDate date
	,AccountName varchar(200)
	,PrimaryContactFullName varchar(200)
	,PrimaryPhoneNum varchar(200)
	,IsAccountBillInd int
	,BankName varchar(200)
	,BankRoutingNum varchar(200)
)

DROP TABLE IF EXISTS ##WritingCompany
CREATE TABLE ##WritingCompany(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,master varchar(200) --Policy OR PolicyTrans
	,PolicySourceCode varchar(200)
	,PolicyTransSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,WritingCompanySourceCode varchar(200)
	,WritingCompanyCode varchar(200)
	,WritingCompanyName varchar(200)
	,NorthAmericanIndustryClassificationCode varchar(200)
	,FederalEmployerIdentificationNumberCode varchar(200)
	,AMBestCode varchar(200)
	,IsActiveInd int
	,IsAdmittedInd int
	,IsBranchInd int
	,IsFrontingCompanyInd int
	,BaseCurrencyCode varchar(200)
	,NCCICompanyCode varchar(200)
)

DROP TABLE IF EXISTS ##PartyInfo
CREATE TABLE ##PartyInfo(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	,master varchar(200) --Insured OR Account OR Agency OR MiscParty
	,InsuredSourceCode varchar(200)
	,AccountSourceCode varchar(200)
	,AgencySourceCode varchar(200)
	,MiscPartySourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,PartyInfoSourceCode varchar(200)
	,SourceMasterNum varchar(200)
	,PartyTypeCode varchar(200)
	,PartyTypeDesc varchar(200)
	,PartyReferenceDesc varchar(200)
	,FirstName varchar(200)
	,MiddleName varchar(200)
	,LastName varchar(200)
	,FullName varchar(200)
	,GenderCode varchar(200)
	,MaritalStatusCode varchar(200)
	,BirthDate date
	,SocialSecurityNum varchar(200)
	,OccupationDesc varchar(200)
	,DriverLicenseNum varchar(200)
	,DriverLicenseStateCode varchar(200)
	,DriverLicenseStateDesc varchar(200)
	,OrganizationName varchar(200)
	,LegalName varchar(200)
	,FEINNum varchar(200)
	,DBAName varchar(200)
	,ContactFirstName varchar(200)
	,ContactMiddleName varchar(200)
	,ContactLastName varchar(200)
	,ContactFullName varchar(200)
	,TaxIdNum varchar(200)
	,SICCode varchar(200)
	,SICDesc varchar(200)
	,NorthAmericanIndustryClassificationCode varchar(200)
	,NorthAmericanIndustryClassificationDesc varchar(200)
	,OwnershipTypeCode varchar(200)
	,OwnershipTypeDesc varchar(200)
)

DROP TABLE IF EXISTS ##PartyRole
CREATE TABLE ##PartyRole(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	,master varchar(200) --Insured OR Account OR Agency OR MiscParty
	,InsuredSourceCode varchar(200)
	,AccountSourceCode varchar(200)
	,AgencySourceCode varchar(200)
	,MiscPartySourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,PartyRoleSourceCode varchar(200)
	,PartyRoleCode varchar(200)
	,PartyRoleDesc varchar(200)
)

DROP TABLE IF EXISTS ##PartyAddress
CREATE TABLE ##PartyAddress(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	,master varchar(200) --Insured OR Account OR Agency OR MiscParty
	,InsuredSourceCode varchar(200)
	,AccountSourceCode varchar(200)
	,AgencySourceCode varchar(200)
	,MiscPartySourceCode varchar(200)
	,PartyRoleSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,PartyAddressSourceCode varchar(200)
	,AddressTypeCode varchar(200)
	,AddressTypeDesc varchar(200)
	,AddressLine1 varchar(200)
	,AddressLine2 varchar(200)
	,AddressLine3 varchar(200)
	,AddressLine4 varchar(200)
	,CityName varchar(200)
	,CountyName varchar(200)
	,StateCode varchar(200)
	,StateDesc varchar(200)
	,CountryCode varchar(200)
	,CountryDesc varchar(200)
	,PostalCode varchar(200)
	,ContactName varchar(200)
	,IsPrimaryInd int
)

DROP TABLE IF EXISTS ##TransactionCost_Coverage
CREATE TABLE ##TransactionCost_Coverage(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	,master varchar(200) --LineOfBusinessCoverage OR InsurableObjectCoverage
	,LineOfBusinessSourceCode varchar(200)
	,InsurableObjectSourceCode varchar(200)
	,CoverageSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,CurrentTermBaseAmt decimal(20, 6)
	,CurrentTermOriginalAmt decimal(20, 6)
	,CurrentTermReportingAmt decimal(20, 6)
	,WrittenPremiumBaseAmt decimal(20, 6)
	,WrittenPremiumOriginalAmt decimal(20, 6)
	,WrittenPremiumReportingAmt decimal(20, 6)
	,AddlRetPremBaseAmt decimal(20, 6)
	,AddlRetPremOriginalAmt decimal(20, 6)
	,AddlRetPremReportingAmt decimal(20, 6)
)

DROP TABLE IF EXISTS ##PolicyDiscount
CREATE TABLE ##PolicyDiscount(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	,master varchar(200) --LineOfBusinessCoverage OR InsurableObjectCoverage OR LineOfBusiness OR InsurableObject
	,LineOfBusinessSourceCode varchar(200)
	,InsurableObjectSourceCode varchar(200)
	,CoverageSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,PolicyDiscountSourceCode varchar(200)
	,DiscountLevelCode varchar(200)
	,DiscountLevelDesc varchar(200)
	,DiscountTypeCode varchar(200)
	,DiscountTypeDesc varchar(200)
	,PolicyDiscountBaseAmt decimal(20, 6)
	,PolicyDiscountOriginalAmt decimal(20, 6)
	,PolicyDiscountReportingAmt decimal(20, 6)
)

DROP TABLE IF EXISTS ##PolicyFee
CREATE TABLE ##PolicyFee(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	,master varchar(200) --LineOfBusinessCoverage OR InsurableObjectCoverage OR LineOfBusiness
	,LineOfBusinessSourceCode varchar(200)
	,InsurableObjectSourceCode varchar(200)
	,CoverageSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,PolicyFeeSourceCode varchar(200)
	,CoverageFeeTypeCode varchar(200)
	,CoverageFeeTypeDesc varchar(200)
	,FeeLevelTypeCode varchar(200)
	,FeeLevelTypeDesc varchar(200)
	,ClassCode varchar(200)
	,ClassCodeDesc varchar(200)
	,StatCode varchar(200)
	,StatCodeDesc varchar(200)
	,CoverageFeeBaseAmt decimal(20, 6)
	,CoverageFeeOriginalAmt decimal(20, 6)
	,CoverageFeeReportingAmt decimal(20, 6)
	,FeeEffectiveDate varchar(200)
	,FeeExpirationDate varchar(200)
	,FeeChargeTypeCode varchar(200)
	,FeeChargeTypeDesc varchar(200)
	,IsSurchargeInd int
	,IsIncludedInPremiumInd int
	,IsFullyEarnedInd int
)

DROP TABLE IF EXISTS ##Agency
CREATE TABLE ##Agency(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,PolicySourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,AgencySourceCode varchar(200)
	,AgencyNum varchar(200)
	,NewBusinessCommissionPct decimal(20, 6)
	,RenewalCommissionPct decimal(20, 6)
	,LicenseNum varchar(200)
	,AppointmentEffectiveDate varchar(200)
	,AppointmentExpirationDate varchar(200)
	,LicenseName varchar(200)
	,SurplusLicenseNum varchar(200)
	,OrganizationName varchar(200)
	,BranchNum varchar(200)
	,IsAppointedInd int
	,IsActiveInd int
)

GO
