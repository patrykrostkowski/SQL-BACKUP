USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [gentd].[gen_claim_json_data_prep]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [gentd].[gen_claim_json_data_prep]
as

DROP TABLE IF EXISTS ##C_Root
CREATE TABLE ##C_Root(
	SourceSystemCode varchar(200)
	,SourceSystemDesc varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
)

DROP TABLE IF EXISTS ##C_Claim
CREATE TABLE ##C_Claim(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	--LEVEL UP COLUMNS -- END
	,ClaimSourceCode varchar(200)
	,ClaimNum varchar(200)
	,IsBondClaimInd int
	,LegacyClaimNum varchar(200)
	,BureauClaimNum varchar(200)
	,CedentClaimNum varchar(200)
	,ClaimStatusDesc varchar(200)
	,ClaimStatusCode varchar(200)
	,ClaimTierDesc varchar(200)
	,ClaimTierCode varchar(200)
	,ClaimCurrencyCode varchar(200)
	,ClaimCurrencyDesc varchar(200)
	,LitigationStatusDesc varchar(200)
	,LitigationStatusCode varchar(200)
	,CoverageTriggerDesc varchar(200)
	,CoverageTriggerCode varchar(200)
	,ClosedOutcomeDesc varchar(200)
	,ClosedOutcomeCode varchar(200)
	,InjurySeverityDesc varchar(200)
	,InjurySeverityCode varchar(200)
	,ProductDesc varchar(200)
	,ProductCode varchar(200)
	,MajorCauseofLossDesc varchar(200)
	,MajorCauseofLossCode varchar(200)
	,LossAnalysisDesc varchar(200)
	,LossAnalysisCode varchar(200)
	,FaultRatingDesc varchar(200)
	,FaultRatingCode varchar(200)
	,ClaimProgressDesc varchar(200)
	,ClaimProgressCode varchar(200)
	,ClaimantOutcomeDesc varchar(200)
	,ClaimantOutcomeCode varchar(200)
	,FlaggedTypeDesc varchar(200)
	,FlaggedTypeCode varchar(200)
	,OpenReasonDesc varchar(200)
	,OpenReasonCode varchar(200)
	,SubrogationStatusDesc varchar(200)
	,SubrogationStatusCode varchar(200)
	,SalvageStatusDesc varchar(200)
	,SalvageStatusCode varchar(200)
	,AreaofPracticeDesc varchar(200)
	,AreaofPracticeCode varchar(200)
	,StandardIndustryCodeDesc varchar(200)
	,StandardIndustryCode varchar(200)
	,NorthAmericanIndustryClassificationDesc varchar(200)
	,NorthAmericanIndustryClassificationCode varchar(200)
	,DateofLossQualifierDesc varchar(200)
	,DateofLossQualifierCode varchar(200)
	,ReopenReasonDesc varchar(200)
	,ReopenReasonCode varchar(200)
	,OtherRecoverableStatusDesc varchar(200)
	,OtherRecoverableStatusCode varchar(200)
	,CauseofLossDesc varchar(200)
	,CauseofLossCode varchar(200)
	,ClaimDesc varchar(200)
	,ProgramNum varchar(200)
	,SpecialInvestigationScoreNum int
	,FlaggedReasonDesc varchar(200)
	,AccountMarketYear int
	,BrokerAdvisedDate date
	,AttachmentDate date
	,EventDate date
	,OpenedDate date
	,ClosedDate date
	,RecentActivityDate date
	,LossDate date
	,ClaimantReportedDate date
	,ClaimsMadeDate date
	,ClaimEntryDate date
	,OriginalEntryDate date
	,ContractLossDate date
	,ReportedtoAgentDate date
	,ReportedtoInsuredDate date
	,FlaggedDate date
	,DeathDate date
	,ReOpenDate date
	,IsShowMedicalFirstInd int
	,IsCoverageDeniedInd int
	,IsBlockClaimInd int
	,IsAnnualAggregateDeductibleInd int
	,IsAvoidanceInd int
	,IsBureauClaimInd int
	,IsConflictInd int
	,IsAutoClaimReviewInd int
	,IsECOInd int
	,IsExcessInd int
	,IsExGratiaInd int
	,IsinjuredRegularJobInd int
	,IsInsuredPremisesInd int
	,IsInsuranceInd int
	,IsISOEnabledInd int
	,IsIncidentReportInd int
	,IsCoverageInQuestionInd int
	,IsPeriodicPaymentOrderInd int
	,IsQuotaShareMemoInd int
	,IsReinstatementFlaggedInd int
	,IsReinsuranceReportableInd int
	,IsReOpenedInd int
	,IsShadowPolicyInd int
	,IsLitigationClaimInd int
	,IsFatalityClaimInd int
	,IsSIUClaimInd int
	,IsFlagClaimInd int
	,IsLargeClaimInd int
	,IsWatchListInd int
	,IsDisputeClaimInd int
	,IsClaimAttachedToTransactionInd int
	,CatLossEstimateAmt decimal(20, 6)
	,CatLossEstimateCurrencyDesc varchar(200)
	,CatLossEstimateCurrencyCode varchar(200)
	,AllegedCauseOfLossDesc varchar(200)
	,AllegedCauseOfLossCode varchar(200)
	,IsClassActionInd int
	,IsLeadInd int
	,IsFormFollowInd int
	,IsQuotaShareInd int
	,IsReinsuranceContractInd int
	,IsAllegationBadFaithInd int
	,IsBadFaithInd int
	,ExcessParticipationPct decimal(20, 6)
	,QuotaShareParticipationPct decimal(20, 6)
	,ReinsuranceParticipationPct decimal(20, 6)
	,ClaimCategoryTypeCode varchar(200)
	,ClaimCategoryTypeDesc varchar(200)
)

