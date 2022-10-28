USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[LossEventVehicle]    Script Date: 28.10.2022 11:09:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[LossEventVehicle](
	[LossEventVehicleSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[LossEventSK] [int] NULL,
	[VIN] [varchar](40) NULL,
	[ModelDesc] [varchar](40) NULL,
	[MakeDesc] [varchar](40) NULL,
	[YearNum] [int] NULL,
	[StateSK] [int] NULL,
	[CountrySK] [int] NULL,
	[SalvageAssignedDate] [date] NULL,
	[VehicleRecoveredDate] [date] NULL,
	[VehicleDimensionDesc] [varchar](255) NULL,
 CONSTRAINT [PK_LossEventVehicle] PRIMARY KEY CLUSTERED 
(
	[LossEventVehicleSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossEventVehicle]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossEventVehicle] ON [Claim].[LossEventVehicle]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEventVehicle]  WITH NOCHECK ADD  CONSTRAINT [FK_CountrySK_LossEventVehicle] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Claim].[LossEventVehicle] NOCHECK CONSTRAINT [FK_CountrySK_LossEventVehicle]
GO
ALTER TABLE [Claim].[LossEventVehicle]  WITH NOCHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventVehicle] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventVehicle] NOCHECK CONSTRAINT [FK_LossEventSK_LossEventVehicle]
GO
ALTER TABLE [Claim].[LossEventVehicle]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventVehicle] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventVehicle] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossEventVehicle]
GO
ALTER TABLE [Claim].[LossEventVehicle]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_LossEventVehicle] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Claim].[LossEventVehicle] NOCHECK CONSTRAINT [FK_StateSK_LossEventVehicle]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specifics of a vehicle or vehicle type (ex: motorhome) loss event' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'LossEventVehicle'
GO
