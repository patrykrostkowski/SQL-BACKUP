USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteDriverLicenseDetail]    Script Date: 02.11.2022 12:54:11 ******/
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
 CONSTRAINT [PK_QuoteDriverLicenseDetail] PRIMARY KEY NONCLUSTERED 
(
	[QuoteDriverLicenseDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_DriverLicenseStateSK_QuoteDriverLicenseDetail] FOREIGN KEY([DriverLicenseStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail] CHECK CONSTRAINT [FK_DriverLicenseStateSK_QuoteDriverLicenseDetail]
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_PreviousDriverLicenseStateSK_QuoteDriverLicenseDetail] FOREIGN KEY([PreviousDriverLicenseStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail] CHECK CONSTRAINT [FK_PreviousDriverLicenseStateSK_QuoteDriverLicenseDetail]
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_QuoteDriverSK_QuoteDriverLicenseDetail] FOREIGN KEY([QuoteDriverSK])
REFERENCES [PreBind].[QuoteDriver] ([QuoteDriverSK])
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail] CHECK CONSTRAINT [FK_QuoteDriverSK_QuoteDriverLicenseDetail]
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteDriverLicenseDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteDriverLicenseDetail] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteDriverLicenseDetail]
GO
