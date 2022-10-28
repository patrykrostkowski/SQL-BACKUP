USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[Product]    Script Date: 28.10.2022 15:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[Product](
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
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Product]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Product] ON [Typelist].[Product]
(
	[SourceSystemSK] ASC,
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[Product]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Product] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[Product] NOCHECK CONSTRAINT [FK_SourceSystemSK_Product]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples property, casualty, package policy' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'Product'
GO
