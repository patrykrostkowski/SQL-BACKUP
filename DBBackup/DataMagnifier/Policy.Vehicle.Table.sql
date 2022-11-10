USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[Vehicle]    Script Date: 10.11.2022 13:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[Vehicle](
	[VehicleSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyInsurableObjectSK] [int] NOT NULL,
	[SequenceNum] [int] NULL,
	[VehicleDesc] [varchar](255) NULL,
	[Manufacturer] [varchar](255) NULL,
	[Make] [varchar](255) NULL,
	[Model] [varchar](255) NULL,
	[ModelYear] [varchar](255) NULL,
	[PricingCode] [varchar](255) NULL,
	[MSRP] [decimal](19, 4) NULL,
	[VehicleBodyTypeCode] [varchar](255) NULL,
	[VehicleBodyTypeDesc] [varchar](255) NULL,
	[VehicleTypeCode] [varchar](255) NULL,
	[VehicleTypeDesc] [varchar](255) NULL,
	[VehicleUsageCode] [varchar](255) NULL,
	[VehicleUsageDesc] [varchar](255) NULL,
	[VehicleLength] [varchar](255) NULL,
	[IsBusinessUseInd] [tinyint] NULL,
	[VehicleWidth] [varchar](255) NULL,
	[NumCylinders] [int] NULL,
	[VehicleDisplacement] [varchar](255) NULL,
	[VehicleTransmissionCode] [varchar](255) NULL,
	[VehicleTransmissionDesc] [varchar](255) NULL,
	[NumDaysDrivenPerWeek] [int] NULL,
	[EstimatedAnnualDistance] [varchar](255) NULL,
	[IsVehicleLeasedInd] [tinyint] NULL,
	[IsKitVehicleInd] [tinyint] NULL,
	[IsOtherThanNamedInsuredOwnsInd] [tinyint] NULL,
	[IsFourWheelDriveInd] [tinyint] NULL,
	[IsCarPoolInd] [tinyint] NULL,
	[LeasedDate] [date] NULL,
	[LicensePlateNumber] [varchar](255) NULL,
	[LicensePlateEffectiveDate] [date] NULL,
	[LicensePlateExpirationDate] [date] NULL,
	[PurchaseDate] [date] NULL,
	[OdometerReadingAtPurchase] [varchar](255) NULL,
	[VehiclePerformanceCode] [varchar](255) NULL,
	[VehiclePerformanceDesc] [varchar](255) NULL,
	[RegistrationTypeCode] [varchar](255) NULL,
	[RegistrationNum] [varchar](255) NULL,
	[RegistrationEffectiveDate] [date] NULL,
	[RegistrationExpirationDate] [date] NULL,
	[RegistrationStateSK] [int] NULL,
	[RegistrationCountrySK] [int] NOT NULL,
	[VehicleIdentificationNum] [varchar](255) NULL,
	[ChassisSerialNumber] [varchar](255) NULL,
	[EngineSerialNumber] [varchar](255) NULL,
	[TransmissionSerialNumber] [varchar](255) NULL,
	[VehicleSymbolCode] [varchar](255) NULL,
	[ColorCode] [varchar](255) NULL,
	[ColorDesc] [varchar](255) NULL,
	[GrossVehicleWeight] [varchar](255) NULL,
	[RateSubClassCode] [varchar](255) NULL,
	[EngineTypeCode] [varchar](255) NULL,
	[EngineTypeDesc] [varchar](255) NULL,
	[MaximumSpeed] [varchar](255) NULL,
	[DistanceOneWay] [varchar](255) NULL,
	[NumAxles] [int] NULL,
	[LengthTimePerMonth] [varchar](255) NULL,
	[NumYouthfulOperators] [int] NULL,
	[OdometerReading] [varchar](255) NULL,
	[PhysicalDamageRateClassCode] [varchar](255) NULL,
	[IsPrincipalOperatorInd] [tinyint] NULL,
	[RateClassCode] [varchar](255) NULL,
	[IsResidualMarketFacilityInd] [tinyint] NULL,
	[IsSeenVehicleInd] [tinyint] NULL,
	[TerritoryCodeCommutingDestinationCode] [varchar](255) NULL,
	[IsRegisteredVehicleInd] [tinyint] NULL,
	[VehicleInspectionStatusCode] [varchar](255) NULL,
	[VehicleSalvageTitleNum] [varchar](20) NULL,
	[BusinessAnnualDistance] [varchar](255) NULL,
	[NumPassengers] [int] NULL,
	[ReasonLiabilityRefusedCode] [varchar](255) NULL,
	[ReasonLiabilityRefusedDesc] [varchar](255) NULL,
	[ResidualMarketFacilityTierCode] [varchar](255) NULL,
	[ResidualMarketFacilityTierDesc] [varchar](255) NULL,
	[ResidualMarketFacilityTierDate] [date] NULL,
	[BIPDSymbolCode] [varchar](255) NULL,
	[MedPayPIPLiabilitySymbolCode] [varchar](255) NULL,
	[DamageabilityDesc] [varchar](255) NULL,
	[VehicleInspectionStatusDesc] [varchar](255) NULL,
	[AlterationsAmt] [decimal](18, 10) NULL,
	[PremiumTermAmt] [decimal](18, 10) NULL,
	[PremiumNetChangeAmt] [decimal](18, 10) NULL,
	[PremiumFullWrittenAmt] [decimal](18, 10) NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_Vehicle] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[Vehicle] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_Vehicle]
GO
ALTER TABLE [Policy].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationCountrySK_Vehicle] FOREIGN KEY([RegistrationCountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[Vehicle] CHECK CONSTRAINT [FK_RegistrationCountrySK_Vehicle]
GO
ALTER TABLE [Policy].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationStateSK_Vehicle] FOREIGN KEY([RegistrationStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Policy].[Vehicle] CHECK CONSTRAINT [FK_RegistrationStateSK_Vehicle]
GO
ALTER TABLE [Policy].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Vehicle] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[Vehicle] CHECK CONSTRAINT [FK_SourceSystemSK_Vehicle]
GO
