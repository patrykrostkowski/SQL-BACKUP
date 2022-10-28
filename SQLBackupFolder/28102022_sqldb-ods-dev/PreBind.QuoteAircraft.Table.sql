USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteAircraft]    Script Date: 28.10.2022 12:26:50 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteAircraft]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteAircraft] ON [PreBind].[QuoteAircraft]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteAircraft]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteAircraft] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteAircraft] NOCHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteAircraft]
GO
ALTER TABLE [PreBind].[QuoteAircraft]  WITH NOCHECK ADD  CONSTRAINT [FK_RegistrationCountrySK_QuoteAircraft] FOREIGN KEY([RegistrationCountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [PreBind].[QuoteAircraft] NOCHECK CONSTRAINT [FK_RegistrationCountrySK_QuoteAircraft]
GO
ALTER TABLE [PreBind].[QuoteAircraft]  WITH NOCHECK ADD  CONSTRAINT [FK_RegistrationStateSK_QuoteAircraft] FOREIGN KEY([RegistrationStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteAircraft] NOCHECK CONSTRAINT [FK_RegistrationStateSK_QuoteAircraft]
GO
ALTER TABLE [PreBind].[QuoteAircraft]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteAircraft] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteAircraft] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteAircraft]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This concept represents the features of an aircraft or other flying machines.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteAircraft'
GO