DROP TABLE IF EXISTS ##C_Claimant
CREATE TABLE ##C_Claimant(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,ClaimantSourceCode varchar(200)
	,ClaimantNum varchar(200)
	,FirstAbsentDate date
	,FirstLostDate date
	,LastWorkedDate date
	,NoticeDate date
	,ReceivedDate date
	,ReportedDate date
	,LostDaysNum int
	,DiagnosisCode varchar(200)
	,InjuryCode varchar(200)
	,ItemTypeCode varchar(200)
	,ManagedCareOrganizationCode varchar(200)
	,NCCIClassCode varchar(200)
	,NCCIInjuryCode varchar(200)
	,NCCITypeCode varchar(200)
	,OccupationCode varchar(200)
	,OSHAInjuryCode varchar(200)
	,OSHASeverityCode varchar(200)
	,PartOfBodyCode varchar(200)
	,RehabilitationCode varchar(200)
	,VehicleDamageCode varchar(200)
	,VehicleTypeCode varchar(200)
	,ViolationCode varchar(200)
	,AccidentDesc varchar(200)
	,AverageWeeklyWageAmt decimal(20, 6)
	,BenefitAmt decimal(20, 6)
	,CompensationAmt decimal(20, 6)
	,COLAAmt decimal(20, 6)
	,DependentAmt decimal(20, 6)
	,VehicleDamageAmt decimal(20, 6)
	,IsClaimantTicketedInd int
	,IsClaimantTowedInd int
	,IsInjuredOnPremisesInd int
	,IsMedcaseManagedInd int
	,IsMedicalOnlyInd int
	,IsPaidInFullForDateOfInjuryInd int
	,IsPreExistingConditionInd int
	,IsPreventableAccidentInd int
	,IsRepresentedByAttorneyInd int
	,IsDriverInsuredVehicleInd int
	,IsReturnedToWorkInd int
	,IsSurgeryRequiredInd int
	,IsMedicareBeneficiaryInd int
	,IsSafetyEquipProvidedInd int
	,IsSafetyEquipUsedInd int
	,IsPreExistingDisabilityInd int
	,IsSuitFiledInd int
	,IsVehicleTotalLossInd int
	,IsLumpSumInd int
	,VehicleIdentificationNum varchar(200)
	,VehicleYear varchar(200)
	,VehicleMake varchar(200)
	,VehicleModel varchar(200)
	,VehicleStateDesc varchar(200)
	,VehicleStateCode varchar(200)
	,VehicleTagNum varchar(200)
	,DiagnosisDesc varchar(200)
	,InjuryDesc varchar(200)
	,OccupationDesc varchar(200)
	,OSHAInjuryDesc varchar(200)
	,OSHASeverityDesc varchar(200)
	,PartOfBodyDesc varchar(200)
	,RehabilitationDesc varchar(200)
	,VehicleDamageDesc varchar(200)
	,VehicleTypeDesc varchar(200)
	,ViolationDesc varchar(200)
	,PolicyFormName varchar(200)
	,PolicyTypeDesc varchar(200)
	,CoverageTypeDesc varchar(200)
	,SettlementTypeCode varchar(200)
	,LossTypeCode varchar(200)
	,FraudulentClaimCode varchar(200)
	,ImpairmentPct decimal(20, 6)
	,NYBoardCaseNum varchar(200)
	,SettlementAmt decimal(20, 6)
	,ReopenedDate date
	,AttyDisclosureDate date
	,ClaimantContactedDate date
	,MedicalApportionmentPct decimal(20, 6)
	,OSHARecordableInd int
	,PrimaryDiagnosisCode varchar(200)
	,ReleaseDate date
	,PhysicalRestrictionsCode varchar(200)
	,IsSecondInjuryFundInd int
	,ClaimantLegalFeesAmt decimal(20, 6)
	,EmployerLegalFeesAmt decimal(20, 6)
	,ReasonCode varchar(200)
	,SituationCode varchar(200)
	,ClaimantTypeCode varchar(200)
	,SalvageSubrogationCode varchar(200)
	,PropertyDamageCode varchar(200)
	,PropertyDamageDesc varchar(200)
	,SituationDesc varchar(200)
	,ReasonDesc varchar(200)
	,NegligencePct varchar(200)
	,DeathDate date
	)

