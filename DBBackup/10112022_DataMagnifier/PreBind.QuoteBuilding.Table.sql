USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteBuilding]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteBuilding]') AND type in (N'U'))
BEGIN
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
	[YearBuilt] [varchar](255) NULL,
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuotePropertySK_QuoteBuilding]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteBuilding]'))
ALTER TABLE [PreBind].[QuoteBuilding]  WITH CHECK ADD  CONSTRAINT [FK_QuotePropertySK_QuoteBuilding] FOREIGN KEY([QuotePropertySK])
REFERENCES [PreBind].[QuoteProperty] ([QuotePropertySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuotePropertySK_QuoteBuilding]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteBuilding]'))
ALTER TABLE [PreBind].[QuoteBuilding] CHECK CONSTRAINT [FK_QuotePropertySK_QuoteBuilding]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteBuilding]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteBuilding]'))
ALTER TABLE [PreBind].[QuoteBuilding]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteBuilding] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteBuilding]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteBuilding]'))
ALTER TABLE [PreBind].[QuoteBuilding] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteBuilding]
GO
