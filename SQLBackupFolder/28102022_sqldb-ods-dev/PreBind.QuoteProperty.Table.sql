USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteProperty]    Script Date: 28.10.2022 15:05:10 ******/
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
	[StateSK] [int] NOT NULL,
	[TerritoryName] [varchar](50) NULL,
	[TaxTerritoryName] [varchar](50) NULL,
	[TownName] [varchar](50) NULL,
	[CountyName] [varchar](50) NULL,
	[CountrySK] [int] NOT NULL,
	[PostalCode] [varchar](20) NULL,
	[IsPrimaryInd] [tinyint] NOT NULL,
	[IsExcludedInd] [tinyint] NULL,
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteProperty]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteProperty] ON [PreBind].[QuoteProperty]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteProperty] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteProperty] NOCHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteProperty]
GO
ALTER TABLE [PreBind].[QuoteProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteProperty] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteProperty] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteProperty]
GO
ALTER TABLE [PreBind].[QuoteProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_QuoteProperty] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteProperty] NOCHECK CONSTRAINT [FK_StateSK_QuoteProperty]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is a supertype of an insurable property further defined by its many subtypes.  Examples inlcude dwelling, building' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteProperty'
GO