DROP TABLE IF EXISTS ##C_PartyInfo
CREATE TABLE ##C_PartyInfo(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	,master varchar(200) --Claimant OR MiscParty OR ...
	,ClaimantSourceCode varchar(200)
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

DROP TABLE IF EXISTS ##C_ClaimLocation
CREATE TABLE ##C_ClaimLocation(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,ClaimLocationSourceCode varchar(200)
	,AddressTypeDesc varchar(200)
	,AddressTypeCode varchar(200)
	,Line1Address varchar(200)
	,Line2Address varchar(200)
	,Line3Address varchar(200)
	,Line4Address varchar(200)
	,CityName varchar(200)
	,StateDesc varchar(200)
	,StateCode varchar(200)
	,PostalCode varchar(200)
	,CountryDesc varchar(200)
	,CountryCode varchar(200)
	,IsPrimaryClaimAddressInd int
)

DROP TABLE IF EXISTS ##C_LossEvent
CREATE TABLE ##C_LossEvent(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,LossEventSourceCode varchar(200)
	,LossEventTypeCode varchar(200)
	,LossEventTypeDesc varchar(200)
	,LossEventDesc varchar(200)
	,SeverityDesc varchar(200)
	,SeverityCode varchar(200)
	,ClaimCurrencyDesc varchar(200)
	,ClaimCurrencyCode varchar(200)
	,IsSalvageOwnerRetainedInd int
	,IsSalvageWaivedInd int
	,LossEstimateAmt decimal(20, 6)
)

