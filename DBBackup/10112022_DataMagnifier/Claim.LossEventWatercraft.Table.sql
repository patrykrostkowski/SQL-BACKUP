USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEventWatercraft]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[LossEventWatercraft]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSK_LossEventWatercraft]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventWatercraft]'))
ALTER TABLE [Claim].[LossEventWatercraft]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventWatercraft] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSK_LossEventWatercraft]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventWatercraft]'))
ALTER TABLE [Claim].[LossEventWatercraft] CHECK CONSTRAINT [FK_LossEventSK_LossEventWatercraft]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_LossEventWatercraft]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventWatercraft]'))
ALTER TABLE [Claim].[LossEventWatercraft]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventWatercraft] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_LossEventWatercraft]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventWatercraft]'))
ALTER TABLE [Claim].[LossEventWatercraft] CHECK CONSTRAINT [FK_SourceSystemSK_LossEventWatercraft]
GO
