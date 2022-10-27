USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [gentd].[gen_json_data_file]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   procedure [gentd].[gen_json_data_file] as 

truncate table [gentd].[output_data_amfam]
insert into [gentd].[output_data_amfam](JsonLine, FileName)
select jsonline, PolicyNum as FileName from (
select (
select root.SourceSystemCode
	,root.SourceSystemDesc
	,root.ProcessDateTime
	,pol.PolicySourceCode as 'Policy.PolicySourceCode'
	,pol.EffectiveJobNum as 'Policy.EffectiveJobNum'
	,pol.BaseCurrencyCode as 'Policy.BaseCurrencyCode'
	,pol.BaseCurrencyDesc as 'Policy.BaseCurrencyDesc'
	,pol.OriginalCurrencyCode as 'Policy.OriginalCurrencyCode'
	,pol.OriginalCurrencyDesc as 'Policy.OriginalCurrencyDesc'
	,pol.ReportingCurrencyCode as 'Policy.ReportingCurrencyCode'
	,pol.ReportingCurrencyDesc as 'Policy.ReportingCurrencyDesc'
	,pol.IsPremiumWaivedInd as 'Policy.IsPremiumWaivedInd'
	,pol.PolicyTypeCode as 'Policy.PolicyTypeCode'
	,pol.PolicyTypeDesc as 'Policy.PolicyTypeDesc'
	,pol.LeadExcessQuotaCode as 'Policy.LeadExcessQuotaCode'
	,pol.LeadExcessQuotaDesc as 'Policy.LeadExcessQuotaDesc'
	,pol.BusinessUnitCode as 'Policy.BusinessUnitCode'
	,pol.BusinessUnitDesc as 'Policy.BusinessUnitDesc'
	,pol.BusinessTypeCode as 'Policy.BusinessTypeCode'
	,pol.BusinessTypeDesc as 'Policy.BusinessTypeDesc'
	,pol.UnderwritingStatusCode as 'Policy.UnderwritingStatusCode'
	,pol.UnderwritingStatusDesc as 'Policy.UnderwritingStatusDesc'
	,pol.AttachmentTypeCode as 'Policy.AttachmentTypeCode'
	,pol.AttachmentTypeDesc as 'Policy.AttachmentTypeDesc'
	,pol.ProjectTypeCode as 'Policy.ProjectTypeCode'
	,pol.ProjectTypeDesc as 'Policy.ProjectTypeDesc'
	,pol.PolicyStatusCode as 'Policy.PolicyStatusCode'
	,pol.PolicyStatusDesc as 'Policy.PolicyStatusDesc'
	,pol.GoverningStateCode as 'Policy.GoverningStateCode'
	,pol.GoverningStateDesc as 'Policy.GoverningStateDesc'
	,pol.DomicileStateCode as 'Policy.DomicileStateCode'
	,pol.DomicileStateDesc as 'Policy.DomicileStateDesc'
	,pol.DomicileCountryCode as 'Policy.DomicileCountryCode'
	,pol.DomicileCountryDesc as 'Policy.DomicileCountryDesc'
	,pol.StandardIndustryCode as 'Policy.StandardIndustryCode'
	,pol.StandardIndustryCodeDesc as 'Policy.StandardIndustryCodeDesc'
	,pol.NorthAmericanIndustryClassificationCode as 'Policy.NorthAmericanIndustryClassificationCode'
	,pol.NorthAmericanIndustryClassificationDesc as 'Policy.NorthAmericanIndustryClassificationDesc'
	,pol.ProfessionCode as 'Policy.ProfessionCode'
	,pol.ProfessionDesc as 'Policy.ProfessionDesc'
	,pol.DepartmentCode as 'Policy.DepartmentCode'
	,pol.DepartmentDesc as 'Policy.DepartmentDesc'
	,pol.CoverageTriggerCode as 'Policy.CoverageTriggerCode'
	,pol.CoverageTriggerDesc as 'Policy.CoverageTriggerDesc'
	,pol.AuditTransactionCode as 'Policy.AuditTransactionCode'
	,pol.AuditTransactionDesc as 'Policy.AuditTransactionDesc'
	,pol.PayPlanCode as 'Policy.PayPlanCode'
	,pol.PayPlanDesc as 'Policy.PayPlanDesc'
	,pol.BillTypeCode as 'Policy.BillTypeCode'
	,pol.BillTypeDesc as 'Policy.BillTypeDesc'
	,pol.UniqueMarketReferenceNum as 'Policy.UniqueMarketReferenceNum'
	,pol.SharePct as 'Policy.SharePct'
	,pol.IsNewYorkFreeTradeZoneInd as 'Policy.IsNewYorkFreeTradeZoneInd'
	,pol.NewYorkFreeTradeZoneDesc as 'Policy.NewYorkFreeTradeZoneDesc'
	,pol.IsFacultativeReinsurancePurchasedInd as 'Policy.IsFacultativeReinsurancePurchasedInd'
	,pol.IsMultiStateInd as 'Policy.IsMultiStateInd'
	,pol.ProjectName as 'Policy.ProjectName'
	,pol.IsRunoffERPInd as 'Policy.IsRunoffERPInd'
	,pol.RunoffERPDate as 'Policy.RunoffERPDate'
	,pol.IsPremiumAuditableInd as 'Policy.IsPremiumAuditableInd'
	,pol.DaysNoticeOfCancellationNum as 'Policy.DaysNoticeOfCancellationNum'
	,pol.PolicyNum as 'Policy.PolicyNum'
	,pol.LegacyPolicyNum as 'Policy.LegacyPolicyNum'
	,pol.TermNum as 'Policy.TermNum'
	,pol.DirectAssumedCode as 'Policy.DirectAssumedCode'
	,pol.DirectAssumedDesc as 'Policy.DirectAssumedDesc'
	,pol.QuoteNum as 'Policy.QuoteNum'
	,pol.QuoteVersionNum as 'Policy.QuoteVersionNum'
	,pol.EffectiveDate as 'Policy.EffectiveDate'
	,pol.OriginalEffectiveDate as 'Policy.OriginalEffectiveDate'
	,pol.ExpirationDate as 'Policy.ExpirationDate'
	,pol.TailDate as 'Policy.TailDate'
	,pol.UnderwritingYear as 'Policy.UnderwritingYear'
	,pol.IssuanceDateTime as 'Policy.IssuanceDateTime'
	,pol.CancellationDate as 'Policy.CancellationDate'
	,pol.CancellationTypeCode as 'Policy.CancellationTypeCode'
	,pol.CancellationTypeDesc as 'Policy.CancellationTypeDesc'
	,pol.GovernClassCode as 'Policy.GovernClassCode'
	,pol.GovernClassCodeDesc as 'Policy.GovernClassCodeDesc'
	,pol.AuditFrequencyCode as 'Policy.AuditFrequencyCode'
	,pol.AuditFrequencyDesc as 'Policy.AuditFrequencyDesc'
	,pol.CancellationRateCode as 'Policy.CancellationRateCode'
	,pol.CancellationRateDesc as 'Policy.CancellationRateDesc'
	,pol.ProducingBranchNum as 'Policy.ProducingBranchNum'
	,pol.PlanGroupCode as 'Policy.PlanGroupCode'
	,pol.AnnualStatementLineofBusinessCode as 'Policy.AnnualStatementLineofBusinessCode'
	,pol.AnnualStatementLineofBusinessDesc as 'Policy.AnnualStatementLineofBusinessDesc'
	,pol.IsRetroPolicyInd as 'Policy.IsRetroPolicyInd'
	,agy.AgencySourceCode as 'Policy.Agency.AgencySourceCode'
	,agy.AgencyNum as 'Policy.Agency.AgencyNum'
	,agy.NewBusinessCommissionPct as 'Policy.Agency.NewBusinessCommissionPct'
	,agy.RenewalCommissionPct as 'Policy.Agency.RenewalCommissionPct'
	,agy.LicenseNum as 'Policy.Agency.LicenseNum'
	,agy.AppointmentEffectiveDate as 'Policy.Agency.AppointmentEffectiveDate'
	,agy.AppointmentExpirationDate as 'Policy.Agency.AppointmentExpirationDate'
	,agy.LicenseName as 'Policy.Agency.LicenseName'
	,agy.SurplusLicenseNum as 'Policy.Agency.SurplusLicenseNum'
	,agy.OrganizationName as 'Policy.Agency.OrganizationName'
	,agy.BranchNum as 'Policy.Agency.BranchNum'
	,agy.IsAppointedInd as 'Policy.Agency.IsAppointedInd'
	,agy.IsActiveInd as 'Policy.Agency.IsActiveInd'
	,(select pty_agy.PartyInfoSourceCode
		,pty_agy.SourceMasterNum
		,pty_agy.PartyTypeCode
		,pty_agy.PartyTypeDesc
		,pty_agy.PartyReferenceDesc
		,pty_agy.FirstName
		,pty_agy.MiddleName
		,pty_agy.LastName
		,pty_agy.FullName
		,pty_agy.GenderCode
		,pty_agy.MaritalStatusCode
		,pty_agy.BirthDate
		,pty_agy.SocialSecurityNum
		,pty_agy.OccupationDesc
		,pty_agy.DriverLicenseNum
		,pty_agy.DriverLicenseStateCode
		,pty_agy.DriverLicenseStateDesc
		,pty_agy.OrganizationName
		,pty_agy.LegalName
		,pty_agy.FEINNum
		,pty_agy.DBAName
		,pty_agy.ContactFirstName
		,pty_agy.ContactMiddleName
		,pty_agy.ContactLastName
		,pty_agy.ContactFullName
		,pty_agy.TaxIdNum
		,pty_agy.SICCode
		,pty_agy.SICDesc
		,pty_agy.NorthAmericanIndustryClassificationCode
		,pty_agy.NorthAmericanIndustryClassificationDesc
		,pty_agy.OwnershipTypeCode
		,pty_agy.OwnershipTypeDesc
		,(select rol_agy.PartyRoleSourceCode
			,rol_agy.PartyRoleCode
			,rol_agy.PartyRoleDesc
			,(select adr_agy.PartyAddressSourceCode
				,adr_agy.AddressTypeCode
				,adr_agy.AddressTypeDesc
				,adr_agy.AddressLine1
				,adr_agy.AddressLine2
				,adr_agy.AddressLine3
				,adr_agy.AddressLine4
				,adr_agy.CityName
				,adr_agy.CountyName
				,adr_agy.StateCode
				,adr_agy.StateDesc
				,adr_agy.CountryCode
				,adr_agy.CountryDesc
				,adr_agy.PostalCode
				,adr_agy.ContactName
				,adr_agy.IsPrimaryInd
				FROM ##PartyAddress adr_agy
				WHERE adr_agy.AgencySourceCode = rol_agy.AgencySourceCode and adr_agy.PartyRoleSourceCode = rol_agy.PartyRoleSourceCode and adr_agy.PolicySourceCode = pol.PolicySourceCode and adr_agy.ProcessDateTime = root.ProcessDateTime and adr_agy.SourceSystemCode = root.SourceSystemCode and adr_agy.master = 'Agency'
				FOR JSON PATH--,INCLUDE_NULL_VALUES
				) as 'PartyAddress'
			FROM ##PartyRole rol_agy
			WHERE rol_agy.AgencySourceCode = pty_agy.AgencySourceCode and rol_agy.PolicySourceCode = pol.PolicySourceCode and rol_agy.ProcessDateTime = root.ProcessDateTime and rol_agy.SourceSystemCode = root.SourceSystemCode and rol_agy.master = 'Agency'
			FOR JSON PATH--,INCLUDE_NULL_VALUES
			) as 'PartyRole'
		FROM ##PartyInfo pty_agy
		WHERE pty_agy.AgencySourceCode = agy.AgencySourceCode and pty_agy.PolicySourceCode = pol.PolicySourceCode and pty_agy.ProcessDateTime = root.ProcessDateTime and pty_agy.SourceSystemCode = root.SourceSystemCode and pty_agy.master = 'Agency'
		FOR JSON PATH--,INCLUDE_NULL_VALUES
		) as 'Policy.Agency.PartyInfo'
	,acc.AccountSourceCode as 'Policy.Account.AccountSourceCode'
	,acc.AccountNum as 'Policy.Account.AccountNum'
	,acc.EffectiveDate as 'Policy.Account.EffectiveDate'
	,acc.AccountName as 'Policy.Account.AccountName'
	,acc.PrimaryContactFullName as 'Policy.Account.PrimaryContactFullName'
	,acc.PrimaryPhoneNum as 'Policy.Account.PrimaryPhoneNum'
	,acc.IsAccountBillInd as 'Policy.Account.IsAccountBillInd'
	,acc.BankName as 'Policy.Account.BankName'
	,acc.BankRoutingNum as 'Policy.Account.BankRoutingNum'
	,(select pty_acc.PartyInfoSourceCode
		,pty_acc.SourceMasterNum
		,pty_acc.PartyTypeCode
		,pty_acc.PartyTypeDesc
		,pty_acc.PartyReferenceDesc
		,pty_acc.FirstName
		,pty_acc.MiddleName
		,pty_acc.LastName
		,pty_acc.FullName
		,pty_acc.GenderCode
		,pty_acc.MaritalStatusCode
		,pty_acc.BirthDate
		,pty_acc.SocialSecurityNum
		,pty_acc.OccupationDesc
		,pty_acc.DriverLicenseNum
		,pty_acc.DriverLicenseStateCode
		,pty_acc.DriverLicenseStateDesc
		,pty_acc.OrganizationName
		,pty_acc.LegalName
		,pty_acc.FEINNum
		,pty_acc.DBAName
		,pty_acc.ContactFirstName
		,pty_acc.ContactMiddleName
		,pty_acc.ContactLastName
		,pty_acc.ContactFullName
		,pty_acc.TaxIdNum
		,pty_acc.SICCode
		,pty_acc.SICDesc
		,pty_acc.NorthAmericanIndustryClassificationCode
		,pty_acc.NorthAmericanIndustryClassificationDesc
		,pty_acc.OwnershipTypeCode
		,pty_acc.OwnershipTypeDesc
		FROM ##PartyInfo pty_acc
		WHERE pty_acc.AccountSourceCode = acc.AccountSourceCode and pty_acc.PolicySourceCode = pol.PolicySourceCode and pty_acc.ProcessDateTime = root.ProcessDateTime and pty_acc.SourceSystemCode = root.SourceSystemCode and pty_acc.master = 'Account'
		FOR JSON PATH--,INCLUDE_NULL_VALUES
		) as 'Policy.Account.PartyInfo'
	,ins.InsuredSourceCode as 'Policy.Insured.InsuredSourceCode'
	,ins.AccountNum as 'Policy.Insured.AccountNum'
	,ins.ParentName as 'Policy.Insured.ParentName'
	,ins.ParentDUNSNum as 'Policy.Insured.ParentDUNSNum'
	,ins.DBAName as 'Policy.Insured.DBAName'
	,ins.USTickerSymbolName as 'Policy.Insured.USTickerSymbolName'
	,ins.DomicileCountryCode as 'Policy.Insured.DomicileCountryCode'
	,ins.DomicileCountryDesc as 'Policy.Insured.DomicileCountryDesc'
	,ins.DomicileStateCode as 'Policy.Insured.DomicileStateCode'
	,ins.DomicileStateDesc as 'Policy.Insured.DomicileStateDesc'
	,ins.TotalEmployeesNum as 'Policy.Insured.TotalEmployeesNum'
	,ins.MarketValueAmt as 'Policy.Insured.MarketValueAmt'
	,ins.SICCode as 'Policy.Insured.SICCode'
	,ins.NorthAmericanIndustryClassificationCode as 'Policy.Insured.NorthAmericanIndustryClassificationCode'
	,ins.NorthAmericanIndustryClassificationDesc as 'Policy.Insured.NorthAmericanIndustryClassificationDesc'
	,ins.PrimaryDBAIndustryName as 'Policy.Insured.PrimaryDBAIndustryName'
	,ins.StateOfIncorporationName as 'Policy.Insured.StateOfIncorporationName'
	,(select pty_ins.PartyInfoSourceCode
		,pty_ins.SourceMasterNum
		,pty_ins.PartyTypeCode
		,pty_ins.PartyTypeDesc
		,pty_ins.PartyReferenceDesc
		,pty_ins.FirstName
		,pty_ins.MiddleName
		,pty_ins.LastName
		,pty_ins.FullName
		,pty_ins.GenderCode
		,pty_ins.MaritalStatusCode
		,pty_ins.BirthDate
		,pty_ins.SocialSecurityNum
		,pty_ins.OccupationDesc
		,pty_ins.DriverLicenseNum
		,pty_ins.DriverLicenseStateCode
		,pty_ins.DriverLicenseStateDesc
		,pty_ins.OrganizationName
		,pty_ins.LegalName
		,pty_ins.FEINNum
		,pty_ins.DBAName
		,pty_ins.ContactFirstName
		,pty_ins.ContactMiddleName
		,pty_ins.ContactLastName
		,pty_ins.ContactFullName
		,pty_ins.TaxIdNum
		,pty_ins.SICCode
		,pty_ins.SICDesc
		,pty_ins.NorthAmericanIndustryClassificationCode
		,pty_ins.NorthAmericanIndustryClassificationDesc
		,pty_ins.OwnershipTypeCode
		,pty_ins.OwnershipTypeDesc
		,(select rol_ins.PartyRoleSourceCode
			,rol_ins.PartyRoleCode
			,rol_ins.PartyRoleDesc
			,(select adr_ins.PartyAddressSourceCode
				,adr_ins.AddressTypeCode
				,adr_ins.AddressTypeDesc
				,adr_ins.AddressLine1
				,adr_ins.AddressLine2
				,adr_ins.AddressLine3
				,adr_ins.AddressLine4
				,adr_ins.CityName
				,adr_ins.CountyName
				,adr_ins.StateCode
				,adr_ins.StateDesc
				,adr_ins.CountryCode
				,adr_ins.CountryDesc
				,adr_ins.PostalCode
				,adr_ins.ContactName
				,adr_ins.IsPrimaryInd
				FROM ##PartyAddress adr_ins
				WHERE adr_ins.InsuredSourceCode = rol_ins.InsuredSourceCode and adr_ins.PartyRoleSourceCode = rol_ins.PartyRoleSourceCode and adr_ins.PolicySourceCode = pol.PolicySourceCode and adr_ins.ProcessDateTime = root.ProcessDateTime and adr_ins.SourceSystemCode = root.SourceSystemCode and adr_ins.master = 'Insured'
				FOR JSON PATH--,INCLUDE_NULL_VALUES
				) as 'PartyAddress'
			FROM ##PartyRole rol_ins
			WHERE rol_ins.InsuredSourceCode = pty_ins.InsuredSourceCode  and rol_ins.ProcessDateTime = root.ProcessDateTime and rol_ins.SourceSystemCode = root.SourceSystemCode and rol_ins.master = 'Insured'
			FOR JSON PATH--,INCLUDE_NULL_VALUES
			) as 'PartyRole'
		FROM ##PartyInfo pty_ins
		WHERE pty_ins.InsuredSourceCode = ins.InsuredSourceCode  and pty_ins.ProcessDateTime = root.ProcessDateTime and pty_ins.SourceSystemCode = root.SourceSystemCode and pty_ins.master = 'Insured'
		FOR JSON PATH--,INCLUDE_NULL_VALUES
		) as 'Policy.Insured.PartyInfo'
	,wco.WritingCompanySourceCode as 'Policy.WritingCompany.WritingCompanySourceCode'
	,wco.WritingCompanyCode as 'Policy.WritingCompany.WritingCompanyCode'
	,wco.WritingCompanyName as 'Policy.WritingCompany.WritingCompanyName'
	,ISNULL(wco.NorthAmericanIndustryClassificationCode, wco.WritingCompanyCode) as 'Policy.WritingCompany.NorthAmericanIndustryClassificationCode'		-- temp added, for testing purposes
	,wco.FederalEmployerIdentificationNumberCode as 'Policy.WritingCompany.FederalEmployerIdentificationNumberCode'
	,wco.AMBestCode as 'Policy.WritingCompany.AMBestCode'
	,wco.IsActiveInd as 'Policy.WritingCompany.IsActiveInd'
	,wco.IsAdmittedInd as 'Policy.WritingCompany.IsAdmittedInd'
	,wco.IsBranchInd as 'Policy.WritingCompany.IsBranchInd'
	,wco.IsFrontingCompanyInd as 'Policy.WritingCompany.IsFrontingCompanyInd'
	,wco.BaseCurrencyCode as 'Policy.WritingCompany.BaseCurrencyCode'
	,wco.NCCICompanyCode as 'Policy.WritingCompany.NCCICompanyCode'
	,ptr.PolicyTransSourceCode as 'Policy.PolicyTrans.PolicyTransSourceCode'
	,ptr.PolicyNum as 'Policy.PolicyTrans.PolicyNum'
	,ptr.TermNum as 'Policy.PolicyTrans.TermNum'
	,ptr.PolicyTransNum as 'Policy.PolicyTrans.PolicyTransNum'
	,ptr.PolicyTransVersionNum as 'Policy.PolicyTrans.PolicyTransVersionNum'
	,ptr.PolicyTransTypeCode as 'Policy.PolicyTrans.PolicyTransTypeCode'
	,ptr.PolicyTransTypeDesc as 'Policy.PolicyTrans.PolicyTransTypeDesc'
	,ptr.TransStartDatetime as 'Policy.PolicyTrans.TransStartDatetime'
	,ptr.TransEndDatetime as 'Policy.PolicyTrans.TransEndDatetime'
	,ptr.PolicyTransStatusCode as 'Policy.PolicyTrans.PolicyTransStatusCode'
	,ptr.PolicyTransStatusDesc as 'Policy.PolicyTrans.PolicyTransStatusDesc'
	,ptr.UnderwritingStatusCode as 'Policy.PolicyTrans.UnderwritingStatusCode'
	,ptr.UnderwritingStatusDesc as 'Policy.PolicyTrans.UnderwritingStatusDesc'
	,ptr.RegistrationDate as 'Policy.PolicyTrans.RegistrationDate'
	,ptr.PolicyIssuanceDate as 'Policy.PolicyTrans.PolicyIssuanceDate'
	,ptr.PolicyCancellationDate as 'Policy.PolicyTrans.PolicyCancellationDate'
	,ptr.NextRenewalCheckDate as 'Policy.PolicyTrans.NextRenewalCheckDate'
	,ptr.RetroActiveDate as 'Policy.PolicyTrans.RetroActiveDate'
	,ptr.BusinessUnitCode as 'Policy.PolicyTrans.BusinessUnitCode'
	,ptr.BusinessUnitDesc as 'Policy.PolicyTrans.BusinessUnitDesc'
	,ptr.PolicyEffectiveDate as 'Policy.PolicyTrans.PolicyEffectiveDate'
	,ptr.LegacyPolicyNum as 'Policy.PolicyTrans.LegacyPolicyNum'
	,ptr.PolicyExpirationDate as 'Policy.PolicyTrans.PolicyExpirationDate'
	,ptr.IsTransportationPolicyInd as 'Policy.PolicyTrans.IsTransportationPolicyInd'
	,ptr.StandardIndustryCode as 'Policy.PolicyTrans.StandardIndustryCode'
	,ptr.StandardIndustryCodeDesc as 'Policy.PolicyTrans.StandardIndustryCodeDesc'
	,ptr.NorthAmericanIndustryClassificationCode as 'Policy.PolicyTrans.NorthAmericanIndustryClassificationCode'
	,ptr.NorthAmericanIndustryClassificationDesc as 'Policy.PolicyTrans.NorthAmericanIndustryClassificationDesc'
	,ptr.IsPremiumWaivedInd as 'Policy.PolicyTrans.IsPremiumWaivedInd'
	,ptr.BaseCurrencyCode as 'Policy.PolicyTrans.BaseCurrencyCode'
	,ptr.BaseCurrencyDesc as 'Policy.PolicyTrans.BaseCurrencyDesc'
	,ptr.OriginalCurrencyCode as 'Policy.PolicyTrans.OriginalCurrencyCode'
	,ptr.OriginalCurrencyDesc as 'Policy.PolicyTrans.OriginalCurrencyDesc'
	,ptr.ReportingCurrencyCode as 'Policy.PolicyTrans.ReportingCurrencyCode'
	,ptr.ReportingCurrencyDesc as 'Policy.PolicyTrans.ReportingCurrencyDesc'
	,ptr.UltimateLossRatioPct as 'Policy.PolicyTrans.UltimateLossRatioPct'
	,ptr.RevisedUltimateLossRatioPct as 'Policy.PolicyTrans.RevisedUltimateLossRatioPct'
	,ptr.PercentOfTechnicalPricePct as 'Policy.PolicyTrans.PercentOfTechnicalPricePct'
	,ptr.PremiumChangePct as 'Policy.PolicyTrans.PremiumChangePct'
	,ptr.DeductionsAttachmentsChangePct as 'Policy.PolicyTrans.DeductionsAttachmentsChangePct'
	,ptr.CoverageChangePct as 'Policy.PolicyTrans.CoverageChangePct'
	,ptr.ExposureChangePct as 'Policy.PolicyTrans.ExposureChangePct'
	,ptr.IsRenewalPriceIndexDataInd as 'Policy.PolicyTrans.IsRenewalPriceIndexDataInd'
	,ptr.RenewalPriceIndexPct as 'Policy.PolicyTrans.RenewalPriceIndexPct'
	,ptr.IsPolicyEffectiveDateProposedInd as 'Policy.PolicyTrans.IsPolicyEffectiveDateProposedInd'
	,ptr.IsPolicyExpirationDateProposedInd as 'Policy.PolicyTrans.IsPolicyExpirationDateProposedInd'
	,ptr.IsProjectPolicyInd as 'Policy.PolicyTrans.IsProjectPolicyInd'
	,ptr.IsFacReinsurancePurchasedInd as 'Policy.PolicyTrans.IsFacReinsurancePurchasedInd'
	,ptr.ProjectName as 'Policy.PolicyTrans.ProjectName'
	,ptr.ProjectTypeCode as 'Policy.PolicyTrans.ProjectTypeCode'
	,ptr.ProjectTypeDesc as 'Policy.PolicyTrans.ProjectTypeDesc'
	,ptr.ISOClassCode as 'Policy.PolicyTrans.ISOClassCode'
	,ptr.IsNYFreeTradeZoneInd as 'Policy.PolicyTrans.IsNYFreeTradeZoneInd'
	,ptr.NYFreeTradeZoneClassCode as 'Policy.PolicyTrans.NYFreeTradeZoneClassCode'
	,ptr.IsPolicyTrackAsNonRecurringPremiumInd as 'Policy.PolicyTrans.IsPolicyTrackAsNonRecurringPremiumInd'
	,ptr.IsMiddleMarketPolicyInd as 'Policy.PolicyTrans.IsMiddleMarketPolicyInd'
	,ptr.BusinessTypeCode as 'Policy.PolicyTrans.BusinessTypeCode'
	,ptr.BusinessTypeDesc as 'Policy.PolicyTrans.BusinessTypeDesc'
	,ptr.IsMGAInd as 'Policy.PolicyTrans.IsMGAInd'
	,ptr.FrontingCompanyName as 'Policy.PolicyTrans.FrontingCompanyName'
	,ptr.IsRunoffERPInd as 'Policy.PolicyTrans.IsRunoffERPInd'
	,ptr.RunoffERPDate as 'Policy.PolicyTrans.RunoffERPDate'
	,ptr.IsFirmOrderNotedInd as 'Policy.PolicyTrans.IsFirmOrderNotedInd'
	,ptr.WrittenLinePct as 'Policy.PolicyTrans.WrittenLinePct'
	,ptr.SignedLinePct as 'Policy.PolicyTrans.SignedLinePct'
	,ptr.PremiumAllocationPct as 'Policy.PolicyTrans.PremiumAllocationPct'
	,ptr.CoverageTriggerCode as 'Policy.PolicyTrans.CoverageTriggerCode'
	,ptr.CoverageTriggerDesc as 'Policy.PolicyTrans.CoverageTriggerDesc'
	,ptr.ProfessionCode as 'Policy.PolicyTrans.ProfessionCode'
	,ptr.ProfessionDesc as 'Policy.PolicyTrans.ProfessionDesc'
	,ptr.DomicileCountryCode as 'Policy.PolicyTrans.DomicileCountryCode'
	,ptr.DomicileCountryDesc as 'Policy.PolicyTrans.DomicileCountryDesc'
	,ptr.DomicileStateCode as 'Policy.PolicyTrans.DomicileStateCode'
	,ptr.DomicileStateDesc as 'Policy.PolicyTrans.DomicileStateDesc'
	,ptr.MinimumEarnedPremiumPct as 'Policy.PolicyTrans.MinimumEarnedPremiumPct'
	,ptr.TreatyOrReferralAppliesDesc as 'Policy.PolicyTrans.TreatyOrReferralAppliesDesc'
	,ptr.DaysNoticeOfCancellationNum as 'Policy.PolicyTrans.DaysNoticeOfCancellationNum'
	,ptr.IsFacultativeEquipmentBreakdownInd as 'Policy.PolicyTrans.IsFacultativeEquipmentBreakdownInd'
	,ptr.IsEquipmentBreakdownPremiumIncludedInd as 'Policy.PolicyTrans.IsEquipmentBreakdownPremiumIncludedInd'
	,ptr.IsComboPolicyInd as 'Policy.PolicyTrans.IsComboPolicyInd'
	,ptr.IsAdmittedDeregInd as 'Policy.PolicyTrans.IsAdmittedDeregInd'
	,ptr.QuotaShareAppliesInd as 'Policy.PolicyTrans.QuotaShareAppliesInd'
	,ptr.IsSharedLimitInd as 'Policy.PolicyTrans.IsSharedLimitInd'
	,ptr.PendingAndPriorLitigationDate as 'Policy.PolicyTrans.PendingAndPriorLitigationDate'
	,ptr.IsPremiumAuditableInd as 'Policy.PolicyTrans.IsPremiumAuditableInd'
	,ptr.IsTRIAOfferedInd as 'Policy.PolicyTrans.IsTRIAOfferedInd'
	,ptr.IsFortune500CompanyInd as 'Policy.PolicyTrans.IsFortune500CompanyInd'
	,ptr.ClassOfBusinessCode as 'Policy.PolicyTrans.ClassOfBusinessCode'
	,ptr.IsBureauInd as 'Policy.PolicyTrans.IsBureauInd'
	,ptr.IsDeclarationPremBearingInd as 'Policy.PolicyTrans.IsDeclarationPremBearingInd'
	,ptr.IsRiskBordereauProvidedInd as 'Policy.PolicyTrans.IsRiskBordereauProvidedInd'
	,ptr.IsClaimBordereauProvidedInd as 'Policy.PolicyTrans.IsClaimBordereauProvidedInd'
	,ptr.IsPaidPremiumBordereauProvidedInd as 'Policy.PolicyTrans.IsPaidPremiumBordereauProvidedInd'
	,ptr.IsFrontedInd as 'Policy.PolicyTrans.IsFrontedInd'
	,ptr.IsCombinedPackageInd as 'Policy.PolicyTrans.IsCombinedPackageInd'
	,ptr.IsTradeAssocInd as 'Policy.PolicyTrans.IsTradeAssocInd'
	,ptr.IndustryClassCode as 'Policy.PolicyTrans.IndustryClassCode'
	,ptr.IsMultilineDiscountInd as 'Policy.PolicyTrans.IsMultilineDiscountInd'
	,ptr.IsDriverMonitoringInfoInd as 'Policy.PolicyTrans.IsDriverMonitoringInfoInd'
	,ptr.IsManualAuditInd as 'Policy.PolicyTrans.IsManualAuditInd'
	,ptr.MarketSegmentCode as 'Policy.PolicyTrans.MarketSegmentCode'
	,ptr.IsTPAUsedInd as 'Policy.PolicyTrans.IsTPAUsedInd'
	,ptr.NumEmployee as 'Policy.PolicyTrans.NumEmployee'
	,ptr.IsBrokerageInd as 'Policy.PolicyTrans.IsBrokerageInd'
	,ptr.IsUnionInd as 'Policy.PolicyTrans.IsUnionInd'
	,ptr.IsQuoteEZPayInd as 'Policy.PolicyTrans.IsQuoteEZPayInd'
	,(select lob.LineOfBusinessSourceCode
		,lob.LineOfBusinessCode
		,lob.LineOfBusinessDesc
		,lob.SplitNum
		,lob.SplitEffectiveDate
		,lob.SplitExpirationDate
		,lob.RateEffectiveDate
		,lob.IsSplitRateInd
		,lob.IsBillingWaivePremiumInd
		,lob.IsBillingWaivePremiumOverrideInd
		,lob.IsFacReinsuranceInd
		,lob.UnderlyingInfoDesc
		,lob.MaxCommissionPct
		,lob.ProfitCenterCode
		,lob.ProfitCenterDesc
		,(select geo.GeographySourceCode
			,geo.CountryCode
			,geo.CountryDesc
			,geo.TerritoryName
			,geo.StateCode
			,geo.StateDesc
			,geo.RegionName
			,geo.CountyName
			,geo.GovernClassByStateCode
			,geo.GovernClassByStateDesc
			,(select ino.InsurableObjectSourceCode
				,ino.InsurableObjectTypeCode
				,ino.InsurableObjectTypeDesc
				,ino.InsuredSourceCode
				,ino.RiskLocationCode
				,ino.RiskLocationDesc
				,ino.EarthquakeZoneCode
				,ino.EarthquakeZoneDesc
				,ino.FireDistrictCode
				,ino.FireDistrictDesc
				,ino.FireStationName
				,ino.FireStationLocationName
				,ino.LatitudeCode
				,ino.LongitudeCode
				,ino.FireStationCountyTownName
				,ino.FireStationTownshipName
				,ino.NumEmployeesPartTime
				,ino.NumEmployeesFullTime
				,ino.BusinessHoursStartTime
				,ino.BusinessHoursCloseTime
				,(select cov_ino.CoverageSourceCode
					,cov_ino.AnnualStatementLineofBusinessCode
					,cov_ino.AnnualStatementLineofBusinessDesc
					,cov_ino.CoverageCode
					,cov_ino.CoverageDesc
					,cov_ino.CoverageClassCode
					,cov_ino.CoverageClassDesc
					,cov_ino.CoverageGroupCode
					,cov_ino.CoverageGroupDesc
					,cov_ino.CoverageTriggerCode
					,cov_ino.CoverageTriggerDesc
					,cov_ino.ClassCode
					,cov_ino.ClassCodeDesc
					,cov_ino.EffectiveDate
					,cov_ino.ExpirationDate
					,cov_ino.CancellationDate
					,cov_ino.IsMajorCoverageInd
					,cov_ino.IsIncludedInPremiumInd
					,cov_ino.IsMineSubsidenceInd
					,trc_cov_ino.CurrentTermBaseAmt as 'TransactionCost.CurrentTermBaseAmt'
					,trc_cov_ino.CurrentTermOriginalAmt as 'TransactionCost.CurrentTermOriginalAmt'
					,trc_cov_ino.CurrentTermReportingAmt as 'TransactionCost.CurrentTermReportingAmt'
					,trc_cov_ino.WrittenPremiumBaseAmt as 'TransactionCost.WrittenPremiumBaseAmt'
					,trc_cov_ino.WrittenPremiumOriginalAmt as 'TransactionCost.WrittenPremiumOriginalAmt'
					,trc_cov_ino.WrittenPremiumReportingAmt as 'TransactionCost.WrittenPremiumReportingAmt'
					,trc_cov_ino.WrittenPremiumBaseAmt as 'TransactionCost.AddlRetPremBaseAmt'
					,trc_cov_ino.WrittenPremiumOriginalAmt as 'TransactionCost.AddlRetPremOriginalAmt'
					,trc_cov_ino.WrittenPremiumReportingAmt as 'TransactionCost.AddlRetPremReportingAmt'
				FROM ##Coverage cov_ino
				LEFT JOIN ##TransactionCost_Coverage trc_cov_ino ON trc_cov_ino.CoverageSourceCode = cov_ino.CoverageSourceCode and trc_cov_ino.PolicySourceCode = pol.PolicySourceCode and trc_cov_ino.ProcessDateTime = root.ProcessDateTime and trc_cov_ino.SourceSystemCode = root.SourceSystemCode and trc_cov_ino.master = 'InsurableObjectCoverage'
				WHERE cov_ino.InsurableObjectSourceCode = ino.InsurableObjectSourceCode and cov_ino.PolicySourceCode = pol.PolicySourceCode and cov_ino.ProcessDateTime = root.ProcessDateTime and cov_ino.SourceSystemCode = root.SourceSystemCode and cov_ino.master = 'InsurableObjectCoverage'
				FOR JSON PATH--,INCLUDE_NULL_VALUES
				) as 'Coverage'
				,(select dis_ino.PolicyDiscountSourceCode
					,dis_ino.DiscountLevelCode
					,dis_ino.DiscountLevelDesc
					,dis_ino.DiscountTypeCode
					,dis_ino.DiscountTypeDesc
					,dis_ino.PolicyDiscountBaseAmt
					,dis_ino.PolicyDiscountOriginalAmt
					,dis_ino.PolicyDiscountReportingAmt
				FROM ##PolicyDiscount dis_ino
				WHERE dis_ino.InsurableObjectSourceCode = ino.InsurableObjectSourceCode and dis_ino.PolicySourceCode = pol.PolicySourceCode and dis_ino.ProcessDateTime = root.ProcessDateTime and dis_ino.SourceSystemCode = root.SourceSystemCode and dis_ino.master = 'InsurableObject'
				FOR JSON PATH--,INCLUDE_NULL_VALUES
				) as 'PolicyDiscount'
			FROM ##InsurableObject ino
			WHERE ino.GeographySourceCode = geo.GeographySourceCode and ino.PolicySourceCode = pol.PolicySourceCode and ino.ProcessDateTime = root.ProcessDateTime and ino.SourceSystemCode = root.SourceSystemCode
			FOR JSON PATH--,INCLUDE_NULL_VALUES
			) as 'InsurableObject'
		FROM ##Geography geo
		WHERE geo.LineOfBusinessSourceCode = lob.LineOfBusinessSourceCode and geo.PolicySourceCode = pol.PolicySourceCode and geo.ProcessDateTime = root.ProcessDateTime and geo.SourceSystemCode = root.SourceSystemCode
		FOR JSON PATH--,INCLUDE_NULL_VALUES
		) as 'Geography'
		,(select cov_lob.CoverageSourceCode
			,cov_lob.AnnualStatementLineofBusinessCode
			,cov_lob.AnnualStatementLineofBusinessDesc
			,cov_lob.CoverageCode
			,cov_lob.CoverageDesc
			,cov_lob.CoverageClassCode
			,cov_lob.CoverageClassDesc
			,cov_lob.CoverageGroupCode
			,cov_lob.CoverageGroupDesc
			,cov_lob.CoverageTriggerCode
			,cov_lob.CoverageTriggerDesc
			,cov_lob.ClassCode
			,cov_lob.ClassCodeDesc
			,cov_lob.EffectiveDate
			,cov_lob.ExpirationDate
			,cov_lob.CancellationDate
			,cov_lob.IsMajorCoverageInd
			,cov_lob.IsIncludedInPremiumInd
			,cov_lob.IsMineSubsidenceInd
			,trc_cov_lob.CurrentTermBaseAmt as 'TransactionCost.CurrentTermBaseAmt'
			,trc_cov_lob.CurrentTermOriginalAmt as 'TransactionCost.CurrentTermOriginalAmt'
			,trc_cov_lob.CurrentTermReportingAmt as 'TransactionCost.CurrentTermReportingAmt'
			,trc_cov_lob.WrittenPremiumBaseAmt as 'TransactionCost.WrittenPremiumBaseAmt'
			,trc_cov_lob.WrittenPremiumOriginalAmt as 'TransactionCost.WrittenPremiumOriginalAmt'
			,trc_cov_lob.WrittenPremiumReportingAmt as 'TransactionCost.WrittenPremiumReportingAmt'
			,trc_cov_lob.WrittenPremiumBaseAmt as 'TransactionCost.AddlRetPremBaseAmt'
			,trc_cov_lob.WrittenPremiumOriginalAmt as 'TransactionCost.AddlRetPremOriginalAmt'
			,trc_cov_lob.WrittenPremiumReportingAmt as 'TransactionCost.AddlRetPremReportingAmt'
		FROM ##Coverage cov_lob
		LEFT JOIN ##TransactionCost_Coverage trc_cov_lob ON trc_cov_lob.CoverageSourceCode = cov_lob.CoverageSourceCode and trc_cov_lob.PolicySourceCode = pol.PolicySourceCode and trc_cov_lob.ProcessDateTime = root.ProcessDateTime and trc_cov_lob.SourceSystemCode = root.SourceSystemCode and trc_cov_lob.master = 'LineOfBusinessCoverage'
		WHERE cov_lob.LineOfBusinessSourceCode = lob.LineOfBusinessSourceCode and cov_lob.PolicySourceCode = pol.PolicySourceCode and cov_lob.ProcessDateTime = root.ProcessDateTime and cov_lob.SourceSystemCode = root.SourceSystemCode and cov_lob.master = 'LineOfBusinessCoverage'
		FOR JSON PATH--,INCLUDE_NULL_VALUES
		) as 'Coverage'
		,(select dis.PolicyDiscountSourceCode
			,dis.DiscountLevelCode
			,dis.DiscountLevelDesc
			,dis.DiscountTypeCode
			,dis.DiscountTypeDesc
			,dis.PolicyDiscountBaseAmt
			,dis.PolicyDiscountOriginalAmt
			,dis.PolicyDiscountReportingAmt
		FROM ##PolicyDiscount dis
		WHERE dis.LineOfBusinessSourceCode = lob.LineOfBusinessSourceCode and dis.PolicySourceCode = pol.PolicySourceCode and dis.ProcessDateTime = root.ProcessDateTime and dis.SourceSystemCode = root.SourceSystemCode and dis.master = 'LineOfBusiness'
		FOR JSON PATH--,INCLUDE_NULL_VALUES
		) as 'PolicyDiscount'
	FROM ##LineOfBusiness lob
	WHERE lob.PolicyTransSourceCode = ptr.PolicyTransSourceCode and lob.PolicySourceCode = pol.PolicySourceCode and lob.ProcessDateTime = root.ProcessDateTime and lob.SourceSystemCode = root.SourceSystemCode
	FOR JSON PATH--,INCLUDE_NULL_VALUES
	) as 'Policy.PolicyTrans.LineOfBusiness'
	FOR JSON PATH, WITHOUT_ARRAY_WRAPPER--,INCLUDE_NULL_VALUES
	) jsonline, pol.PolicyNum
FROM ##Root root 
join ##Policy pol on pol.PolicySourceCode = root.PolicySourceCode and pol.ProcessDateTime = root.ProcessDateTime and pol.SourceSystemCode = root.SourceSystemCode
join ##PolicyTrans ptr on ptr.PolicySourceCode = pol.PolicySourceCode and ptr.ProcessDateTime = root.ProcessDateTime and ptr.SourceSystemCode = root.SourceSystemCode
left join ##Account acc on acc.PolicySourceCode = pol.PolicySourceCode and acc.ProcessDateTime = root.ProcessDateTime and acc.SourceSystemCode = root.SourceSystemCode
left join ##Insured ins on ins.PolicySourceCode = pol.PolicySourceCode and ins.ProcessDateTime = root.ProcessDateTime and ins.SourceSystemCode = root.SourceSystemCode
left join ##WritingCompany wco on ins.PolicySourceCode = pol.PolicySourceCode and wco.ProcessDateTime = root.ProcessDateTime and wco.SourceSystemCode = root.SourceSystemCode and wco.master = 'Policy'
left join ##Agency agy on agy.PolicySourceCode = pol.PolicySourceCode and agy.ProcessDateTime = root.ProcessDateTime and agy.SourceSystemCode = root.SourceSystemCode
) a


