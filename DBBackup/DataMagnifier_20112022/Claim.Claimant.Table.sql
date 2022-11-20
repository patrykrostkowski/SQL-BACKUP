USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[Claimant]    Script Date: 20.11.2022 14:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[Claimant](
	[ClaimantSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PartySK] [int] NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[ClaimantNum] [varchar](25) NULL,
	[ClaimCurrencySK] [int] NOT NULL,
	[FirstAbsentDate] [date] NULL,
	[FirstLostDate] [date] NULL,
	[LastWorkedDate] [date] NULL,
	[NoticeDate] [date] NULL,
	[ReceivedDate] [date] NULL,
	[ReportedDate] [date] NULL,
	[LostDaysNum] [int] NULL,
	[DiagnosisCode] [varchar](25) NULL,
	[InjuryCode] [varchar](25) NULL,
	[ItemTypeCode] [varchar](25) NULL,
	[ManagedCareOrganizationCode] [varchar](25) NULL,
	[NCCIClassCode] [varchar](25) NULL,
	[NCCIInjuryCode] [varchar](25) NULL,
	[NCCITypeCode] [varchar](25) NULL,
	[OccupationCode] [varchar](25) NULL,
	[OSHAInjuryCode] [varchar](25) NULL,
	[OSHASeverityCode] [varchar](25) NULL,
	[PartOfBodyCode] [varchar](25) NULL,
	[RehabilitationCode] [varchar](25) NULL,
	[VehicleDamageCode] [varchar](25) NULL,
	[VehicleTypeCode] [varchar](25) NULL,
	[ViolationCode] [varchar](25) NULL,
	[AccidentDesc] [varchar](250) NULL,
	[AverageWeeklyWageAmt] [decimal](16, 2) NULL,
	[BenefitAmt] [decimal](16, 2) NULL,
	[CompensationAmt] [decimal](16, 2) NULL,
	[COLAAmt] [decimal](16, 2) NULL,
	[DependentAmt] [decimal](16, 2) NULL,
	[VehicleDamageAmt] [decimal](16, 2) NULL,
	[IsClaimantTicketedInd] [tinyint] NULL,
	[IsClaimantTowedInd] [tinyint] NULL,
	[IsInjuredOnPremisesInd] [tinyint] NULL,
	[IsMedcaseManagedInd] [tinyint] NULL,
	[IsMedicalOnlyInd] [tinyint] NULL,
	[IsPaidInFullForDateOfInjuryInd] [tinyint] NULL,
	[IsPreExistingConditionInd] [tinyint] NULL,
	[IsPreventableAccidentInd] [tinyint] NULL,
	[IsRepresentedByAttorneyInd] [tinyint] NULL,
	[IsDriverInsuredVehicleInd] [tinyint] NULL,
	[IsReturnedToWorkInd] [tinyint] NULL,
	[IsSurgeryRequiredInd] [tinyint] NULL,
	[IsMedicareBeneficiaryInd] [tinyint] NULL,
	[IsSafetyEquipProvidedInd] [tinyint] NULL,
	[IsSafetyEquipUsedInd] [tinyint] NULL,
	[IsPreExistingDisabilityInd] [tinyint] NULL,
	[IsSuitFiledInd] [tinyint] NULL,
	[IsVehicleTotalLossInd] [tinyint] NULL,
	[IsLumpSumInd] [tinyint] NULL,
	[VehicleIdentificationNum] [varchar](25) NULL,
	[VehicleYear] [varchar](4) NULL,
	[VehicleMake] [varchar](50) NULL,
	[VehicleModel] [varchar](50) NULL,
	[VehicleStateSK] [int] NULL,
	[VehicleTagNum] [varchar](25) NULL,
	[DiagnosisDesc] [varchar](255) NULL,
	[InjuryDesc] [varchar](255) NULL,
	[OccupationDesc] [varchar](255) NULL,
	[OSHAInjuryDesc] [varchar](255) NULL,
	[OSHASeverityDesc] [varchar](255) NULL,
	[PartOfBodyDesc] [varchar](255) NULL,
	[RehabilitationDesc] [varchar](255) NULL,
	[VehicleDamageDesc] [varchar](255) NULL,
	[VehicleTypeDesc] [varchar](255) NULL,
	[ViolationDesc] [varchar](255) NULL,
	[PolicyFormName] [varchar](25) NULL,
	[PolicyTypeDesc] [varchar](10) NULL,
	[CoverageTypeDesc] [varchar](10) NULL,
	[SettlementTypeCode] [varchar](10) NULL,
	[LossTypeCode] [varchar](10) NULL,
	[FraudulentClaimCode] [varchar](10) NULL,
	[ImpairmentPct] [decimal](8, 2) NULL,
	[NYBoardCaseNum] [varchar](50) NULL,
	[SettlementAmt] [decimal](19, 4) NULL,
	[ReopenedDate] [date] NULL,
	[AttyDisclosureDate] [date] NULL,
	[ClaimantContactedDate] [date] NULL,
	[MedicalApportionmentPct] [decimal](8, 2) NULL,
	[OSHARecordableInd] [tinyint] NULL,
	[PrimaryDiagnosisCode] [varchar](10) NULL,
	[ReleaseDate] [date] NULL,
	[PhysicalRestrictionsCode] [varchar](10) NULL,
	[IsSecondInjuryFundInd] [tinyint] NULL,
	[ClaimantLegalFeesAmt] [decimal](16, 2) NULL,
	[EmployerLegalFeesAmt] [decimal](16, 2) NULL,
	[ReasonCode] [varchar](25) NULL,
	[SituationCode] [varchar](25) NULL,
	[ClaimantTypeCode] [varchar](25) NULL,
	[SalvageSubrogationCode] [varchar](25) NULL,
	[PropertyDamageCode] [varchar](10) NULL,
	[PropertyDamageDesc] [varchar](255) NULL,
	[SituationDesc] [varchar](255) NULL,
	[ReasonDesc] [varchar](255) NULL,
	[NegligencePct] [decimal](8, 2) NULL,
	[DeathDate] [date] NULL,
 CONSTRAINT [PK_Claimant] PRIMARY KEY CLUSTERED 
(
	[ClaimantSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[Claimant]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_Claimant] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Claim].[Claimant] CHECK CONSTRAINT [FK_ClaimCurrencySK_Claimant]
GO
ALTER TABLE [Claim].[Claimant]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_Claimant] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[Claimant] CHECK CONSTRAINT [FK_ClaimSK_Claimant]
GO
ALTER TABLE [Claim].[Claimant]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Claimant] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Claim].[Claimant] CHECK CONSTRAINT [FK_PartySK_Claimant]
GO
ALTER TABLE [Claim].[Claimant]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Claimant] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[Claimant] CHECK CONSTRAINT [FK_SourceSystemSK_Claimant]
GO
ALTER TABLE [Claim].[Claimant]  WITH CHECK ADD  CONSTRAINT [FK_VehicleStateSK_Claimant] FOREIGN KEY([VehicleStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Claim].[Claimant] CHECK CONSTRAINT [FK_VehicleStateSK_Claimant]
GO
