USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[PrepareODSLoad]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE   procedure [StgPolicy].[PrepareODSLoad] as 
--################################ POLICY ###################################################
-- POLICY TESTED PACKAGES AND CORRECT ORDER 
delete from Party.PartyMaster							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.RatingIntegrationPlan				where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Party.PartyMaster							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.Program								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Party.WritingCompany						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Party.Insured								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Party.Agency								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Party.Account								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.Policy								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyTrans							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyLineofBusiness					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicySubLine						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyGeography						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyTransReason					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyTransDetail					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyForm							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyInsurableObject				where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyInsurableObjectDetail			where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.Watercraft							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.WatercraftLocation					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyCoverage						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyLimit							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyExposure						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyDiscount						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyDeductible						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyCoverageFee					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.Property								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.Dwelling								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.Building								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.Vehicle								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
--delete from Policy.VehicleDriver						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%') -- no Driver package created
delete from Policy.VehicleRegistration					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.AntiTheftDevice						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PersonalProperty						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.Aircraft								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.AircraftLocation						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Party.ContactPoint							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Party.ContactPointAddress					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.ratingplan where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Party.Person where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')


-- UNTESTED OR NOT DEVELOPED YET

delete from Policy.VehicleSafetyFeature					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.VehicleLocation						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.AccidentViolation					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.BondCoverage							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.BondTrans							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.Bond									where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.RatingPlanFactor						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PropertyVehicleDetail				where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PropertyInTransit					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyLineofBusiness					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyTrans							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicySubCoverage					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyLossHistory					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.PolicyAudit							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.HouseholdContent						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.IMTransportationClass				where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.DriverLicenseDetail					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.Driver								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Policy.FreightContent						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')


--################################ CLAIM ###################################################
-- CLAIM TESTED PACKAGES AND CORRECT ORDER 
delete from Party.PartyMaster							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Party.WritingCompany						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.Catastrophe							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.CatastropheDetail						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.CatastropheZone						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.Claim									where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.ClaimLocation							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.ClaimPolicy							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.ClaimPolicyAssociation				where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.ClaimCoverage							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.Litigation							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.LitigationDetail						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.Claimant								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.ClaimAudit							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.MedicalCase							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.MedcasehospitalPlan					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.CaseDetail							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.MedicareDetail						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.LossEvent								where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.LossEventSalvage						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.LossEventAircraft						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.LossEventPersonalProperty				where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.LossEventProperty						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.LossEventWatercraft					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.Subrogation							where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.LossOccurrence						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.LossEventInjury						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.ClaimInjuryDiagnosis					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.ClaimRelationship						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Party.PartyRoleInClaimRelationship			where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Finance.ClaimTransaction					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Finance.ClaimPayment						where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')
delete from Claim.ClaimStatusHistory					where ETLUpdateProcessNum in (select batchid from log.batchload where processname like 'JSON_TO_ODS_ETL%')

delete from log.batchload where processname like 'JSON_TO_ODS_ETL%'
--update config.typelistconfig set active = 0


GO
