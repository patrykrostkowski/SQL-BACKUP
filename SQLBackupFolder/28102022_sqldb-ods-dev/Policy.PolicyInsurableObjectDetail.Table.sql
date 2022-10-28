USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyInsurableObjectDetail]    Script Date: 28.10.2022 15:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyInsurableObjectDetail]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyInsurableObjectDetail] ON [Policy].[PolicyInsurableObjectDetail]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyInsurableObjectDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyInsurableObjectDetail] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[PolicyInsurableObjectDetail] NOCHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyInsurableObjectDetail]
GO
ALTER TABLE [Policy].[PolicyInsurableObjectDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyInsurableObjectDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyInsurableObjectDetail] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyInsurableObjectDetail]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Insurability details provide underwriters the factors to calculate premiums.  Based on the insurable type, factors may include location,  construction materials, features, age,  condition, the policy holders credit worthiness and claims history.   All play a part in determining the associated premium' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyInsurableObjectDetail'
GO
