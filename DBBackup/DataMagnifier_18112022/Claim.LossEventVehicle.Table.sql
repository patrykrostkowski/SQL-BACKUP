USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEventVehicle]    Script Date: 18.11.2022 16:48:07 ******/
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
ALTER TABLE [Claim].[LossEventVehicle]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_LossEventVehicle] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Claim].[LossEventVehicle] CHECK CONSTRAINT [FK_CountrySK_LossEventVehicle]
GO
ALTER TABLE [Claim].[LossEventVehicle]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_LossEventVehicle] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[LossEventVehicle] CHECK CONSTRAINT [FK_LossEventSK_LossEventVehicle]
GO
ALTER TABLE [Claim].[LossEventVehicle]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventVehicle] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventVehicle] CHECK CONSTRAINT [FK_SourceSystemSK_LossEventVehicle]
GO
ALTER TABLE [Claim].[LossEventVehicle]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_LossEventVehicle] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Claim].[LossEventVehicle] CHECK CONSTRAINT [FK_StateSK_LossEventVehicle]
GO