DROP TABLE IF EXISTS ##C_LossOccurrence
CREATE TABLE ##C_LossOccurrence(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	,LossEventSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,LossOccurrenceSourceCode varchar(200)
	,SequenceNum int
	,ClaimCoverageSourceCode varchar(200)
	,AssignmentStatusCode varchar(200)
	,AssignmentStatusDesc varchar(200)
	,StateCode varchar(200)
	,StateDesc varchar(200)
	,LossOccurrenceTypeCode varchar(200)
	,LossOccurrenceTypeDesc varchar(200)
	,ClaimantSourceCode varchar(200)
	,ClaimantNum varchar(200)
	,ClosedOutcomeCode varchar(200)
	,ClosedOutcomeDesc varchar(200)
	,LossOccurrenceTierCode varchar(200)
	,LossOccurrenceTierDesc varchar(200)
	,ClaimStrategyCode varchar(200)
	,ClaimStrategyDesc varchar(200)
	,ReopenReasonCode varchar(200)
	,ReopenReasonDesc varchar(200)
	,ValidationLevelCode varchar(200)
	,ValidationLevelDesc varchar(200)
	,LossPartyTypeCode varchar(200)
	,LossPartyTypeDesc varchar(200)
	,OtherReasonDesc varchar(200)
	,ReOpenDate date
	,CloseDate date
	,AssignmentDate date
	,NotesTxt varchar(200)
	,IsOtherCoverageInd int
	,IsContactPermittedInd int
)

DROP TABLE IF EXISTS ##C_ClaimPolicy
CREATE TABLE ##C_ClaimPolicy(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,ClaimPolicySourceCode varchar(200)
	,PolicyNum varchar(200)
	,PolicyStatusDesc varchar(200)
	,PolicyStatusCode varchar(200)
	,PolicyTypeDesc varchar(200)
	,PolicyTypeCode varchar(200)
	,ProductDesc varchar(200)
	,ProductCode varchar(200)
	,PolicyCurrencyCode varchar(200)
	,PolicyCurrencyDesc varchar(200)
	,CoverageTriggerDesc varchar(200)
	,CoverageTriggerCode varchar(200)
	,EffectiveDate date
	,ExpirationDate date
	,OriginalEffectiveDate date
	,CancellationDate date
	,ReportingDate date
	,RetroactiveDate date
	,AccountNum varchar(200)
	,UnderwritingYear int
	,NotesInfo varchar(200)
	,TreatyCoverageSharePct decimal(20, 6)
	,AnnualAggregateDeductibleAmt decimal(20, 6)
	,LayerRetentionAmt decimal(20, 6)
	,MinimumPremiumAmt decimal(20, 6)
	,OccurrenceLimitAmt decimal(20, 6)
	,NumOfReinstatements varchar(200)
	,TotalVehicleCount int
	,TotalPropertyCount int
	,LineofBusinessDesc varchar(200)
	,LineofBusinessCode varchar(200)

)

DROP TABLE IF EXISTS ##C_ClaimCoverage
CREATE TABLE ##C_ClaimCoverage(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	,ClaimPolicySourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,ClaimCoverageSourceCode varchar(200)
	,CoverageSequenceNum varchar(200)
	,CoverageDesc varchar(200)
	,CoverageCode varchar(200)
	,SubCoverageDesc varchar(200)
	,SubCoverageCode varchar(200)
	,ProfitAnalysisDesc varchar(200)
	,ProfitAnalysisCode varchar(200)
	,CoverageTriggerCode varchar(200)
	,CoverageTriggerDesc varchar(200)
	,CoverageClassCode varchar(200)
	,CoverageClassDesc varchar(200)
	,ClaimCurrencyDesc varchar(200)
	,ClaimCurrencyCode varchar(200)
	,PolicyCurrencyDesc varchar(200)
	,PolicyCurrencyCode varchar(200)
	,AnnualStatementLineofBusinessDesc varchar(200)
	,AnnualStatementLineofBusinessCode varchar(200)
	,TreatySharePct decimal(20, 6)
	,CoinsurancePct decimal(20, 6)
	,SharePct decimal(20, 6)
	,SignedLinePct decimal(20, 6)
	,SignedOrderPct decimal(20, 6)
	,WrittenLinePct decimal(20, 6)
	,WrittenOrderPct decimal(20, 6)
	,IncidentLimitAmt decimal(20, 6)
	,AttachmentPointAmt decimal(20, 6)
	,ExposureLimitAmt decimal(20, 6)
	,DeductibleAmt decimal(20, 6)
	,OccurrenceLimitAmt decimal(20, 6)
	,BondLimitAmt decimal(20, 6)
	,PartOfAmt decimal(20, 6)
	,LayerRetentionAmt decimal(20, 6)
	,NotesTxt varchar(200)
)

