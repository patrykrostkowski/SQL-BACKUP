USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[WatercraftLocation]    Script Date: 10.11.2022 14:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[WatercraftLocation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[WatercraftLocation](
	[WatercraftLocationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[WatercraftSK] [int] NOT NULL,
	[SlipNum] [varchar](20) NULL,
	[AddressLine1] [varchar](128) NULL,
	[AddressLine2] [varchar](128) NULL,
	[AddressLine3] [varchar](50) NULL,
	[AddressLine4] [varchar](100) NULL,
	[CityName] [varchar](128) NULL,
	[PostalCode] [varchar](100) NULL,
	[StateSK] [int] NULL,
	[TerritoryCode] [varchar](20) NULL,
	[TerritoryDesc] [varchar](50) NULL,
	[TaxTerritoryCode] [varchar](20) NULL,
	[TaxTerritoryDesc] [varchar](50) NULL,
	[TownCode] [varchar](20) NULL,
	[TownDesc] [varchar](50) NULL,
	[CountyCode] [varchar](20) NULL,
	[CountyDesc] [varchar](50) NULL,
	[CountrySK] [int] NOT NULL,
	[ConstTypeCode] [varchar](3) NULL,
	[ConstTypeDesc] [varchar](50) NULL,
	[YearBuilt] [varchar](4) NULL,
	[ConstYear] [varchar](4) NULL,
	[DisttoWaterCode] [varchar](20) NULL,
	[DistToWaterDesc] [varchar](50) NULL,
	[ConstSymbolCode] [varchar](20) NULL,
	[ConstSymbolDesc] [varchar](50) NULL,
	[ClassCode] [varchar](20) NULL,
	[ClassDesc] [varchar](256) NULL,
	[LocationDesc] [varchar](255) NULL,
	[CityLimitCode] [varchar](20) NULL,
	[UndwrReferenceCode] [varchar](30) NULL,
	[MilesFireStation] [decimal](19, 4) NULL,
	[PropAppraisalDate] [datetime] NULL,
	[ComplexName] [varchar](50) NULL,
	[ProbableMaximumLossAmt] [decimal](19, 4) NULL,
	[RegisteredStateCode] [varchar](20) NULL,
	[FireDistrName] [varchar](100) NULL,
	[LatitudeId] [decimal](9, 6) NULL,
	[LongitudeId] [decimal](9, 6) NULL,
 CONSTRAINT [PK_WatercraftLocation] PRIMARY KEY CLUSTERED 
(
	[WatercraftLocationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_WatercraftLocation]') AND parent_object_id = OBJECT_ID(N'[Policy].[WatercraftLocation]'))
ALTER TABLE [Policy].[WatercraftLocation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_WatercraftLocation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_WatercraftLocation]') AND parent_object_id = OBJECT_ID(N'[Policy].[WatercraftLocation]'))
ALTER TABLE [Policy].[WatercraftLocation] CHECK CONSTRAINT [FK_SourceSystemSK_WatercraftLocation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_WatercraftSK_WatercraftLocation]') AND parent_object_id = OBJECT_ID(N'[Policy].[WatercraftLocation]'))
ALTER TABLE [Policy].[WatercraftLocation]  WITH CHECK ADD  CONSTRAINT [FK_WatercraftSK_WatercraftLocation] FOREIGN KEY([WatercraftSK])
REFERENCES [Policy].[Watercraft] ([WatercraftSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_WatercraftSK_WatercraftLocation]') AND parent_object_id = OBJECT_ID(N'[Policy].[WatercraftLocation]'))
ALTER TABLE [Policy].[WatercraftLocation] CHECK CONSTRAINT [FK_WatercraftSK_WatercraftLocation]
GO
