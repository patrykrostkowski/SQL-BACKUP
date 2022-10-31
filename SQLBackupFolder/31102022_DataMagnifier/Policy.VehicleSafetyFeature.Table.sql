USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[VehicleSafetyFeature]    Script Date: 31.10.2022 13:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Policy].[VehicleSafetyFeature]  WITH CHECK ADD  CONSTRAINT [FK_SafetyFeatureEquipmentSK_VehicleSafetyFeature] FOREIGN KEY([SafetyFeatureEquipmentSK])
REFERENCES [TypeList].[SafetyFeatureEquipment] ([SafetyFeatureEquipmentSK])
GO
ALTER TABLE [Policy].[VehicleSafetyFeature] CHECK CONSTRAINT [FK_SafetyFeatureEquipmentSK_VehicleSafetyFeature]
GO
ALTER TABLE [Policy].[VehicleSafetyFeature]  WITH CHECK ADD  CONSTRAINT [FK_VehicleSK_VehicleSafetyFeature] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
ALTER TABLE [Policy].[VehicleSafetyFeature] CHECK CONSTRAINT [FK_VehicleSK_VehicleSafetyFeature]
GO
