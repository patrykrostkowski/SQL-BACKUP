USE [Test]
GO
/****** Object:  Table [dbo].[output_table_new]    Script Date: 12.11.2022 09:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[output_table_new]') AND type in (N'U'))
BEGIN
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
END
GO
