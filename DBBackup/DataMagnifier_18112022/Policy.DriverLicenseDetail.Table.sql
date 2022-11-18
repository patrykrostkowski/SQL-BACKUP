USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[DriverLicenseDetail]    Script Date: 18.11.2022 16:48:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[DriverLicenseDetail](
	[DriverLicenseDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[LicensedDate] [date] NULL,
	[DriversLicenseNumber] [varchar](255) NULL,
	[FirstLicensedCurrentStateDate] [date] NULL,
	[LicenseClassCode] [varchar](255) NULL,
	[StateSK] [int] NULL,
	[PreviousLicenseStateSK] [int] NULL,
	[CountrySK] [int] NULL,
	[PreviousLicensedStateSK] [int] NULL,
	[LicenseTypeCode] [varchar](255) NULL,
	[LicenseStatusCode] [varchar](255) NULL,
	[LicensePermitNumber] [varchar](255) NULL,
	[DriverSK] [int] NOT NULL,
	[LicenseTypeDesc] [varchar](255) NULL,
	[LicenseStatusDesc] [varchar](255) NULL,
 CONSTRAINT [PK_DriverLicenseDetail] PRIMARY KEY NONCLUSTERED 
(
	[DriverLicenseDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_DriverLicenseDetail] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[DriverLicenseDetail] CHECK CONSTRAINT [FK_CountrySK_DriverLicenseDetail]
GO
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_DriverSK_DriverLicenseDetail] FOREIGN KEY([DriverSK])
REFERENCES [Policy].[Driver] ([DriverSK])
GO
ALTER TABLE [Policy].[DriverLicenseDetail] CHECK CONSTRAINT [FK_DriverSK_DriverLicenseDetail]
GO
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_PreviousLicenseStateSK_DriverLicenseDetail] FOREIGN KEY([PreviousLicenseStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Policy].[DriverLicenseDetail] CHECK CONSTRAINT [FK_PreviousLicenseStateSK_DriverLicenseDetail]
GO
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_DriverLicenseDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[DriverLicenseDetail] CHECK CONSTRAINT [FK_SourceSystemSK_DriverLicenseDetail]
GO
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_DriverLicenseDetail] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Policy].[DriverLicenseDetail] CHECK CONSTRAINT [FK_StateSK_DriverLicenseDetail]
GO
