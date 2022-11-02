USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[VehicleDriver]    Script Date: 02.11.2022 13:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[VehicleDriver](
	[VehicleDriverSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[VehicleSK] [int] NOT NULL,
	[DriverSK] [int] NOT NULL,
	[IsPrimaryDriverInd] [tinyint] NULL,
	[IsExcludedDriverInd] [tinyint] NULL,
 CONSTRAINT [PK_VehicleDriver] PRIMARY KEY NONCLUSTERED 
(
	[VehicleDriverSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[VehicleDriver]  WITH CHECK ADD  CONSTRAINT [FK_DriverSK_VehicleDriver] FOREIGN KEY([DriverSK])
REFERENCES [Policy].[Driver] ([DriverSK])
GO
ALTER TABLE [Policy].[VehicleDriver] CHECK CONSTRAINT [FK_DriverSK_VehicleDriver]
GO
ALTER TABLE [Policy].[VehicleDriver]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_VehicleDriver] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[VehicleDriver] CHECK CONSTRAINT [FK_SourceSystemSK_VehicleDriver]
GO
ALTER TABLE [Policy].[VehicleDriver]  WITH CHECK ADD  CONSTRAINT [FK_VehicleSK_VehicleDriver] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
ALTER TABLE [Policy].[VehicleDriver] CHECK CONSTRAINT [FK_VehicleSK_VehicleDriver]
GO
