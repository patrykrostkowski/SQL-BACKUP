USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteVehicleSafetyFeature]    Script Date: 10.11.2022 14:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteVehicleSafetyFeature]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteVehicleSK_QuoteVehicleSafetyFeature]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteVehicleSafetyFeature]'))
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature]  WITH CHECK ADD  CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleSafetyFeature] FOREIGN KEY([QuoteVehicleSK])
REFERENCES [PreBind].[QuoteVehicle] ([QuoteVehicleSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteVehicleSK_QuoteVehicleSafetyFeature]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteVehicleSafetyFeature]'))
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature] CHECK CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleSafetyFeature]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SafetyFeatureEquipmentSK_QuoteVehicleSafetyFeature]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteVehicleSafetyFeature]'))
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature]  WITH CHECK ADD  CONSTRAINT [FK_SafetyFeatureEquipmentSK_QuoteVehicleSafetyFeature] FOREIGN KEY([SafetyFeatureEquipmentSK])
REFERENCES [TypeList].[SafetyFeatureEquipment] ([SafetyFeatureEquipmentSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SafetyFeatureEquipmentSK_QuoteVehicleSafetyFeature]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteVehicleSafetyFeature]'))
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature] CHECK CONSTRAINT [FK_SafetyFeatureEquipmentSK_QuoteVehicleSafetyFeature]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteVehicleSafetyFeature]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteVehicleSafetyFeature]'))
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteVehicleSafetyFeature] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteVehicleSafetyFeature]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteVehicleSafetyFeature]'))
ALTER TABLE [PreBind].[QuoteVehicleSafetyFeature] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteVehicleSafetyFeature]
GO
