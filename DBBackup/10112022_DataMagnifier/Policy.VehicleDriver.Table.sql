USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[VehicleDriver]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[VehicleDriver]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DriverSK_VehicleDriver]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleDriver]'))
ALTER TABLE [Policy].[VehicleDriver]  WITH CHECK ADD  CONSTRAINT [FK_DriverSK_VehicleDriver] FOREIGN KEY([DriverSK])
REFERENCES [Policy].[Driver] ([DriverSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DriverSK_VehicleDriver]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleDriver]'))
ALTER TABLE [Policy].[VehicleDriver] CHECK CONSTRAINT [FK_DriverSK_VehicleDriver]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_VehicleDriver]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleDriver]'))
ALTER TABLE [Policy].[VehicleDriver]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_VehicleDriver] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_VehicleDriver]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleDriver]'))
ALTER TABLE [Policy].[VehicleDriver] CHECK CONSTRAINT [FK_SourceSystemSK_VehicleDriver]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_VehicleSK_VehicleDriver]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleDriver]'))
ALTER TABLE [Policy].[VehicleDriver]  WITH CHECK ADD  CONSTRAINT [FK_VehicleSK_VehicleDriver] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_VehicleSK_VehicleDriver]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleDriver]'))
ALTER TABLE [Policy].[VehicleDriver] CHECK CONSTRAINT [FK_VehicleSK_VehicleDriver]
GO
