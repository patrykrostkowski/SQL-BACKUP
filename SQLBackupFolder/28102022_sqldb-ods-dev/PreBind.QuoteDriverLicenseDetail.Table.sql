USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteDriverLicenseDetail]    Script Date: 28.10.2022 12:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteDriverLicenseDetail](
	[QuoteDriverLicenseDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteDriverSK] [int] NOT NULL,
	[LicensedDate] [date] NULL,
	[DriversLicenseNumber] [varchar](255) NULL,
	[FirstLicensedCurrentStateDate] [date] NULL,
	[LicenseClassCode] [varchar](255) NULL,
	[DriverLicenseStateSK] [int] NULL,
	[PreviousDriverLicenseStateSK] [int] NULL,
	[LicenseTypeCode] [varchar](255) NULL,
	[LicenseStatusCode] [varchar](255) NULL,
	[LicensePermitNumber] [varchar](255) NULL,
	[LicenseTypeDesc] [varchar](255) NULL,
	[LicenseStatusDesc] [varchar](255) NULL,
 CONSTRAINT [PK_QuoteDriverLicenseDetail] PRIMARY KEY CLUSTERED 
(
	[QuoteDriverLicenseDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteDriverLicenseDetail]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteDriverLicenseDetail] ON [PreBind].[QuoteDriverLicenseDetail]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_DriverLicenseStateSK_QuoteDriverLicenseDetail] FOREIGN KEY([DriverLicenseStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail] NOCHECK CONSTRAINT [FK_DriverLicenseStateSK_QuoteDriverLicenseDetail]
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PreviousDriverLicenseStateSK_QuoteDriverLicenseDetail] FOREIGN KEY([PreviousDriverLicenseStateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail] NOCHECK CONSTRAINT [FK_PreviousDriverLicenseStateSK_QuoteDriverLicenseDetail]
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteDriverSK_QuoteDriverLicenseDetail] FOREIGN KEY([QuoteDriverSK])
REFERENCES [PreBind].[QuoteDriver] ([QuoteDriverSK])
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail] NOCHECK CONSTRAINT [FK_QuoteDriverSK_QuoteDriverLicenseDetail]
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteDriverLicenseDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteDriverLicenseDetail]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This concept defines the characteristics of a Driving License of a person.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteDriverLicenseDetail'
GO
