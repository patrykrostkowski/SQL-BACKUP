USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[LossEventWatercraft]    Script Date: 28.10.2022 12:26:16 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossEventWatercraft]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossEventWatercraft] ON [Claim].[LossEventWatercraft]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEventWatercraft]  WITH NOCHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventWatercraft] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventWatercraft] NOCHECK CONSTRAINT [FK_LossEventSK_LossEventWatercraft]
GO
ALTER TABLE [Claim].[LossEventWatercraft]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventWatercraft] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventWatercraft] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossEventWatercraft]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specifics of a watercraft loss event' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'LossEventWatercraft'
GO
