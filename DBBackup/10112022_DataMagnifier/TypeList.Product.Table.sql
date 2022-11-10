USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Product]    Script Date: 10.11.2022 14:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[Product](
	[ProductSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductGroupName] [varchar](50) NULL,
	[ProductSegmentName] [varchar](50) NULL,
	[BusinessUnitName] [varchar](50) NULL,
	[StrategicBusinessUnitName] [varchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Product]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Product]'))
ALTER TABLE [TypeList].[Product]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Product] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Product]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Product]'))
ALTER TABLE [TypeList].[Product] CHECK CONSTRAINT [FK_SourceSystemSK_Product]
GO
