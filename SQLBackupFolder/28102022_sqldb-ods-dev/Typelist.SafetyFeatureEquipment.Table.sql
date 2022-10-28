USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[SafetyFeatureEquipment]    Script Date: 28.10.2022 13:37:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[SafetyFeatureEquipment](
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_SafetyFeatureEquipment]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_SafetyFeatureEquipment] ON [Typelist].[SafetyFeatureEquipment]
(
	[SourceSystemSK] ASC,
	[SafetyFeatureEquipmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[SafetyFeatureEquipment]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_SafetyFeatureEquipment] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[SafetyFeatureEquipment] NOCHECK CONSTRAINT [FK_SourceSystemSK_SafetyFeatureEquipment]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples anit-loc, anti-theft, passive restraints….' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'SafetyFeatureEquipment'
GO
