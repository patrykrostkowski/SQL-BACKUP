USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteAircraft]    Script Date: 10.11.2022 12:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteAircraft](
	[QuoteAircraftSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteInsurableObjectSK] [int] NOT NULL,
	[AircraftIdentificationNum] [varchar](40) NULL,
	[TailNum] [varchar](25) NULL,
	[ModelDesc] [varchar](40) NULL,
	[MakeDesc] [varchar](40) NULL,
	[YearNum] [int] NULL,
	[EquipmentTypeCode] [varchar](25) NULL,
	[EquipmentTypeDesc] [varchar](50) NULL,
	[EquipmentClassCode] [varchar](25) NULL,
	[EquipmentClassDesc] [varchar](50) NULL,
	[GearTypeCode] [varchar](25) NULL,
	[GearTypeDesc] [varchar](50) NULL,
	[RegistrationStateSK] [int] NOT NULL,
	[RegistrationCountrySK] [int] NOT NULL,
	[AircraftTypeSK] [int] NULL,
	[FAANum] [varchar](25) NULL,
	[FAAViolationsNum] [int] NULL,
	[NumberOfSeats] [int] NULL,
	[BuilderInfo] [varchar](255) NULL,
	[AircraftDesc] [varchar](255) NULL,
	[OwnerName] [varchar](255) NULL,
	[IsCharteredInd] [tinyint] NULL,
	[HullValueAmt] [decimal](19, 4) NULL,
	[TonnageAmt] [int] NULL,
 CONSTRAINT [PK_QuoteAircraft] PRIMARY KEY CLUSTERED 
(
	[QuoteAircraftSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteAircraft]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteAircraft] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteAircraft] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteAircraft]
GO
ALTER TABLE [PreBind].[QuoteAircraft]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationCountrySK_QuoteAircraft] FOREIGN KEY([RegistrationCountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [PreBind].[QuoteAircraft] CHECK CONSTRAINT [FK_RegistrationCountrySK_QuoteAircraft]
GO
ALTER TABLE [PreBind].[QuoteAircraft]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationStateSK_QuoteAircraft] FOREIGN KEY([RegistrationStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteAircraft] CHECK CONSTRAINT [FK_RegistrationStateSK_QuoteAircraft]
GO
ALTER TABLE [PreBind].[QuoteAircraft]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteAircraft] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteAircraft] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteAircraft]
GO
