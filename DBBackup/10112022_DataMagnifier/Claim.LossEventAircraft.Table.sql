USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEventAircraft]    Script Date: 10.11.2022 14:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[LossEventAircraft]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AircraftTypeSK_LossEventAircraft]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventAircraft]'))
ALTER TABLE [Claim].[LossEventAircraft]  WITH CHECK ADD  CONSTRAINT [FK_AircraftTypeSK_LossEventAircraft] FOREIGN KEY([AircraftTypeSK])
REFERENCES [TypeList].[AircraftType] ([AircraftTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AircraftTypeSK_LossEventAircraft]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventAircraft]'))
ALTER TABLE [Claim].[LossEventAircraft] CHECK CONSTRAINT [FK_AircraftTypeSK_LossEventAircraft]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSK_LossEventAircraft]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventAircraft]'))
ALTER TABLE [Claim].[LossEventAircraft]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventAircraft] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSK_LossEventAircraft]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventAircraft]'))
ALTER TABLE [Claim].[LossEventAircraft] CHECK CONSTRAINT [FK_LossEventSK_LossEventAircraft]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_LossEventAircraft]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventAircraft]'))
ALTER TABLE [Claim].[LossEventAircraft]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventAircraft] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_LossEventAircraft]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEventAircraft]'))
ALTER TABLE [Claim].[LossEventAircraft] CHECK CONSTRAINT [FK_SourceSystemSK_LossEventAircraft]
GO
