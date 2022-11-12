USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[SQlprofilingdata]    Script Date: 12.11.2022 10:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQlprofilingdata]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SQlprofilingdata](
	[Name] [varchar](50) NULL,
	[Email Adress] [varchar](50) NULL,
	[D O B] [varchar](50) NULL,
	[Salary] [varchar](50) NULL,
	[CountryCode] [varchar](50) NULL,
	[EMP Code] [varchar](50) NULL,
	[Dept Code] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[CountryTaxcode] [varchar](50) NULL,
	[TaxPercentage] [varchar](50) NULL,
	[Pan card] [varchar](50) NULL
) ON [PRIMARY]
END
GO
