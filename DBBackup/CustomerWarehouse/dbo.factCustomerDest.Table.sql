USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[factCustomerDest]    Script Date: 14.11.2022 12:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factCustomerDest]') AND type in (N'U'))
BEGIN
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
END
GO
