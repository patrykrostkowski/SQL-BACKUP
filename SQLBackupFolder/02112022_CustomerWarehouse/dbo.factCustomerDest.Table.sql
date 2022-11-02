USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[factCustomerDest]    Script Date: 02.11.2022 14:17:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factCustomerDest](
	[CustomerCode] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerAmount] [nvarchar](50) NULL,
	[SalesDate] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[StatesID] [int] NULL,
	[ProductID] [int] NULL,
	[SalesPersonID] [int] NULL
) ON [PRIMARY]
GO
