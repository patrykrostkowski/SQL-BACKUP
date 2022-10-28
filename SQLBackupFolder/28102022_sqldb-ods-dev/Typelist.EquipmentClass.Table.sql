USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[EquipmentClass]    Script Date: 28.10.2022 15:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[EquipmentClass](
	[EquipmentClassSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[EquipmentClassCode] [varchar](20) NOT NULL,
	[EquipmentClassName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentClass] PRIMARY KEY CLUSTERED 
(
	[EquipmentClassSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[EquipmentClass]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_EquipmentClass] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[EquipmentClass] NOCHECK CONSTRAINT [FK_SourceSystemSK_EquipmentClass]
GO
