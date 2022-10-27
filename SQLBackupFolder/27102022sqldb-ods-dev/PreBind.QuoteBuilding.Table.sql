﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteBuilding]    Script Date: 27.10.2022 12:27:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteBuilding](
	[QuoteBuildingSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuotePropertySK] [int] NOT NULL,
	[SequenceNum] [int] NULL,
	[YearBuilt] [varchar](4) NULL,
	[LandArea] [varchar](255) NULL,
	[NumStories] [int] NULL,
	[NumDivingBoards] [int] NULL,
	[NumSwimmingPools] [int] NULL,
	[NumApartments] [int] NULL,
	[NumATV] [varchar](255) NULL,
	[OccupancyTypeCode] [varchar](20) NULL,
	[OccupancyTypeDesc] [varchar](255) NULL,
	[RealEstateTypeCode] [varchar](20) NULL,
	[RealEstateTypeDesc] [varchar](255) NULL,
	[ProtectionClassCode] [varchar](20) NULL,
	[ProtectionClassDesc] [varchar](255) NULL,
	[WiringTypeCode] [varchar](20) NULL,
	[WiringTypeDesc] [varchar](255) NULL,
	[WiringInspectedDate] [date] NULL,
	[AreaTypeSurroundingsCode] [varchar](20) NULL,
	[AreaTypeSurroundingsDesc] [varchar](255) NULL,
	[PlumbingConditionCode] [varchar](20) NULL,
	[PlumbingConditionDesc] [varchar](255) NULL,
	[RoofConditionCode] [varchar](20) NULL,
	[RoofConditionDesc] [varchar](255) NULL,
	[ProtectionDeviceBurglarCode] [varchar](20) NULL,
	[ProtectionDeviceBurglarDesc] [varchar](255) NULL,
	[ProtectionDeviceFireCode] [varchar](20) NULL,
	[ProtectionDeviceFireDesc] [varchar](255) NULL,
	[RoofMaterialCode] [varchar](20) NULL,
	[RoofMaterialDesc] [varchar](255) NULL,
	[CoInsurancePct] [decimal](8, 2) NULL,
 CONSTRAINT [PK_QuoteBuilding] PRIMARY KEY CLUSTERED 
(
	[QuoteBuildingSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteBuilding]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteBuilding] ON [PreBind].[QuoteBuilding]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteBuilding]  WITH NOCHECK ADD  CONSTRAINT [FK_QuotePropertySK_QuoteBuilding] FOREIGN KEY([QuotePropertySK])
REFERENCES [PreBind].[QuoteProperty] ([QuotePropertySK])
GO
ALTER TABLE [PreBind].[QuoteBuilding] NOCHECK CONSTRAINT [FK_QuotePropertySK_QuoteBuilding]
GO
ALTER TABLE [PreBind].[QuoteBuilding]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteBuilding] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteBuilding] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteBuilding]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This concept gives particular features of a building.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteBuilding'
GO
