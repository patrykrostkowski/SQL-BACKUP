USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [gentd].[gen_claim_json_data_file]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [gentd].[gen_claim_json_data_file] as 

truncate table [gentd].[output_claim_data_icw]
insert into [gentd].[output_claim_data_icw](JsonLine, FileName)
select jsonline, ClaimNum as FileName from (
--select cast(jsonline as xml) as jsonline, ClaimNum as FileName from (
select (
select root.SourceSystemCode
	,root.SourceSystemDesc
	,root.ProcessDateTime
    ,clm.ClaimSourceCode AS 'Claim.ClaimSourceCode'
    ,clm.ClaimNum AS 'Claim.ClaimNum'
    ,clm.IsBondClaimInd AS 'Claim.IsBondClaimInd'
    ,clm.LegacyClaimNum AS 'Claim.LegacyClaimNum'
    ,clm.BureauClaimNum AS 'Claim.BureauClaimNum'
    ,clm.CedentClaimNum AS 'Claim.CedentClaimNum'
    ,clm.ClaimStatusDesc AS 'Claim.ClaimStatusDesc'
    ,clm.ClaimStatusCode AS 'Claim.ClaimStatusCode'
    ,clm.ClaimTierDesc AS 'Claim.ClaimTierDesc'
    ,clm.ClaimTierCode AS 'Claim.ClaimTierCode'
    ,clm.ClaimCurrencyCode AS 'Claim.ClaimCurrencyCode'
    ,clm.ClaimCurrencyDesc AS 'Claim.ClaimCurrencyDesc'
    ,clm.LitigationStatusDesc AS 'Claim.LitigationStatusDesc'
    ,clm.LitigationStatusCode AS 'Claim.LitigationStatusCode'
    ,clm.CoverageTriggerDesc AS 'Claim.CoverageTriggerDesc'
    ,clm.CoverageTriggerCode AS 'Claim.CoverageTriggerCode'
    ,clm.ClosedOutcomeDesc AS 'Claim.ClosedOutcomeDesc'
    ,clm.ClosedOutcomeCode AS 'Claim.ClosedOutcomeCode'
    ,clm.InjurySeverityDesc AS 'Claim.InjurySeverityDesc'
    ,clm.InjurySeverityCode AS 'Claim.InjurySeverityCode'
    ,clm.ProductDesc AS 'Claim.ProductDesc'
    ,clm.ProductCode AS 'Claim.ProductCode'
    ,clm.MajorCauseofLossDesc AS 'Claim.MajorCauseofLossDesc'
    ,clm.MajorCauseofLossCode AS 'Claim.MajorCauseofLossCode'
    ,clm.LossAnalysisDesc AS 'Claim.LossAnalysisDesc'
    ,clm.LossAnalysisCode AS 'Claim.LossAnalysisCode'
    ,clm.FaultRatingDesc AS 'Claim.FaultRatingDesc'
    ,clm.FaultRatingCode AS 'Claim.FaultRatingCode'
    ,clm.ClaimProgressDesc AS 'Claim.ClaimProgressDesc'
    ,clm.ClaimProgressCode AS 'Claim.ClaimProgressCode'
    ,clm.ClaimantOutcomeDesc AS 'Claim.ClaimantOutcomeDesc'
    ,clm.ClaimantOutcomeCode AS 'Claim.ClaimantOutcomeCode'
    ,clm.FlaggedTypeDesc AS 'Claim.FlaggedTypeDesc'
    ,clm.FlaggedTypeCode AS 'Claim.FlaggedTypeCode'
    ,clm.OpenReasonDesc AS 'Claim.OpenReasonDesc'
    ,clm.OpenReasonCode AS 'Claim.OpenReasonCode'
    ,clm.SubrogationStatusDesc AS 'Claim.SubrogationStatusDesc'
    ,clm.SubrogationStatusCode AS 'Claim.SubrogationStatusCode'
    ,clm.SalvageStatusDesc AS 'Claim.SalvageStatusDesc'
    ,clm.SalvageStatusCode AS 'Claim.SalvageStatusCode'
    ,clm.AreaofPracticeDesc AS 'Claim.AreaofPracticeDesc'
    ,clm.AreaofPracticeCode AS 'Claim.AreaofPracticeCode'
    ,clm.StandardIndustryCodeDesc AS 'Claim.StandardIndustryCodeDesc'
    ,clm.StandardIndustryCode AS 'Claim.StandardIndustryCode'
    ,clm.NorthAmericanIndustryClassificationDesc AS 'Claim.NorthAmericanIndustryClassificationDesc'
    ,clm.NorthAmericanIndustryClassificationCode AS 'Claim.NorthAmericanIndustryClassificationCode'
    ,clm.DateofLossQualifierDesc AS 'Claim.DateofLossQualifierDesc'
    ,clm.DateofLossQualifierCode AS 'Claim.DateofLossQualifierCode'
    ,clm.ReopenReasonDesc AS 'Claim.ReopenReasonDesc'
    ,clm.ReopenReasonCode AS 'Claim.ReopenReasonCode'
    ,clm.OtherRecoverableStatusDesc AS 'Claim.OtherRecoverableStatusDesc'
    ,clm.OtherRecoverableStatusCode AS 'Claim.OtherRecoverableStatusCode'
    ,clm.CauseofLossDesc AS 'Claim.CauseofLossDesc'
    ,clm.CauseofLossCode AS 'Claim.CauseofLossCode'
    ,clm.ClaimDesc AS 'Claim.ClaimDesc'
    ,clm.ProgramNum AS 'Claim.ProgramNum'
    ,clm.SpecialInvestigationScoreNum AS 'Claim.SpecialInvestigationScoreNum'
    ,clm.FlaggedReasonDesc AS 'Claim.FlaggedReasonDesc'
    ,clm.AccountMarketYear AS 'Claim.AccountMarketYear'
    ,clm.BrokerAdvisedDate AS 'Claim.BrokerAdvisedDate'
    ,clm.AttachmentDate AS 'Claim.AttachmentDate'
    ,clm.EventDate AS 'Claim.EventDate'
    ,clm.OpenedDate AS 'Claim.OpenedDate'
    ,clm.ClosedDate AS 'Claim.ClosedDate'
    ,clm.RecentActivityDate AS 'Claim.RecentActivityDate'
    ,clm.LossDate AS 'Claim.LossDate'
    ,clm.ClaimantReportedDate AS 'Claim.ClaimantReportedDate'
    ,clm.ClaimsMadeDate AS 'Claim.ClaimsMadeDate'
    ,clm.ClaimEntryDate AS 'Claim.ClaimEntryDate'
    ,clm.OriginalEntryDate AS 'Claim.OriginalEntryDate'
    ,clm.ContractLossDate AS 'Claim.ContractLossDate'
    ,clm.ReportedtoAgentDate AS 'Claim.ReportedtoAgentDate'
    ,clm.ReportedtoInsuredDate AS 'Claim.ReportedtoInsuredDate'
    ,clm.FlaggedDate AS 'Claim.FlaggedDate'
    ,clm.DeathDate AS 'Claim.DeathDate'
    ,clm.ReOpenDate AS 'Claim.ReOpenDate'
    ,clm.IsShowMedicalFirstInd AS 'Claim.IsShowMedicalFirstInd'
    ,clm.IsCoverageDeniedInd AS 'Claim.IsCoverageDeniedInd'
    ,clm.IsBlockClaimInd AS 'Claim.IsBlockClaimInd'
    ,clm.IsAnnualAggregateDeductibleInd AS 'Claim.IsAnnualAggregateDeductibleInd'
    ,clm.IsAvoidanceInd AS 'Claim.IsAvoidanceInd'
    ,clm.IsBureauClaimInd AS 'Claim.IsBureauClaimInd'
    ,clm.IsConflictInd AS 'Claim.IsConflictInd'
    ,clm.IsAutoClaimReviewInd AS 'Claim.IsAutoClaimReviewInd'
    ,clm.IsECOInd AS 'Claim.IsECOInd'
    ,clm.IsExcessInd AS 'Claim.IsExcessInd'
    ,clm.IsExGratiaInd AS 'Claim.IsExGratiaInd'
    ,clm.IsinjuredRegularJobInd AS 'Claim.IsinjuredRegularJobInd'
    ,clm.IsInsuredPremisesInd AS 'Claim.IsInsuredPremisesInd'
    ,clm.IsInsuranceInd AS 'Claim.IsInsuranceInd'
    ,clm.IsISOEnabledInd AS 'Claim.IsISOEnabledInd'
    ,clm.IsIncidentReportInd AS 'Claim.IsIncidentReportInd'
    ,clm.IsCoverageInQuestionInd AS 'Claim.IsCoverageInQuestionInd'
    ,clm.IsPeriodicPaymentOrderInd AS 'Claim.IsPeriodicPaymentOrderInd'
    ,clm.IsQuotaShareMemoInd AS 'Claim.IsQuotaShareMemoInd'
    ,clm.IsReinstatementFlaggedInd AS 'Claim.IsReinstatementFlaggedInd'
    ,clm.IsReinsuranceReportableInd AS 'Claim.IsReinsuranceReportableInd'
    ,clm.IsReOpenedInd AS 'Claim.IsReOpenedInd'
    ,clm.IsShadowPolicyInd AS 'Claim.IsShadowPolicyInd'
    ,clm.IsLitigationClaimInd AS 'Claim.IsLitigationClaimInd'
    ,clm.IsFatalityClaimInd AS 'Claim.IsFatalityClaimInd'
    ,clm.IsSIUClaimInd AS 'Claim.IsSIUClaimInd'
    ,clm.IsFlagClaimInd AS 'Claim.IsFlagClaimInd'
    ,clm.IsLargeClaimInd AS 'Claim.IsLargeClaimInd'
    ,clm.IsWatchListInd AS 'Claim.IsWatchListInd'
    ,clm.IsDisputeClaimInd AS 'Claim.IsDisputeClaimInd'
    ,clm.IsClaimAttachedToTransactionInd AS 'Claim.IsClaimAttachedToTransactionInd'
    ,clm.CatLossEstimateAmt AS 'Claim.CatLossEstimateAmt'
    ,clm.CatLossEstimateCurrencyDesc AS 'Claim.CatLossEstimateCurrencyDesc'
    ,clm.CatLossEstimateCurrencyCode AS 'Claim.CatLossEstimateCurrencyCode'
    ,clm.AllegedCauseOfLossDesc AS 'Claim.AllegedCauseOfLossDesc'
    ,clm.AllegedCauseOfLossCode AS 'Claim.AllegedCauseOfLossCode'
    ,clm.IsClassActionInd AS 'Claim.IsClassActionInd'
    ,clm.IsLeadInd AS 'Claim.IsLeadInd'
    ,clm.IsFormFollowInd AS 'Claim.IsFormFollowInd'
    ,clm.IsQuotaShareInd AS 'Claim.IsQuotaShareInd'
    ,clm.IsReinsuranceContractInd AS 'Claim.IsReinsuranceContractInd'
    ,clm.IsAllegationBadFaithInd AS 'Claim.IsAllegationBadFaithInd'
    ,clm.IsBadFaithInd AS 'Claim.IsBadFaithInd'
    ,clm.ExcessParticipationPct AS 'Claim.ExcessParticipationPct'
    ,clm.QuotaShareParticipationPct AS 'Claim.QuotaShareParticipationPct'
    ,clm.ReinsuranceParticipationPct AS 'Claim.ReinsuranceParticipationPct'
	,clm.ClaimCategoryTypeCode AS 'Claim.ClaimCategoryTypeCode'
	,clm.ClaimCategoryTypeDesc AS 'Claim.ClaimCategoryTypeDesc'
	,(select csh.ClaimStatusHistorySourceCode
		,csh.SequenceNum
		,csh.ClaimStatusCode
		,csh.ClaimStatusDesc
		,csh.OpenDate
		,csh.CloseDate
		,csh.CloseReasonDesc
		,csh.ReOpenDate
		,csh.ReOpenReasonDesc
	FROM ##C_ClaimStatusHistory csh
	WHERE csh.ClaimSourceCode = clm.ClaimSourceCode and csh.ProcessDateTime = root.ProcessDateTime and csh.SourceSystemCode = root.SourceSystemCode
	FOR JSON PATH--,INCLUDE_NULL_VALUES
	) as 'Claim.ClaimStatusHistory'
	,(select cmt.ClaimantSourceCode
		,cmt.ClaimantNum
		,cmt.FirstAbsentDate
		,cmt.FirstLostDate
		,cmt.LastWorkedDate
		,cmt.NoticeDate
		,cmt.ReceivedDate
		,cmt.ReportedDate
		,cmt.LostDaysNum
		,cmt.DiagnosisCode
		,cmt.InjuryCode
		,cmt.ItemTypeCode
		,cmt.ManagedCareOrganizationCode
		,cmt.NCCIClassCode
		,cmt.NCCIInjuryCode
		,cmt.NCCITypeCode
		,cmt.OccupationCode
		,cmt.OSHAInjuryCode
		,cmt.OSHASeverityCode
		,cmt.PartOfBodyCode
		,cmt.RehabilitationCode
		,cmt.VehicleDamageCode
		,cmt.VehicleTypeCode
		,cmt.ViolationCode
		,cmt.AccidentDesc
		,cmt.AverageWeeklyWageAmt
		,cmt.BenefitAmt
		,cmt.CompensationAmt
		,cmt.COLAAmt
		,cmt.DependentAmt
		,cmt.VehicleDamageAmt
		,cmt.IsClaimantTicketedInd
		,cmt.IsClaimantTowedInd
		,cmt.IsInjuredOnPremisesInd
		,cmt.IsMedcaseManagedInd
		,cmt.IsMedicalOnlyInd
		,cmt.IsPaidInFullForDateOfInjuryInd
		,cmt.IsPreExistingConditionInd
		,cmt.IsPreventableAccidentInd
		,cmt.IsRepresentedByAttorneyInd
		,cmt.IsDriverInsuredVehicleInd
		,cmt.IsReturnedToWorkInd
		,cmt.IsSurgeryRequiredInd
		,cmt.IsMedicareBeneficiaryInd
		,cmt.IsSafetyEquipProvidedInd
		,cmt.IsSafetyEquipUsedInd
		,cmt.IsPreExistingDisabilityInd
		,cmt.IsSuitFiledInd
		,cmt.IsVehicleTotalLossInd
		,cmt.IsLumpSumInd
		,cmt.VehicleIdentificationNum
		,cmt.VehicleYear
		,cmt.VehicleMake
		,cmt.VehicleModel
		,cmt.VehicleStateDesc
		,cmt.VehicleStateCode
		,cmt.VehicleTagNum
		,cmt.DiagnosisDesc
		,cmt.InjuryDesc
		,cmt.OccupationDesc
		,cmt.OSHAInjuryDesc
		,cmt.OSHASeverityDesc
		,cmt.PartOfBodyDesc
		,cmt.RehabilitationDesc
		,cmt.VehicleDamageDesc
		,cmt.VehicleTypeDesc
		,cmt.ViolationDesc
		,cmt.PolicyFormName
		,cmt.PolicyTypeDesc
		,cmt.CoverageTypeDesc
		,cmt.SettlementTypeCode
		,cmt.LossTypeCode
		,cmt.FraudulentClaimCode
		,cmt.ImpairmentPct
		,cmt.NYBoardCaseNum
		,cmt.SettlementAmt
		,cmt.ReopenedDate
		,cmt.AttyDisclosureDate
		,cmt.ClaimantContactedDate
		,cmt.MedicalApportionmentPct
		,cmt.OSHARecordableInd
		,cmt.PrimaryDiagnosisCode
		,cmt.ReleaseDate
		,cmt.PhysicalRestrictionsCode
		,cmt.IsSecondInjuryFundInd
		,cmt.ClaimantLegalFeesAmt
		,cmt.EmployerLegalFeesAmt
		,cmt.ReasonCode
		,cmt.SituationCode
		,cmt.ClaimantTypeCode
		,cmt.SalvageSubrogationCode
		,cmt.PropertyDamageCode
		,cmt.PropertyDamageDesc
		,cmt.SituationDesc
		,cmt.ReasonDesc
		,cmt.NegligencePct
		,cmt.DeathDate
		,(select pty_cmt.PartyInfoSourceCode
			,pty_cmt.SourceMasterNum
			,pty_cmt.PartyTypeCode
			,pty_cmt.PartyTypeDesc
			,pty_cmt.PartyReferenceDesc
			,pty_cmt.FirstName
			,pty_cmt.MiddleName
			,pty_cmt.LastName
			,pty_cmt.FullName
			,pty_cmt.GenderCode
			,pty_cmt.MaritalStatusCode
			,pty_cmt.BirthDate
			,pty_cmt.SocialSecurityNum
			,pty_cmt.OccupationDesc
			,pty_cmt.DriverLicenseNum
			,pty_cmt.DriverLicenseStateCode
			,pty_cmt.DriverLicenseStateDesc
			,pty_cmt.OrganizationName
			,pty_cmt.LegalName
			,pty_cmt.FEINNum
			,pty_cmt.DBAName
			,pty_cmt.ContactFirstName
			,pty_cmt.ContactMiddleName
			,pty_cmt.ContactLastName
			,pty_cmt.ContactFullName
			,pty_cmt.TaxIdNum
			,pty_cmt.SICCode
			,pty_cmt.SICDesc
			,pty_cmt.NorthAmericanIndustryClassificationCode
			,pty_cmt.NorthAmericanIndustryClassificationDesc
			,pty_cmt.OwnershipTypeCode
			,pty_cmt.OwnershipTypeDesc
			FROM ##C_PartyInfo pty_cmt
			WHERE pty_cmt.ClaimantSourceCode = cmt.ClaimantSourceCode and pty_cmt.ClaimSourceCode = cmt.ClaimSourceCode and pty_cmt.ProcessDateTime = root.ProcessDateTime and pty_cmt.SourceSystemCode = root.SourceSystemCode and pty_cmt.master = 'Claimant'
			FOR JSON PATH--,INCLUDE_NULL_VALUES
			) as 'PartyInfo'
		FROM ##C_Claimant cmt
		WHERE cmt.ClaimSourceCode = clm.ClaimSourceCode and cmt.ProcessDateTime = root.ProcessDateTime and cmt.SourceSystemCode = root.SourceSystemCode
		FOR JSON PATH--,INCLUDE_NULL_VALUES
		) as 'Claim.Claimant'
		,(select loc.ClaimLocationSourceCode
			,loc.AddressTypeDesc
			,loc.AddressTypeCode
			,loc.Line1Address
			,loc.Line2Address
			,loc.Line3Address
			,loc.Line4Address
			,loc.CityName
			,loc.StateDesc
			,loc.StateCode
			,loc.PostalCode
			,loc.CountryDesc
			,loc.CountryCode
			,loc.IsPrimaryClaimAddressInd
		FROM ##C_ClaimLocation loc
		WHERE loc.ClaimSourceCode = clm.ClaimSourceCode and loc.ProcessDateTime = root.ProcessDateTime and loc.SourceSystemCode = root.SourceSystemCode
		FOR JSON PATH--,INCLUDE_NULL_VALUES
		) as 'Claim.ClaimLocation'
		,(select evt.LossEventSourceCode
			,evt.LossEventTypeCode
			,evt.LossEventTypeDesc
			,evt.LossEventDesc
			,evt.SeverityDesc
			,evt.SeverityCode
			,evt.ClaimCurrencyDesc
			,evt.ClaimCurrencyCode
			,evt.IsSalvageOwnerRetainedInd
			,evt.IsSalvageWaivedInd
			,evt.LossEstimateAmt
			,(select occ.LossOccurrenceSourceCode
				,occ.SequenceNum
				,occ.ClaimCoverageSourceCode
				,occ.AssignmentStatusCode
				,occ.AssignmentStatusDesc
				,occ.StateCode
				,occ.StateDesc
				,occ.LossOccurrenceTypeCode
				,occ.LossOccurrenceTypeDesc
				,occ.ClaimantSourceCode
				,occ.ClaimantNum
				,occ.ClosedOutcomeCode
				,occ.ClosedOutcomeDesc
				,occ.LossOccurrenceTierCode
				,occ.LossOccurrenceTierDesc
				,occ.ClaimStrategyCode
				,occ.ClaimStrategyDesc
				,occ.ReopenReasonCode
				,occ.ReopenReasonDesc
				,occ.ValidationLevelCode
				,occ.ValidationLevelDesc
				,occ.LossPartyTypeCode
				,occ.LossPartyTypeDesc
				,occ.OtherReasonDesc
				,occ.ReOpenDate
				,occ.CloseDate
				,occ.AssignmentDate
				,occ.NotesTxt
				,occ.IsOtherCoverageInd
				,occ.IsContactPermittedInd
			FROM ##C_LossOccurrence occ
			WHERE occ.LossEventSourceCode = evt.LossEventSourceCode and occ.ClaimSourceCode = clm.ClaimSourceCode and occ.ProcessDateTime = root.ProcessDateTime and occ.SourceSystemCode = root.SourceSystemCode
			FOR JSON PATH--,INCLUDE_NULL_VALUES
			) as 'LossOccurrence'
		FROM ##C_LossEvent evt
		WHERE evt.ClaimSourceCode = clm.ClaimSourceCode and evt.ProcessDateTime = root.ProcessDateTime and evt.SourceSystemCode = root.SourceSystemCode
		FOR JSON PATH--,INCLUDE_NULL_VALUES
		) as 'Claim.LossEvent'
		,clp.ClaimPolicySourceCode AS 'Claim.ClaimPolicy.ClaimPolicySourceCode'
		,clp.PolicyNum AS 'Claim.ClaimPolicy.PolicyNum'
		,clp.PolicyStatusDesc AS 'Claim.ClaimPolicy.PolicyStatusDesc'
		,clp.PolicyStatusCode AS 'Claim.ClaimPolicy.PolicyStatusCode'
		,clp.PolicyTypeDesc AS 'Claim.ClaimPolicy.PolicyTypeDesc'
		,clp.PolicyTypeCode AS 'Claim.ClaimPolicy.PolicyTypeCode'
		,clp.ProductDesc AS 'Claim.ClaimPolicy.ProductDesc'
		,clp.ProductCode AS 'Claim.ClaimPolicy.ProductCode'
		,clp.PolicyCurrencyCode AS 'Claim.ClaimPolicy.PolicyCurrencyCode'
		,clp.PolicyCurrencyDesc AS 'Claim.ClaimPolicy.PolicyCurrencyDesc'
		,clp.CoverageTriggerDesc AS 'Claim.ClaimPolicy.CoverageTriggerDesc'
		,clp.CoverageTriggerCode AS 'Claim.ClaimPolicy.CoverageTriggerCode'
		,clp.EffectiveDate AS 'Claim.ClaimPolicy.EffectiveDate'
		,clp.ExpirationDate AS 'Claim.ClaimPolicy.ExpirationDate'
		,clp.OriginalEffectiveDate AS 'Claim.ClaimPolicy.OriginalEffectiveDate'
		,clp.CancellationDate AS 'Claim.ClaimPolicy.CancellationDate'
		,clp.ReportingDate AS 'Claim.ClaimPolicy.ReportingDate'
		,clp.RetroactiveDate AS 'Claim.ClaimPolicy.RetroactiveDate'
		,clp.AccountNum AS 'Claim.ClaimPolicy.AccountNum'
		,clp.UnderwritingYear AS 'Claim.ClaimPolicy.UnderwritingYear'
		,clp.NotesInfo AS 'Claim.ClaimPolicy.NotesInfo'
		,clp.TreatyCoverageSharePct AS 'Claim.ClaimPolicy.TreatyCoverageSharePct'
		,clp.AnnualAggregateDeductibleAmt AS 'Claim.ClaimPolicy.AnnualAggregateDeductibleAmt'
		,clp.LayerRetentionAmt AS 'Claim.ClaimPolicy.LayerRetentionAmt'
		,clp.MinimumPremiumAmt AS 'Claim.ClaimPolicy.MinimumPremiumAmt'
		,clp.OccurrenceLimitAmt AS 'Claim.ClaimPolicy.OccurrenceLimitAmt'
		,clp.NumOfReinstatements AS 'Claim.ClaimPolicy.NumOfReinstatements'
		,clp.TotalVehicleCount AS 'Claim.ClaimPolicy.TotalVehicleCount'
		,clp.TotalPropertyCount AS 'Claim.ClaimPolicy.TotalPropertyCount'
		,clp.LineofBusinessDesc AS 'Claim.ClaimPolicy.LineofBusinessDesc'
		,clp.LineofBusinessCode AS 'Claim.ClaimPolicy.LineofBusinessCode'
		,(select wco.WritingCompanySourceCode
			,wco.WritingCompanyCode
			,wco.WritingCompanyName
			,wco.NorthAmericanIndustryClassificationCode
			,wco.FederalEmployerIdentificationNumberCode
			,wco.AMBestCode
			,wco.IsActiveInd
			,wco.IsAdmittedInd
			,wco.IsBranchInd
			,wco.IsFrontingCompanyInd
			,wco.BaseCurrencyCode
			,wco.NCCICompanyCode
			FROM ##C_WritingCompany wco
			WHERE wco.ClaimPolicySourceCode = clp.ClaimPolicySourceCode and wco.ClaimSourceCode = clm.ClaimSourceCode and wco.ProcessDateTime = root.ProcessDateTime and wco.SourceSystemCode = root.SourceSystemCode and wco.master = 'ClaimPolicy'
			FOR JSON PATH--,INCLUDE_NULL_VALUES
			) as 'Claim.ClaimPolicy.WritingCompany'
		,(select fco.FrontingCompanySourceCode
			,fco.IsMGAInd
			,fco.FrontingCompanyName
			,fco.NCCICompanyCode
			FROM ##C_FrontingCompany fco
			WHERE fco.ClaimPolicySourceCode = clp.ClaimPolicySourceCode and fco.ClaimSourceCode = clm.ClaimSourceCode and fco.ProcessDateTime = root.ProcessDateTime and fco.SourceSystemCode = root.SourceSystemCode and fco.master = 'ClaimPolicy'
			FOR JSON PATH--,INCLUDE_NULL_VALUES
			) as 'Claim.ClaimPolicy.FrontingCompany'
		,(select clc.ClaimCoverageSourceCode
			,clc.CoverageSequenceNum
			,clc.CoverageDesc
			,clc.CoverageCode
			,clc.SubCoverageDesc
			,clc.SubCoverageCode
			,clc.ProfitAnalysisDesc
			,clc.ProfitAnalysisCode
			,clc.CoverageTriggerCode
			,clc.CoverageTriggerDesc
			,clc.CoverageClassCode
			,clc.CoverageClassDesc
			,clc.ClaimCurrencyDesc
			,clc.ClaimCurrencyCode
			,clc.PolicyCurrencyDesc
			,clc.PolicyCurrencyCode
			,clc.AnnualStatementLineofBusinessDesc
			,clc.AnnualStatementLineofBusinessCode
			,clc.TreatySharePct
			,clc.CoinsurancePct
			,clc.SharePct
			,clc.SignedLinePct
			,clc.SignedOrderPct
			,clc.WrittenLinePct
			,clc.WrittenOrderPct
			,clc.IncidentLimitAmt
			,clc.AttachmentPointAmt
			,clc.ExposureLimitAmt
			,clc.DeductibleAmt
			,clc.OccurrenceLimitAmt
			,clc.BondLimitAmt
			,clc.PartOfAmt
			,clc.LayerRetentionAmt
			,clc.NotesTxt
			FROM ##C_ClaimCoverage clc
			WHERE clc.ClaimPolicySourceCode = clp.ClaimPolicySourceCode and clc.ClaimSourceCode = clm.ClaimSourceCode and clc.ProcessDateTime = root.ProcessDateTime and clc.SourceSystemCode = root.SourceSystemCode
			FOR JSON PATH--,INCLUDE_NULL_VALUES
			) as 'Claim.ClaimPolicy.ClaimCoverage'
		,(select ctr.ClaimTransactionSourceCode
			,ctr.LossOccurrenceSequenceNumber
			,ctr.LossOccurrenceSourceCode
			,ctr.ClaimCoverageSourceCode
			,ctr.AuthorizationStatusDesc
			,ctr.AuthorizationStatusCode
			,ctr.ClaimTransactionTypeDesc
			,ctr.ClaimTransactionTypeCode
			,ctr.CostTypeCode
			,ctr.CostTypeDesc
			,ctr.ClaimTransactionCategoryTypeDesc
			,ctr.ClaimTransactionCategoryTypeCode
			,ctr.PaymentTypeDesc
			,ctr.PaymentTypeCode
			,ctr.RecoveryCategoryTypeCode
			,ctr.RecoveryCategoryTypeDesc
			,ctr.BaseCurrencyDesc
			,ctr.BaseCurrencyCode
			,ctr.OriginalCurrencyDesc
			,ctr.OriginalCurrencyCode
			,ctr.ReportingCurrencyDesc
			,ctr.ReportingCurrencyCode
			,ctr.TransactionBaseAmt
			,ctr.TransactionOriginalAmt
			,ctr.TransactionReportingAmt
			,ctr.TransactionDate
			,(select pmt.ClaimPayentSourceCode
				,pmt.FinancialReportingPeriodNum
				,pmt.TransactionStatusDesc
				,pmt.TransactionStatusCode
				,pmt.ClaimantNum
				,pmt.ClaimantSourceCode
				,pmt.SequenceNum
				,pmt.CheckTypeDesc
				,pmt.CheckTypeCode
				,pmt.InvoiceNum
				,pmt.CheckNum
				,pmt.CheckDate
				,pmt.PayeeName
				,pmt.PayeeTypeDesc
				,pmt.PayeeTypeCode
				,pmt.PaymentMethodDesc
				,pmt.PaymentMethodCode
				,pmt.BankAccountDesc
				,pmt.BankAccountCode
				,pmt.BankAccountTypeDesc
				,pmt.BankAccountTypeCode
				,pmt.BankRoutingNum
				,pmt.PaymentDate
				,pmt.MailToName
				,pmt.MailToAddress
				,pmt.IsReportabldeInd
				,pmt.ReportableAmt
				,pmt.CommentTxt
			FROM ##C_ClaimPayment pmt
			WHERE pmt.ClaimTransactionSourceCode = ctr.ClaimTransactionSourceCode and pmt.ClaimSourceCode = clm.ClaimSourceCode and pmt.ProcessDateTime = root.ProcessDateTime and pmt.SourceSystemCode = root.SourceSystemCode
			FOR JSON PATH--,INCLUDE_NULL_VALUES
			) as 'ClaimPayment'
		FROM ##C_ClaimTransaction ctr
		WHERE ctr.ClaimSourceCode = clm.ClaimSourceCode and ctr.ProcessDateTime = root.ProcessDateTime and ctr.SourceSystemCode = root.SourceSystemCode
		FOR JSON PATH--,INCLUDE_NULL_VALUES
		) as 'Claim.ClaimTransaction'
	FOR JSON PATH, WITHOUT_ARRAY_WRAPPER--,INCLUDE_NULL_VALUES
	) jsonline, clm.ClaimNum
FROM ##C_Root root 
join ##C_Claim clm on clm.ClaimSourceCode = root.ClaimSourceCode and clm.ProcessDateTime = root.ProcessDateTime and clm.SourceSystemCode = root.SourceSystemCode
join ##C_ClaimPolicy clp on clp.ClaimSourceCode = clm.ClaimSourceCode and clp.ProcessDateTime = root.ProcessDateTime and clp.SourceSystemCode = root.SourceSystemCode
) a

GO
