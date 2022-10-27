USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[EquipmentType]    Script Date: 27.10.2022 12:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[EquipmentType](
	[EquipmentTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[EquipmentTypeCode] [varchar](20) NOT NULL,
	[EquipmentTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentType] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[EquipmentType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_EquipmentType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[EquipmentType] NOCHECK CONSTRAINT [FK_SourceSystemSK_EquipmentType]
GO
