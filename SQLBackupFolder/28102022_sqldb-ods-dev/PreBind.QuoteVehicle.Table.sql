USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteVehicle]    Script Date: 28.10.2022 15:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteVehicle](
	[QuoteVehicleSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteInsurableObjectSK] [int] NOT NULL,
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
 CONSTRAINT [PK_QuoteVehicle] PRIMARY KEY CLUSTERED 
(
	[QuoteVehicleSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteVehicle]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteVehicle] ON [PreBind].[QuoteVehicle]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteVehicle]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteVehicle] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteVehicle] NOCHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteVehicle]
GO
ALTER TABLE [PreBind].[QuoteVehicle]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteVehicle] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteVehicle] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteVehicle]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This concept represents the features of most all types of vehicles.  It is generally defined to mean a device capable of transporting people or property which is self-propelled by mechanical or electrical power.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteVehicle'
GO
