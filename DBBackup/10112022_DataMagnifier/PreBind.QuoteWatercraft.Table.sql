USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteWatercraft]    Script Date: 10.11.2022 14:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteWatercraft]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuoteWatercraft]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteWatercraft]'))
ALTER TABLE [PreBind].[QuoteWatercraft]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteWatercraft] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuoteWatercraft]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteWatercraft]'))
ALTER TABLE [PreBind].[QuoteWatercraft] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteWatercraft]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteWatercraft]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteWatercraft]'))
ALTER TABLE [PreBind].[QuoteWatercraft]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteWatercraft] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteWatercraft]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteWatercraft]'))
ALTER TABLE [PreBind].[QuoteWatercraft] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteWatercraft]
GO
