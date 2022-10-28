USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[ContactPointAddress]    Script Date: 28.10.2022 11:09:48 ******/
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
 CONSTRAINT [PK_ContactPointAddress] PRIMARY KEY CLUSTERED 
(
	[ContactPointAddressSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ContactPointAddress]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ContactPointAddress] ON [Party].[ContactPointAddress]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Party].[ContactPointAddress]  WITH NOCHECK ADD  CONSTRAINT [FK_AddressTypeSK_ContactPointAddress] FOREIGN KEY([AddressTypeSK])
REFERENCES [Typelist].[AddressType] ([AddressTypeSK])
GO
ALTER TABLE [Party].[ContactPointAddress] NOCHECK CONSTRAINT [FK_AddressTypeSK_ContactPointAddress]
GO
ALTER TABLE [Party].[ContactPointAddress]  WITH NOCHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointAddress] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
ALTER TABLE [Party].[ContactPointAddress] NOCHECK CONSTRAINT [FK_ContactPointSK_ContactPointAddress]
GO
ALTER TABLE [Party].[ContactPointAddress]  WITH NOCHECK ADD  CONSTRAINT [FK_CountrySK_ContactPointAddress] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Party].[ContactPointAddress] NOCHECK CONSTRAINT [FK_CountrySK_ContactPointAddress]
GO
ALTER TABLE [Party].[ContactPointAddress]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPointAddress] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[ContactPointAddress] NOCHECK CONSTRAINT [FK_SourceSystemSK_ContactPointAddress]
GO
ALTER TABLE [Party].[ContactPointAddress]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_ContactPointAddress] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Party].[ContactPointAddress] NOCHECK CONSTRAINT [FK_StateSK_ContactPointAddress]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This contact point represents one or many  mailing address as a means of contact.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'ContactPointAddress'
GO
