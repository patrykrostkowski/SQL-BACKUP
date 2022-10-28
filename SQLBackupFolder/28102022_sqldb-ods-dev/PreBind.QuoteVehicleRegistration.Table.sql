USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteVehicleRegistration]    Script Date: 28.10.2022 12:27:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteVehicleRegistration](
	[QuoteVehicleRegistrationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteVehicleSK] [int] NOT NULL,
	[RegistrationTypeCode] [varchar](255) NULL,
	[RegistrationNum] [varchar](255) NULL,
	[RegistrationEffectiveDate] [date] NULL,
	[RegistrationExpirationDate] [date] NULL,
	[StateSK] [int] NOT NULL,
	[CountrySK] [int] NOT NULL,
	[LastRegisteredYear] [varchar](50) NULL,
	[IsActiveInd] [tinyint] NULL,
 CONSTRAINT [PK_QuoteVehicleRegistration] PRIMARY KEY CLUSTERED 
(
	[QuoteVehicleRegistrationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteVehicleRegistration]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteVehicleRegistration] ON [PreBind].[QuoteVehicleRegistration]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteVehicleRegistration]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleRegistration] FOREIGN KEY([QuoteVehicleSK])
REFERENCES [PreBind].[QuoteVehicle] ([QuoteVehicleSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleRegistration] NOCHECK CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleRegistration]
GO
ALTER TABLE [PreBind].[QuoteVehicleRegistration]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteVehicleRegistration] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleRegistration] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteVehicleRegistration]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A recording by the Vehicle authorities of vehicle identifying information.A vehcile may have multiple registrations for each effective and expiration date' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteVehicleRegistration'
GO
