USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyInsurableObjectDetail]    Script Date: 10.11.2022 14:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObjectDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[PolicyInsurableObjectDetail](
	[PolicyInsurableObjectDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyInsurableObjectSK] [int] NOT NULL,
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
 CONSTRAINT [PK_PolicyInsurableObjectDetail] PRIMARY KEY CLUSTERED 
(
	[PolicyInsurableObjectDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PolicyInsurableObjectDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObjectDetail]'))
ALTER TABLE [Policy].[PolicyInsurableObjectDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyInsurableObjectDetail] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_PolicyInsurableObjectDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObjectDetail]'))
ALTER TABLE [Policy].[PolicyInsurableObjectDetail] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyInsurableObjectDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyInsurableObjectDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObjectDetail]'))
ALTER TABLE [Policy].[PolicyInsurableObjectDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyInsurableObjectDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyInsurableObjectDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyInsurableObjectDetail]'))
ALTER TABLE [Policy].[PolicyInsurableObjectDetail] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyInsurableObjectDetail]
GO
