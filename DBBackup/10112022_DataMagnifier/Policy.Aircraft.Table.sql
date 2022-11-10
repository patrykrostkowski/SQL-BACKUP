USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[Aircraft]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[Aircraft]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[Aircraft](
	[AircraftSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyInsurableObjectSK] [int] NOT NULL,
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
	[RegistrationStateSK] [int] NULL,
	[RegistrationCountrySK] [int] NULL,
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
 CONSTRAINT [PK_Aircraft] PRIMARY KEY CLUSTERED 
(
	[AircraftSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AircraftTypeSK_Aircraft]') AND parent_object_id = OBJECT_ID(N'[Policy].[Aircraft]'))
ALTER TABLE [Policy].[Aircraft]  WITH CHECK ADD  CONSTRAINT [FK_AircraftTypeSK_Aircraft] FOREIGN KEY([AircraftTypeSK])
REFERENCES [TypeList].[AircraftType] ([AircraftTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_AircraftTypeSK_Aircraft]') AND parent_object_id = OBJECT_ID(N'[Policy].[Aircraft]'))
ALTER TABLE [Policy].[Aircraft] CHECK CONSTRAINT [FK_AircraftTypeSK_Aircraft]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_Aircraft]') AND parent_object_id = OBJECT_ID(N'[Policy].[Aircraft]'))
ALTER TABLE [Policy].[Aircraft]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_Aircraft] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_Aircraft]') AND parent_object_id = OBJECT_ID(N'[Policy].[Aircraft]'))
ALTER TABLE [Policy].[Aircraft] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_Aircraft]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_RegistrationCountrySK_Aircraft]') AND parent_object_id = OBJECT_ID(N'[Policy].[Aircraft]'))
ALTER TABLE [Policy].[Aircraft]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationCountrySK_Aircraft] FOREIGN KEY([RegistrationCountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_RegistrationCountrySK_Aircraft]') AND parent_object_id = OBJECT_ID(N'[Policy].[Aircraft]'))
ALTER TABLE [Policy].[Aircraft] CHECK CONSTRAINT [FK_RegistrationCountrySK_Aircraft]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_RegistrationStateSK_Aircraft]') AND parent_object_id = OBJECT_ID(N'[Policy].[Aircraft]'))
ALTER TABLE [Policy].[Aircraft]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationStateSK_Aircraft] FOREIGN KEY([RegistrationStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_RegistrationStateSK_Aircraft]') AND parent_object_id = OBJECT_ID(N'[Policy].[Aircraft]'))
ALTER TABLE [Policy].[Aircraft] CHECK CONSTRAINT [FK_RegistrationStateSK_Aircraft]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_Aircraft]') AND parent_object_id = OBJECT_ID(N'[Policy].[Aircraft]'))
ALTER TABLE [Policy].[Aircraft]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Aircraft] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_Aircraft]') AND parent_object_id = OBJECT_ID(N'[Policy].[Aircraft]'))
ALTER TABLE [Policy].[Aircraft] CHECK CONSTRAINT [FK_SourceSystemSK_Aircraft]
GO
