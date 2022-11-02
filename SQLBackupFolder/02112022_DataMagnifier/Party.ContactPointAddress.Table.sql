USE [DataMagnifier]
GO
/****** Object:  Table [Party].[ContactPointAddress]    Script Date: 02.11.2022 14:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[ContactPointAddress](
	[ContactPointAddressSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
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
 CONSTRAINT [PK_ContactPointAddress] PRIMARY KEY CLUSTERED 
(
	[ContactPointAddressSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[ContactPointAddress]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypeSK_ContactPointAddress] FOREIGN KEY([AddressTypeSK])
REFERENCES [TypeList].[AddressType] ([AddressTypeSK])
GO
ALTER TABLE [Party].[ContactPointAddress] CHECK CONSTRAINT [FK_AddressTypeSK_ContactPointAddress]
GO
ALTER TABLE [Party].[ContactPointAddress]  WITH CHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointAddress] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
ALTER TABLE [Party].[ContactPointAddress] CHECK CONSTRAINT [FK_ContactPointSK_ContactPointAddress]
GO
ALTER TABLE [Party].[ContactPointAddress]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_ContactPointAddress] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Party].[ContactPointAddress] CHECK CONSTRAINT [FK_CountrySK_ContactPointAddress]
GO
ALTER TABLE [Party].[ContactPointAddress]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPointAddress] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[ContactPointAddress] CHECK CONSTRAINT [FK_SourceSystemSK_ContactPointAddress]
GO
ALTER TABLE [Party].[ContactPointAddress]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_ContactPointAddress] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Party].[ContactPointAddress] CHECK CONSTRAINT [FK_StateSK_ContactPointAddress]
GO
