USE [DataMagnifier]
GO
/****** Object:  Table [Party].[ContactPointAddress]    Script Date: 10.11.2022 14:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[ContactPointAddress]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_AddressTypeSK_ContactPointAddress]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointAddress]'))
ALTER TABLE [Party].[ContactPointAddress]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypeSK_ContactPointAddress] FOREIGN KEY([AddressTypeSK])
REFERENCES [TypeList].[AddressType] ([AddressTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_AddressTypeSK_ContactPointAddress]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointAddress]'))
ALTER TABLE [Party].[ContactPointAddress] CHECK CONSTRAINT [FK_AddressTypeSK_ContactPointAddress]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_ContactPointSK_ContactPointAddress]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointAddress]'))
ALTER TABLE [Party].[ContactPointAddress]  WITH CHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointAddress] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_ContactPointSK_ContactPointAddress]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointAddress]'))
ALTER TABLE [Party].[ContactPointAddress] CHECK CONSTRAINT [FK_ContactPointSK_ContactPointAddress]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_CountrySK_ContactPointAddress]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointAddress]'))
ALTER TABLE [Party].[ContactPointAddress]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_ContactPointAddress] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_CountrySK_ContactPointAddress]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointAddress]'))
ALTER TABLE [Party].[ContactPointAddress] CHECK CONSTRAINT [FK_CountrySK_ContactPointAddress]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_ContactPointAddress]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointAddress]'))
ALTER TABLE [Party].[ContactPointAddress]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPointAddress] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_ContactPointAddress]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointAddress]'))
ALTER TABLE [Party].[ContactPointAddress] CHECK CONSTRAINT [FK_SourceSystemSK_ContactPointAddress]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_StateSK_ContactPointAddress]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointAddress]'))
ALTER TABLE [Party].[ContactPointAddress]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_ContactPointAddress] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_StateSK_ContactPointAddress]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointAddress]'))
ALTER TABLE [Party].[ContactPointAddress] CHECK CONSTRAINT [FK_StateSK_ContactPointAddress]
GO
