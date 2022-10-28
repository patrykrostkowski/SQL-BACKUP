USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[ClaimLocation]    Script Date: 28.10.2022 12:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[ClaimLocation](
	[ClaimLocationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[AddressTypeSK] [int] NULL,
	[Line1Address] [varchar](50) NULL,
	[Line2Address] [varchar](50) NULL,
	[Line3Address] [varchar](50) NULL,
	[Line4Address] [varchar](50) NULL,
	[CityName] [varchar](50) NULL,
	[StateSK] [int] NULL,
	[PostalCode] [varchar](20) NULL,
	[CountrySK] [int] NULL,
	[IsPrimaryClaimAddressInd] [tinyint] NULL,
 CONSTRAINT [PK_ClaimLocation] PRIMARY KEY CLUSTERED 
(
	[ClaimLocationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimLocation]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimLocation] ON [Claim].[ClaimLocation]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[ClaimLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_AddressTypeSK_ClaimLocation] FOREIGN KEY([AddressTypeSK])
REFERENCES [Typelist].[AddressType] ([AddressTypeSK])
GO
ALTER TABLE [Claim].[ClaimLocation] NOCHECK CONSTRAINT [FK_AddressTypeSK_ClaimLocation]
GO
ALTER TABLE [Claim].[ClaimLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimLocation] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[ClaimLocation] NOCHECK CONSTRAINT [FK_ClaimSK_ClaimLocation]
GO
ALTER TABLE [Claim].[ClaimLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_CountrySK_ClaimLocation] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Claim].[ClaimLocation] NOCHECK CONSTRAINT [FK_CountrySK_ClaimLocation]
GO
ALTER TABLE [Claim].[ClaimLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimLocation] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[ClaimLocation] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimLocation]
GO
ALTER TABLE [Claim].[ClaimLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_ClaimLocation] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Claim].[ClaimLocation] NOCHECK CONSTRAINT [FK_StateSK_ClaimLocation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the claim  accident location/address' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'ClaimLocation'
GO
