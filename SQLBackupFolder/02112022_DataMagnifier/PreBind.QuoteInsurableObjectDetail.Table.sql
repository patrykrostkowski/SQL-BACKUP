USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteInsurableObjectDetail]    Script Date: 02.11.2022 14:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteInsurableObjectDetail](
	[QuoteInsurableObjectDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteInsurableObjectSK] [int] NOT NULL,
	[RiskLocationCode] [varchar](20) NULL,
	[RiskLocationDesc] [varchar](255) NULL,
	[EarthquakeZoneCode] [varchar](20) NULL,
	[EarthquakeZoneDesc] [varchar](255) NULL,
	[FireDistrictCode] [varchar](20) NULL,
	[FireDistrictDesc] [varchar](255) NULL,
	[FireStationName] [varchar](255) NULL,
	[FireStationLocationName] [varchar](255) NULL,
	[LatitudeCode] [varchar](20) NULL,
	[LongitudeCode] [varchar](20) NULL,
	[FireStationCountyTownName] [varchar](255) NULL,
	[FireStationTownshipName] [varchar](255) NULL,
	[NumEmployeesPartTime] [int] NULL,
	[NumEmployeesFullTime] [int] NULL,
	[BusinessHoursStartTime] [varchar](255) NULL,
	[BusinessHoursCloseTime] [varchar](255) NULL,
 CONSTRAINT [PK_QuoteInsurableObjectDetail] PRIMARY KEY CLUSTERED 
(
	[QuoteInsurableObjectDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteInsurableObjectDetail]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteInsurableObjectDetail] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteInsurableObjectDetail] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteInsurableObjectDetail]
GO
ALTER TABLE [PreBind].[QuoteInsurableObjectDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteInsurableObjectDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteInsurableObjectDetail] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteInsurableObjectDetail]
GO
