USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[LossEventAircraft]    Script Date: 28.10.2022 11:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[LossEventAircraft](
	[LossEventAircraftSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[LossEventSK] [int] NOT NULL,
	[AircraftIdentificationNum] [varchar](40) NULL,
	[TailNum] [varchar](25) NULL,
	[ModelDesc] [varchar](40) NULL,
	[MakeDesc] [varchar](40) NULL,
	[YearNum] [int] NULL,
	[EquipmentTypeSK] [int] NULL,
	[EquipmentClassSK] [int] NULL,
	[GearTypeCode] [varchar](25) NULL,
	[RegistrationStateSK] [int] NULL,
	[RegistrationCountrySK] [varchar](50) NULL,
	[AircraftTypeSK] [int] NULL,
	[FAANum] [varchar](25) NULL,
	[NumberOfSeats] [int] NULL,
	[BuilderInfo] [varchar](255) NULL,
	[SalvageAssignedDate] [date] NULL,
	[VehicleRecoveredDate] [date] NULL,
	[VehicleDimensionDesc] [varchar](255) NULL,
	[OwnerName] [varchar](255) NULL,
	[IsCharteredInd] [tinyint] NULL,
	[IsOperableInd] [tinyint] NULL,
	[IsRecoverInd] [int] NULL,
	[IsTotalLossInd] [tinyint] NULL,
	[TonnageAmt] [int] NULL,
 CONSTRAINT [PK_LossEventAircraft] PRIMARY KEY CLUSTERED 
(
	[LossEventAircraftSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossEventAircraft]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossEventAircraft] ON [Claim].[LossEventAircraft]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEventAircraft]  WITH NOCHECK ADD  CONSTRAINT [FK_AircraftTypeSK_LossEventAircraft] FOREIGN KEY([AircraftTypeSK])
REFERENCES [Typelist].[AircraftType] ([AircraftTypeSK])
GO
ALTER TABLE [Claim].[LossEventAircraft] NOCHECK CONSTRAINT [FK_AircraftTypeSK_LossEventAircraft]
GO
ALTER TABLE [Claim].[LossEventAircraft]  WITH NOCHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventAircraft] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventAircraft] NOCHECK CONSTRAINT [FK_LossEventSK_LossEventAircraft]
GO
ALTER TABLE [Claim].[LossEventAircraft]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventAircraft] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventAircraft] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossEventAircraft]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specifics of an aircraft loss event' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'LossEventAircraft'
GO