DROP TABLE IF EXISTS ##C_ClaimTransaction
CREATE TABLE ##C_ClaimTransaction(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,ClaimTransactionSourceCode varchar(200)
	,LossOccurrenceSequenceNumber varchar(200)
	,LossOccurrenceSourceCode varchar(200)
	,ClaimCoverageSourceCode varchar(200)
	,AuthorizationStatusDesc varchar(200)
	,AuthorizationStatusCode varchar(200)
	,ClaimTransactionTypeDesc varchar(200)
	,ClaimTransactionTypeCode varchar(200)
	,CostTypeDesc varchar(200)
	,CostTypeCode varchar(200)
	,ClaimTransactionCategoryTypeDesc varchar(200)
	,ClaimTransactionCategoryTypeCode varchar(200)
	,PaymentTypeDesc varchar(200)
	,PaymentTypeCode varchar(200)
	,BaseCurrencyDesc varchar(200)
	,BaseCurrencyCode varchar(200)
	,OriginalCurrencyDesc varchar(200)
	,OriginalCurrencyCode varchar(200)
	,ReportingCurrencyDesc varchar(200)
	,ReportingCurrencyCode varchar(200)
	,TransactionBaseAmt decimal(20, 6)
	,TransactionOriginalAmt decimal(20, 6)
	,TransactionReportingAmt decimal(20, 6)
	,TransactionDate datetime
	,RecoveryCategoryTypeCode varchar(200)
	,RecoveryCategoryTypeDesc varchar(200)
)

DROP TABLE IF EXISTS ##C_ClaimPayment
CREATE TABLE ##C_ClaimPayment(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	,ClaimTransactionSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,ClaimPayentSourceCode varchar(200)
	,FinancialReportingPeriodNum varchar(200)
	,TransactionStatusDesc varchar(200)
	,TransactionStatusCode varchar(200)
	,ClaimantNum varchar(200)
	,ClaimantSourceCode varchar(200)
	,SequenceNum int
	,CheckTypeDesc varchar(200)
	,CheckTypeCode varchar(200)
	,InvoiceNum varchar(200)
	,CheckNum varchar(200)
	,CheckDate date
	,PayeeName varchar(200)
	,PayeeTypeDesc varchar(200)
	,PayeeTypeCode varchar(200)
	,PaymentMethodDesc varchar(200)
	,PaymentMethodCode varchar(200)
	,BankAccountDesc varchar(200)
	,BankAccountCode varchar(200)
	,BankAccountTypeDesc varchar(200)
	,BankAccountTypeCode varchar(200)
	,BankRoutingNum varchar(200)
	,PaymentDate date
	,MailToName varchar(200)
	,MailToAddress varchar(200)
	,IsReportabldeInd int
	,ReportableAmt decimal(20, 6)
	,CommentTxt varchar(200)
)

DROP TABLE IF EXISTS ##C_ClaimStatusHistory
CREATE TABLE ##C_ClaimStatusHistory(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,ClaimStatusHistorySourceCode varchar(200)
	,SequenceNum int
	,ClaimStatusCode varchar(200)
	,ClaimStatusDesc varchar(200)
	,OpenDate date
	,CloseDate date
	,CloseReasonDesc varchar(200)
	,ReOpenDate date
	,ReOpenReasonDesc varchar(200)
)

DROP TABLE IF EXISTS ##C_WritingCompany
CREATE TABLE ##C_WritingCompany(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	,master varchar(200) --ClaimPolicy
	,ClaimPolicySourceCode varchar(200)
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

DROP TABLE IF EXISTS ##C_FrontingCompany
CREATE TABLE ##C_FrontingCompany(
	--LEVEL UP COLUMNS -- BEGIN
	SourceSystemCode varchar(200)
	,ProcessDateTime datetime
	,ClaimSourceCode varchar(200)
	,master varchar(200) --ClaimPolicy
	,ClaimPolicySourceCode varchar(200)
	--LEVEL UP COLUMNS -- END
	,FrontingCompanySourceCode varchar(200)
	,IsMGAInd int
	,FrontingCompanyName varchar(200)
	,NCCICompanyCode varchar(200)
)
GO
