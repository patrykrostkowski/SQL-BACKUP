USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEventWatercraft]    Script Date: 31.10.2022 12:40:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[LossEventWatercraft](
	[LossEventWatercraftSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[LossEventSK] [int] NOT NULL,
	[VIN] [varchar](40) NULL,
	[ModelDesc] [varchar](40) NULL,
	[MakeDesc] [varchar](40) NULL,
	[YearNum] [int] NULL,
	[EquipmentTypeSK] [int] NULL,
	[EquipmentClassSK] [int] NULL,
	[VesselTypeSK] [int] NULL,
	[StateSK] [int] NULL,
	[CountrySK] [int] NULL,
	[MooringLocationLine2Address] [varchar](60) NULL,
	[MooringLocationLine3Address] [varchar](60) NULL,
	[MooringLocationLine4Address] [varchar](60) NULL,
	[MooringLocationCityName] [varchar](60) NULL,
	[MooringLocationStateId] [int] NULL,
	[MooringLocationCountryId] [int] NULL,
	[MooringLocationPostalCode] [varchar](60) NULL,
 CONSTRAINT [PK_LossEventWatercraft] PRIMARY KEY CLUSTERED 
(
	[LossEventWatercraftSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEventWatercraft]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventWatercraft] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventWatercraft] CHECK CONSTRAINT [FK_LossEventSK_LossEventWatercraft]
GO
ALTER TABLE [Claim].[LossEventWatercraft]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventWatercraft] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventWatercraft] CHECK CONSTRAINT [FK_SourceSystemSK_LossEventWatercraft]
GO
