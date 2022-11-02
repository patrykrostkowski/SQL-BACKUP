﻿USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[factCustomer]    Script Date: 02.11.2022 12:54:03 ******/
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