--declare @amfam_json varchar(max)
--select top 1 @amfam_json = jsonline from [gentd].[output_data_amfam]
--select @amfam_json
--print @amfam_json



	
	/*
	select * from (
select (
select root.SourceSystemCode
	,root.ProcessDateTime
	,pol.PolicySourceCode as 'Policy.PolicySourceCode'
	,pol.EffectiveJobNum as 'Policy.EffectiveJobNum'
	,(SELECT pol.PolicyNum
	FROM ##Policy pol 
	WHERE pol.ProcessDateTime = root.ProcessDateTime and pol.SourceSystemCode = root.SourceSystemCode
	FOR JSON PATH--, WITHOUT_ARRAY_WRAPPER--,INCLUDE_NULL_VALUES
	) as Policy2
	FOR JSON PATH, WITHOUT_ARRAY_WRAPPER--,INCLUDE_NULL_VALUES
	) jsonline
FROM ##Root root join ##Policy pol on pol.PolicySourceCode = root.PolicySourceCode and pol.ProcessDateTime = root.ProcessDateTime and pol.SourceSystemCode = root.SourceSystemCode
) a
	*/

			/*	,(
			SELECT trans.*
				,(
					SELECT polcov.*
					FROM ods_policy.b_PolicyCoverage polcov
					WHERE polcov.PolicyTransSK = trans.PolicyTransSK
					FOR JSON PATH
						,INCLUDE_NULL_VALUES
					) AS PolicyCoverage
				,(
					SELECT pollob.*
					FROM ods_policy.b_PolicyLineofBusiness pollob
					WHERE pollob.PolicyTransSK = trans.PolicyTransSK
					FOR JSON PATH
						,INCLUDE_NULL_VALUES
					) AS PolicyLineofBusiness
			FROM ods_policy.b_PolicyTrans trans
			WHERE trans.PolicySK = pol.PolicySK
			FOR JSON PATH
				,INCLUDE_NULL_VALUES
			) AS PolicyTrans*/
GO
