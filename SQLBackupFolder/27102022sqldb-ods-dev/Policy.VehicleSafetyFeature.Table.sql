USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[VehicleSafetyFeature]    Script Date: 27.10.2022 12:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[VehicleSafetyFeature](
	[VehicleSafetyFeatureSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[VehicleSK] [int] NOT NULL,
	[SafetyFeatureEquipmentSK] [int] NOT NULL,
	[EquipmentAvailabilityCode] [varchar](20) NULL,
	[EquipmentAvailabilityDesc] [varchar](255) NULL,
	[IsUserEquipmentAvailabilityInd] [tinyint] NULL,
	[IsEquippedInd] [tinyint] NULL,
 CONSTRAINT [PK_VehicleSafetyFeature] PRIMARY KEY CLUSTERED 
(
	[VehicleSafetyFeatureSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_VehicleSafetyFeature]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_VehicleSafetyFeature] ON [Policy].[VehicleSafetyFeature]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[VehicleSafetyFeature]  WITH NOCHECK ADD  CONSTRAINT [FK_SafetyFeatureEquipmentSK_VehicleSafetyFeature] FOREIGN KEY([SafetyFeatureEquipmentSK])
REFERENCES [Typelist].[SafetyFeatureEquipment] ([SafetyFeatureEquipmentSK])
GO
ALTER TABLE [Policy].[VehicleSafetyFeature] NOCHECK CONSTRAINT [FK_SafetyFeatureEquipmentSK_VehicleSafetyFeature]
GO
ALTER TABLE [Policy].[VehicleSafetyFeature]  WITH NOCHECK ADD  CONSTRAINT [FK_VehicleSK_VehicleSafetyFeature] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
ALTER TABLE [Policy].[VehicleSafetyFeature] NOCHECK CONSTRAINT [FK_VehicleSK_VehicleSafetyFeature]
GO
ALTER TABLE [Policy].[VehicleSafetyFeature]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem944] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[VehicleSafetyFeature] NOCHECK CONSTRAINT [RefSourceSystem944]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies a vehicle sasfety features for determining premium. Includes anit theft , seat belts, daytime running lightd, anti lock brakes and other safety equipment' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'VehicleSafetyFeature'
GO
