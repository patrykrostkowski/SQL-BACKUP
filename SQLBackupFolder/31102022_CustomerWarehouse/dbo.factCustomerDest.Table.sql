USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[factCustomerDest]    Script Date: 31.10.2022 12:30:45 ******/
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
