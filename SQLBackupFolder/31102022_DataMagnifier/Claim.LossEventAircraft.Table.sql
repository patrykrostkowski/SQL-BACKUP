USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEventAircraft]    Script Date: 31.10.2022 11:58:54 ******/
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
ALTER TABLE [Claim].[LossEventAircraft]  WITH CHECK ADD  CONSTRAINT [FK_AircraftTypeSK_LossEventAircraft] FOREIGN KEY([AircraftTypeSK])
REFERENCES [TypeList].[AircraftType] ([AircraftTypeSK])
GO
ALTER TABLE [Claim].[LossEventAircraft] CHECK CONSTRAINT [FK_AircraftTypeSK_LossEventAircraft]
GO
ALTER TABLE [Claim].[LossEventAircraft]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventAircraft] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventAircraft] CHECK CONSTRAINT [FK_LossEventSK_LossEventAircraft]
GO
ALTER TABLE [Claim].[LossEventAircraft]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventAircraft] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventAircraft] CHECK CONSTRAINT [FK_SourceSystemSK_LossEventAircraft]
GO
