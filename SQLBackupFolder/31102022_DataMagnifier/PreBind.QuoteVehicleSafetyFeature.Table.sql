USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteVehicleSafetyFeature]    Script Date: 31.10.2022 11:42:55 ******/
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
 CONSTRAINT [PK_QuoteVehicleSafetyFeature] PRIMARY KEY NONCLUSTERED 
(
	[QuoteVehicleSafetyFeatureSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature]  WITH CHECK ADD  CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleSafetyFeature] FOREIGN KEY([QuoteVehicleSK])
REFERENCES [PreBind].[QuoteVehicle] ([QuoteVehicleSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature] CHECK CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleSafetyFeature]
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature]  WITH CHECK ADD  CONSTRAINT [FK_SafetyFeatureEquipmentSK_QuoteVehicleSafetyFeature] FOREIGN KEY([SafetyFeatureEquipmentSK])
REFERENCES [TypeList].[SafetyFeatureEquipment] ([SafetyFeatureEquipmentSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature] CHECK CONSTRAINT [FK_SafetyFeatureEquipmentSK_QuoteVehicleSafetyFeature]
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteVehicleSafetyFeature] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteVehicleSafetyFeature]
GO
