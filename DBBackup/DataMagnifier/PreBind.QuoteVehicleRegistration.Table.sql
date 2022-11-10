USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteVehicleRegistration]    Script Date: 10.11.2022 13:56:00 ******/
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
 CONSTRAINT [PK_QuoteVehicleRegistration] PRIMARY KEY NONCLUSTERED 
(
	[QuoteVehicleRegistrationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteVehicleRegistration]  WITH CHECK ADD  CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleRegistration] FOREIGN KEY([QuoteVehicleSK])
REFERENCES [PreBind].[QuoteVehicle] ([QuoteVehicleSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleRegistration] CHECK CONSTRAINT [FK_QuoteVehicleSK_QuoteVehicleRegistration]
GO
ALTER TABLE [PreBind].[QuoteVehicleRegistration]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteVehicleRegistration] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteVehicleRegistration] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteVehicleRegistration]
GO
