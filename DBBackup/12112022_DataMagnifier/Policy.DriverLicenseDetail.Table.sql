USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[DriverLicenseDetail]    Script Date: 12.11.2022 09:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[DriverLicenseDetail]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CountrySK_DriverLicenseDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[DriverLicenseDetail]'))
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_CountrySK_DriverLicenseDetail] FOREIGN KEY([CountrySK])
REFERENCES [TypeList].[Country] ([CountrySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_CountrySK_DriverLicenseDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[DriverLicenseDetail]'))
ALTER TABLE [Policy].[DriverLicenseDetail] CHECK CONSTRAINT [FK_CountrySK_DriverLicenseDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DriverSK_DriverLicenseDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[DriverLicenseDetail]'))
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_DriverSK_DriverLicenseDetail] FOREIGN KEY([DriverSK])
REFERENCES [Policy].[Driver] ([DriverSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_DriverSK_DriverLicenseDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[DriverLicenseDetail]'))
ALTER TABLE [Policy].[DriverLicenseDetail] CHECK CONSTRAINT [FK_DriverSK_DriverLicenseDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PreviousLicenseStateSK_DriverLicenseDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[DriverLicenseDetail]'))
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_PreviousLicenseStateSK_DriverLicenseDetail] FOREIGN KEY([PreviousLicenseStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PreviousLicenseStateSK_DriverLicenseDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[DriverLicenseDetail]'))
ALTER TABLE [Policy].[DriverLicenseDetail] CHECK CONSTRAINT [FK_PreviousLicenseStateSK_DriverLicenseDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_DriverLicenseDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[DriverLicenseDetail]'))
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_DriverLicenseDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_DriverLicenseDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[DriverLicenseDetail]'))
ALTER TABLE [Policy].[DriverLicenseDetail] CHECK CONSTRAINT [FK_SourceSystemSK_DriverLicenseDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_StateSK_DriverLicenseDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[DriverLicenseDetail]'))
ALTER TABLE [Policy].[DriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_StateSK_DriverLicenseDetail] FOREIGN KEY([StateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_StateSK_DriverLicenseDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[DriverLicenseDetail]'))
ALTER TABLE [Policy].[DriverLicenseDetail] CHECK CONSTRAINT [FK_StateSK_DriverLicenseDetail]
GO
