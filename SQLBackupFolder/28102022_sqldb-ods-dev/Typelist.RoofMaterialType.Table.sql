USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[RoofMaterialType]    Script Date: 28.10.2022 15:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[RoofMaterialType](
	[RoofMaterialTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[RoofMaterialTypeCode] [varchar](20) NOT NULL,
	[RoofMaterialTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RoofMaterialType] PRIMARY KEY CLUSTERED 
(
	[RoofMaterialTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[RoofMaterialType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_RoofMaterialType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[RoofMaterialType] NOCHECK CONSTRAINT [FK_SourceSystemSK_RoofMaterialType]
GO
