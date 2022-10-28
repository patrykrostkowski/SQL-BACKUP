USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[DriverLicenseDetail]    Script Date: 28.10.2022 15:04:53 ******/
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
 CONSTRAINT [PK_DriverLicenseDetail] PRIMARY KEY CLUSTERED 
(
	[DriverLicenseDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_DriverLicenseDetail]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_DriverLicenseDetail] ON [Policy].[DriverLicenseDetail]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_CountrySK_DriverLicenseDetail] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[DriverLicenseDetail] NOCHECK CONSTRAINT [FK_CountrySK_DriverLicenseDetail]
GO
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_DriverSK_DriverLicenseDetail] FOREIGN KEY([DriverSK])
REFERENCES [Policy].[Driver] ([DriverSK])
GO
ALTER TABLE [Policy].[DriverLicenseDetail] NOCHECK CONSTRAINT [FK_DriverSK_DriverLicenseDetail]
GO
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PreviousLicenseStateSK_DriverLicenseDetail] FOREIGN KEY([PreviousLicenseStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Policy].[DriverLicenseDetail] NOCHECK CONSTRAINT [FK_PreviousLicenseStateSK_DriverLicenseDetail]
GO
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_DriverLicenseDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[DriverLicenseDetail] NOCHECK CONSTRAINT [FK_SourceSystemSK_DriverLicenseDetail]
GO
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_DriverLicenseDetail] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Policy].[DriverLicenseDetail] NOCHECK CONSTRAINT [FK_StateSK_DriverLicenseDetail]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This concept defines the characteristics of a Driving License of a person.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'DriverLicenseDetail'
GO
