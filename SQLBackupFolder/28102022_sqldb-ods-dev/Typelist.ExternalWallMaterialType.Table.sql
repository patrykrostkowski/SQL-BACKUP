USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ExternalWallMaterialType]    Script Date: 28.10.2022 15:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ExternalWallMaterialType](
	[ExternalWallMaterialTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ExternalWallMaterialTypeCode] [varchar](20) NOT NULL,
	[ExternalWallMaterialTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ExternalWallMaterialType] PRIMARY KEY CLUSTERED 
(
	[ExternalWallMaterialTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ExternalWallMaterialType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ExternalWallMaterialType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ExternalWallMaterialType] NOCHECK CONSTRAINT [FK_SourceSystemSK_ExternalWallMaterialType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples, assigned, unassigned, pending' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ExternalWallMaterialType'
GO
