USE [Test]
GO
/****** Object:  Table [dbo].[output_table_new]    Script Date: 08.11.2022 08:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[output_table_new](
	[CustomerCode] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerAmount] [nvarchar](50) NULL,
	[SalesDate] [nvarchar](50) NULL,
	[CountryName] [nvarchar](50) NULL,
	[StatesName] [nvarchar](50) NULL,
	[ProductName] [nvarchar](50) NULL,
	[SalesPersonName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
