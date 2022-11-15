﻿USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[factCustomer]    Script Date: 15.11.2022 16:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factCustomer](
	[CustomerCode] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerAmount] [int] NULL,
	[SalesDate] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[StatesID] [int] NULL,
	[ProductID] [int] NULL,
	[SalesPersonID] [int] NULL
) ON [PRIMARY]
GO
