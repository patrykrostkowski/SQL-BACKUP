USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteProperty]    Script Date: 31.10.2022 12:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteProperty](
	[QuotePropertySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteInsurableObjectSK] [int] NOT NULL,
	[SequenceNum] [int] NULL,
	[AddressLine1] [varchar](50) NOT NULL,
	[AddressLine2] [varchar](50) NULL,
	[AddressLine3] [varchar](50) NULL,
	[CityName] [varchar](25) NOT NULL,
	[CountyName] [varchar](20) NULL,
	[StateSK] [int] NOT NULL,
	[TerritoryCode] [varchar](255) NULL,
	[TerritoryDesc] [varchar](50) NULL,
	[TaxTerritoryCode] [varchar](20) NULL,
	[TaxTerritoryDesc] [varchar](50) NULL,
	[TownCode] [varchar](20) NULL,
	[TownDesc] [varchar](50) NULL,
	[CountyCode] [varchar](20) NULL,
	[CountyDesc] [varchar](50) NULL,
	[CountrySK] [int] NOT NULL,
	[PostalCode] [varchar](20) NULL,
	[IsPrimaryInd] [tinyint] NOT NULL,
	[IsExcludedInd] [varchar](255) NULL,
	[ItemValuationTypeCode] [varchar](255) NULL,
	[ItemValuationAmt] [decimal](18, 10) NULL,
	[PropertyClassCode] [varchar](255) NULL,
	[PropertyClassDesc] [varchar](255) NULL,
	[PropertySubClassCode] [varchar](255) NULL,
	[ProtectionClassCode] [varchar](20) NULL,
	[ProtectionClassDesc] [varchar](255) NULL,
	[ProtectionDeviceSprinklerCode] [varchar](20) NULL,
	[ProtectionDeviceSprinklerDesc] [varchar](255) NULL,
	[ConstTypeCode] [varchar](20) NULL,
	[ConstTypeDesc] [varchar](50) NULL,
	[ConstSymbolCode] [varchar](20) NULL,
	[ConstSymbolDesc] [varchar](50) NULL,
	[EarthquakeCode] [varchar](20) NULL,
	[EarthquakeDesc] [varchar](50) NULL,
	[DistancetoWaterCode] [varchar](20) NULL,
	[DistancetoWaterDesc] [varchar](50) NULL,
	[ValuationTypeCode] [varchar](20) NULL,
	[ValuationTypeDesc] [varchar](255) NULL,
	[IsMinimumPremiumInd] [tinyint] NULL,
	[ManufacturerCode] [varchar](20) NULL,
	[ManufacturerDesc] [varchar](255) NULL,
	[ManufactureMethodCode] [varchar](255) NULL,
	[ManufactureMethodDesc] [varchar](255) NULL,
	[ModelCode] [varchar](20) NULL,
	[ModelDesc] [varchar](255) NULL,
	[CertifyingEntityCode] [varchar](255) NULL,
	[SerialIdNumber] [varchar](255) NULL,
	[ConstYear] [varchar](4) NULL,
	[MilesFireStation] [decimal](19, 4) NULL,
	[NumOfBldgs] [int] NULL,
	[LatitudeId] [decimal](9, 6) NULL,
	[LongitudeId] [decimal](9, 6) NULL,
 CONSTRAINT [PK_QuoteProperty] PRIMARY KEY CLUSTERED 
(
	[QuotePropertySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteProperty]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteProperty] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteProperty] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteProperty]
GO
ALTER TABLE [PreBind].[QuoteProperty]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteProperty] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteProperty] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteProperty]
GO
ALTER TABLE [PreBind].[QuoteProperty]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_QuoteProperty] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteProperty] CHECK CONSTRAINT [FK_StateSK_QuoteProperty]
GO
