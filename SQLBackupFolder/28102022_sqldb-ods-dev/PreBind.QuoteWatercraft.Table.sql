USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteWatercraft]    Script Date: 28.10.2022 15:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteWatercraft](
	[QuoteWatercraftSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteInsurableObjectSK] [int] NOT NULL,
	[SequenceNum] [varchar](20) NULL,
	[WaterUnitTypeCode] [varchar](255) NULL,
	[EquipmentTypeCode] [varchar](255) NULL,
	[EquipmentTypeDesc] [varchar](255) NULL,
	[FuelTypeCode] [varchar](255) NULL,
	[FuelTypeDesc] [varchar](255) NULL,
	[CertifyingEntityDesc] [varchar](255) NULL,
	[WeightCapacityNum] [varchar](255) NULL,
	[NumTrailerAxles] [int] NULL,
	[IsMinPremiumInd] [tinyint] NULL,
	[NumUnits] [int] NULL,
	[PurchaseDate] [date] NULL,
	[WatersNavigatedCode] [varchar](255) NULL,
	[CostNewAmt] [decimal](18, 10) NULL,
	[PurchasePriceAmt] [decimal](18, 10) NULL,
	[PresentValueAmt] [decimal](18, 10) NULL,
	[LengthNum] [varchar](255) NULL,
	[Speednum] [varchar](255) NULL,
	[HorsepowerNum] [varchar](255) NULL,
	[HullDesignTypeCode] [varchar](255) NULL,
	[HullMaterialTypeCode] [varchar](255) NULL,
	[NumOperatorsUnder21Yrs] [int] NULL,
	[RegistrationNum] [varchar](255) NULL,
	[BedsNum] [int] NULL,
	[FuelTankCode] [varchar](255) NULL,
	[PropulsionTypeCode] [varchar](255) NULL,
	[IsPrincipalOperatorInd] [tinyint] NULL,
	[IsMinPremInd] [tinyint] NULL,
	[PrimarySeasonCode] [varchar](255) NULL,
	[SecondarySeasonCode] [varchar](255) NULL,
	[SurveyDate] [date] NULL,
	[ItemTypeCode] [varchar](255) NULL,
	[ManufacturerName] [varchar](255) NULL,
	[ManufactureMethodCode] [varchar](255) NULL,
	[CertifyingEntityCode] [varchar](255) NULL,
	[ModelName] [varchar](255) NULL,
	[SerialIdNum] [varchar](255) NULL,
	[ModelYear] [varchar](255) NULL,
	[ItemDesc] [varchar](255) NULL,
	[ManufacturerCode] [varchar](255) NULL,
	[ModelCode] [varchar](255) NULL,
	[BodyTypeCode] [varchar](255) NULL,
	[EngineSerialNum] [varchar](255) NULL,
	[TransmissionSerialNum] [varchar](255) NULL,
	[IsLeasedInd] [tinyint] NULL,
	[BrandName] [varchar](255) NULL,
	[WaterUnitTypeDesc] [varchar](255) NULL,
	[WatersNavigatedDesc] [varchar](255) NULL,
	[HullDesignTypeDesc] [varchar](255) NULL,
	[HullMaterialTypeDesc] [varchar](255) NULL,
	[FuelTankDesc] [varchar](255) NULL,
	[PropulsionTypeDesc] [varchar](255) NULL,
	[ItemTypeDesc] [varchar](255) NULL,
	[ManufactureMethodDesc] [varchar](255) NULL,
	[BodyTypeDesc] [varchar](255) NULL,
	[LocationSK] [int] NULL,
	[SailboatLengthCode] [varchar](255) NULL,
	[MotorboatHPCode] [varchar](255) NULL,
 CONSTRAINT [PK_QuoteWatercraft] PRIMARY KEY CLUSTERED 
(
	[QuoteWatercraftSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteWatercraft]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteWatercraft] ON [PreBind].[QuoteWatercraft]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteWatercraft]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteWatercraft] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteWatercraft] NOCHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteWatercraft]
GO
ALTER TABLE [PreBind].[QuoteWatercraft]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteWatercraft] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteWatercraft] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteWatercraft]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This concept represents the features of most watercraft  including ships, boats, hovercraft and submarines' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteWatercraft'
GO
