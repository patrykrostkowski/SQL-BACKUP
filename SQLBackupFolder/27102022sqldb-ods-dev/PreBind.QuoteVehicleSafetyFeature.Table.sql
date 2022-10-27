USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteVehicleSafetyFeature]    Script Date: 27.10.2022 12:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteVehicleSafetyFeature](
	[QuoteVehicleSafetyFeatureSK] [int] IDENTITY(2,1) NOT NULL,
	[QuoteVehicleSK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[SafetyFeatureEquipmentSK] [int] NOT NULL,
	[EquipmentAvailabilityCode] [varchar](20) NULL,
	[EquipmentAvailabilityDesc] [varchar](255) NULL,
	[IsUserEquipmentAvailabilityInd] [tinyint] NULL,
	[IsEquippedInd] [tinyint] NULL,
 CONSTRAINT [PK_QuoteVehicleSafetyFeature] PRIMARY KEY CLUSTERED 
(
	[QuoteVehicleSafetyFeatureSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteVehicleSafetyFeature]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteVehicleSafetyFeature] ON [PreBind].[QuoteVehicleSafetyFeature]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleSafetyFeature] FOREIGN KEY([QuoteVehicleSK])
REFERENCES [PreBind].[QuoteVehicle] ([QuoteVehicleSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature] NOCHECK CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleSafetyFeature]
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature]  WITH NOCHECK ADD  CONSTRAINT [FK_SafetyFeatureEquipmentSK_QuoteVehicleSafetyFeature] FOREIGN KEY([SafetyFeatureEquipmentSK])
REFERENCES [Typelist].[SafetyFeatureEquipment] ([SafetyFeatureEquipmentSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature] NOCHECK CONSTRAINT [FK_SafetyFeatureEquipmentSK_QuoteVehicleSafetyFeature]
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteVehicleSafetyFeature] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteVehicleSafetyFeature]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies a vehicle sasfety features for determining premium. Includes anit theft , seat belts, daytime running lightd, anti lock brakes and other safety equipment' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteVehicleSafetyFeature'
GO
