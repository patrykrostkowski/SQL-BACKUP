USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[VehicleRegistration]    Script Date: 28.10.2022 13:36:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
 CONSTRAINT [PK_VehicleRegistration] PRIMARY KEY CLUSTERED 
(
	[VehicleRegistrationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_VehicleRegistration]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_VehicleRegistration] ON [Policy].[VehicleRegistration]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[VehicleRegistration]  WITH NOCHECK ADD  CONSTRAINT [FK_Country_VehicleRegistration] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[VehicleRegistration] NOCHECK CONSTRAINT [FK_Country_VehicleRegistration]
GO
ALTER TABLE [Policy].[VehicleRegistration]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_VehicleRegistration] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[VehicleRegistration] NOCHECK CONSTRAINT [FK_SourceSystemSK_VehicleRegistration]
GO
ALTER TABLE [Policy].[VehicleRegistration]  WITH NOCHECK ADD  CONSTRAINT [FK_State_VehicleRegistration] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Policy].[VehicleRegistration] NOCHECK CONSTRAINT [FK_State_VehicleRegistration]
GO
ALTER TABLE [Policy].[VehicleRegistration]  WITH NOCHECK ADD  CONSTRAINT [FK_VehicleSK_VehicleRegistration] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
ALTER TABLE [Policy].[VehicleRegistration] NOCHECK CONSTRAINT [FK_VehicleSK_VehicleRegistration]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A recording by the Vehicle authorities of vehicle identifying information.A vehcile may have multiple registrations for each effective and expiration date' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'VehicleRegistration'
GO
