USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[VehicleSafetyFeature]    Script Date: 12.11.2022 09:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[VehicleSafetyFeature]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[VehicleSafetyFeature](
	[VehicleSafetyFeatureSK] [int] IDENTITY(2,1) NOT NULL,
	[VehicleSK] [int] NOT NULL,
	[SafetyFeatureEquipmentSK] [int] NOT NULL,
	[EquipmentAvailabilityCode] [varchar](20) NULL,
	[EquipmentAvailabilityDesc] [varchar](255) NULL,
	[IsUserEquipmentAvailabilityInd] [tinyint] NULL,
	[IsEquippedInd] [tinyint] NULL,
 CONSTRAINT [PK_VehicleSafetyFeature] PRIMARY KEY NONCLUSTERED 
(
	[VehicleSafetyFeatureSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SafetyFeatureEquipmentSK_VehicleSafetyFeature]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleSafetyFeature]'))
ALTER TABLE [Policy].[VehicleSafetyFeature]  WITH CHECK ADD  CONSTRAINT [FK_SafetyFeatureEquipmentSK_VehicleSafetyFeature] FOREIGN KEY([SafetyFeatureEquipmentSK])
REFERENCES [TypeList].[SafetyFeatureEquipment] ([SafetyFeatureEquipmentSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SafetyFeatureEquipmentSK_VehicleSafetyFeature]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleSafetyFeature]'))
ALTER TABLE [Policy].[VehicleSafetyFeature] CHECK CONSTRAINT [FK_SafetyFeatureEquipmentSK_VehicleSafetyFeature]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_VehicleSK_VehicleSafetyFeature]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleSafetyFeature]'))
ALTER TABLE [Policy].[VehicleSafetyFeature]  WITH CHECK ADD  CONSTRAINT [FK_VehicleSK_VehicleSafetyFeature] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_VehicleSK_VehicleSafetyFeature]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleSafetyFeature]'))
ALTER TABLE [Policy].[VehicleSafetyFeature] CHECK CONSTRAINT [FK_VehicleSK_VehicleSafetyFeature]
GO
