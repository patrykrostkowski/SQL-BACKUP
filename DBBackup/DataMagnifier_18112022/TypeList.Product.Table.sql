USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Product]    Script Date: 18.11.2022 16:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[Product]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Product] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[Product] CHECK CONSTRAINT [FK_SourceSystemSK_Product]
GO
