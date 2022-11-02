USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimLocation]    Script Date: 02.11.2022 12:44:07 ******/
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
ALTER TABLE [Claim].[ClaimLocation]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypeSK_ClaimLocation] FOREIGN KEY([AddressTypeSK])
REFERENCES [TypeList].[AddressType] ([AddressTypeSK])
GO
ALTER TABLE [Claim].[ClaimLocation] CHECK CONSTRAINT [FK_AddressTypeSK_ClaimLocation]
GO
ALTER TABLE [Claim].[ClaimLocation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimLocation] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[ClaimLocation] CHECK CONSTRAINT [FK_ClaimSK_ClaimLocation]
GO
ALTER TABLE [Claim].[ClaimLocation]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_ClaimLocation] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Claim].[ClaimLocation] CHECK CONSTRAINT [FK_CountrySK_ClaimLocation]
GO
ALTER TABLE [Claim].[ClaimLocation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimLocation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[ClaimLocation] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimLocation]
GO
ALTER TABLE [Claim].[ClaimLocation]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_ClaimLocation] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Claim].[ClaimLocation] CHECK CONSTRAINT [FK_StateSK_ClaimLocation]
GO
