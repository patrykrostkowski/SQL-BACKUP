USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[SafetyFeatureEquipment]    Script Date: 10.11.2022 14:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[SafetyFeatureEquipment]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[SafetyFeatureEquipment](
	[SafetyFeatureEquipmentSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SafetyFeatureEquipmentCode] [varchar](20) NULL,
	[SafetyFeatureEquipmentName] [varchar](50) NULL,
 CONSTRAINT [PK_SafetyFeatureEquipment] PRIMARY KEY CLUSTERED 
(
	[SafetyFeatureEquipmentSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_SafetyFeatureEquipment]') AND parent_object_id = OBJECT_ID(N'[TypeList].[SafetyFeatureEquipment]'))
ALTER TABLE [TypeList].[SafetyFeatureEquipment]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_SafetyFeatureEquipment] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_SafetyFeatureEquipment]') AND parent_object_id = OBJECT_ID(N'[TypeList].[SafetyFeatureEquipment]'))
ALTER TABLE [TypeList].[SafetyFeatureEquipment] CHECK CONSTRAINT [FK_SourceSystemSK_SafetyFeatureEquipment]
GO
