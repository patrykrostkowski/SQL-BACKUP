USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[SafetyFeatureEquipment]    Script Date: 20.11.2022 14:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[SafetyFeatureEquipment]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_SafetyFeatureEquipment] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[SafetyFeatureEquipment] CHECK CONSTRAINT [FK_SourceSystemSK_SafetyFeatureEquipment]
GO
