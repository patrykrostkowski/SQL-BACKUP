USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[ContactPointAddress_mntest]    Script Date: 27.10.2022 12:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[ContactPointAddress_mntest](
	[ContactPointAddressSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ContactPointSK] [int] NOT NULL,
	[AddressTypeSK] [int] NOT NULL,
	[AddressLine1] [varchar](50) NOT NULL,
	[AddressLine2] [varchar](50) NULL,
	[AddressLine3] [varchar](50) NULL,
	[AddressLine4] [varchar](50) NULL,
	[CityName] [varchar](25) NOT NULL,
	[CountyName] [varchar](25) NULL,
	[StateSK] [int] NULL,
	[CountrySK] [int] NULL,
	[PostalCode] [varchar](20) NULL,
	[ContactName] [varchar](255) NULL,
	[IsPrimaryInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_ContactPointAddress_mntest] PRIMARY KEY CLUSTERED 
(
	[ContactPointAddressSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
