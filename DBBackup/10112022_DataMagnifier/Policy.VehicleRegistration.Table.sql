USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[VehicleRegistration]    Script Date: 10.11.2022 14:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[VehicleRegistration]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[VehicleRegistration](
	[VehicleRegistrationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[VehicleSK] [int] NOT NULL,
	[RegistrationTypeCode] [varchar](255) NULL,
	[RegistrationNum] [varchar](255) NULL,
	[RegistrationEffectiveDate] [date] NULL,
	[RegistrationExpirationDate] [date] NULL,
	[StateSK] [int] NOT NULL,
	[CountrySK] [int] NOT NULL,
	[LastRegisteredYear] [varchar](255) NULL,
	[IsActiveInd] [tinyint] NULL,
 CONSTRAINT [PK_VehicleRegistration] PRIMARY KEY NONCLUSTERED 
(
	[VehicleRegistrationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_Country_VehicleRegistration]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleRegistration]'))
ALTER TABLE [Policy].[VehicleRegistration]  WITH CHECK ADD  CONSTRAINT [FK_Country_VehicleRegistration] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_Country_VehicleRegistration]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleRegistration]'))
ALTER TABLE [Policy].[VehicleRegistration] CHECK CONSTRAINT [FK_Country_VehicleRegistration]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_VehicleRegistration]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleRegistration]'))
ALTER TABLE [Policy].[VehicleRegistration]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_VehicleRegistration] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_VehicleRegistration]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleRegistration]'))
ALTER TABLE [Policy].[VehicleRegistration] CHECK CONSTRAINT [FK_SourceSystemSK_VehicleRegistration]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_State_VehicleRegistration]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleRegistration]'))
ALTER TABLE [Policy].[VehicleRegistration]  WITH CHECK ADD  CONSTRAINT [FK_State_VehicleRegistration] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_State_VehicleRegistration]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleRegistration]'))
ALTER TABLE [Policy].[VehicleRegistration] CHECK CONSTRAINT [FK_State_VehicleRegistration]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_VehicleSK_VehicleRegistration]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleRegistration]'))
ALTER TABLE [Policy].[VehicleRegistration]  WITH CHECK ADD  CONSTRAINT [FK_VehicleSK_VehicleRegistration] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_VehicleSK_VehicleRegistration]') AND parent_object_id = OBJECT_ID(N'[Policy].[VehicleRegistration]'))
ALTER TABLE [Policy].[VehicleRegistration] CHECK CONSTRAINT [FK_VehicleSK_VehicleRegistration]
GO
