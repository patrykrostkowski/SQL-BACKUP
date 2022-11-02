USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[Building]    Script Date: 02.11.2022 14:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[Building](
	[BuildingSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PropertySK] [int] NOT NULL,
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
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[BuildingSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[Building]  WITH CHECK ADD  CONSTRAINT [FK_PropertySK_Building] FOREIGN KEY([PropertySK])
REFERENCES [Policy].[Property] ([PropertySK])
GO
ALTER TABLE [Policy].[Building] CHECK CONSTRAINT [FK_PropertySK_Building]
GO
ALTER TABLE [Policy].[Building]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Building] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[Building] CHECK CONSTRAINT [FK_SourceSystemSK_Building]
GO
