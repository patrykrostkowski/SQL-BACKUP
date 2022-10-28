USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyGeography]    Script Date: 28.10.2022 12:26:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyGeography](
	[PolicyGeographySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NOT NULL,
	[CountrySK] [int] NOT NULL,
	[StateSK] [int] NULL,
	[TerritoryName] [varchar](25) NULL,
	[RegionName] [varchar](25) NULL,
	[CountyName] [varchar](25) NULL,
	[GovernClassByStatePremiumCodeSK] [int] NULL,
	[GovernClassByStateExposureCodeSK] [int] NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[EstimatedWrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[EstimatedWrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[EstimatedWrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[WrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[WrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[WrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[AddlRetPremBaseAmt] [decimal](19, 4) NULL,
	[AddlRetPremOriginalAmt] [decimal](19, 4) NULL,
	[AddlRetPremReportingAmt] [decimal](19, 4) NULL,
	[TermPremiumBaseAmt] [decimal](19, 4) NULL,
	[TermPremiumOriginalAmt] [decimal](19, 4) NULL,
	[TermPremiumReportingAmt] [decimal](19, 4) NULL,
	[CommissionBaseAmt] [decimal](19, 4) NULL,
	[CommissionOriginalAmt] [decimal](19, 4) NULL,
	[CommissionReportingAmt] [decimal](19, 4) NULL,
	[CommissionPct] [decimal](8, 2) NULL,
 CONSTRAINT [PK_PolicyGeography] PRIMARY KEY CLUSTERED 
(
	[PolicyGeographySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyGeography]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyGeography] ON [Policy].[PolicyGeography]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_ClassCode_PolicyGeography] FOREIGN KEY([GovernClassByStatePremiumCodeSK])
REFERENCES [Typelist].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [Policy].[PolicyGeography] NOCHECK CONSTRAINT [FK_ClassCode_PolicyGeography]
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_CountrySK_PolicyGeography] FOREIGN KEY([CountrySK])
REFERENCES [Typelist].[Country] ([CountrySK])
GO
ALTER TABLE [Policy].[PolicyGeography] NOCHECK CONSTRAINT [FK_CountrySK_PolicyGeography]
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_GovernClassByStateExposureCodeSK_PolicyGeography] FOREIGN KEY([GovernClassByStateExposureCodeSK])
REFERENCES [Typelist].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [Policy].[PolicyGeography] NOCHECK CONSTRAINT [FK_GovernClassByStateExposureCodeSK_PolicyGeography]
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyGeography] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyGeography] NOCHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyGeography]
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyGeography] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyGeography] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyGeography]
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyGeography] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyGeography] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyGeography]
GO
ALTER TABLE [Policy].[PolicyGeography]  WITH NOCHECK ADD  CONSTRAINT [FK_StateSK_PolicyGeography] FOREIGN KEY([StateSK])
REFERENCES [Typelist].[State] ([StateSK])
GO
ALTER TABLE [Policy].[PolicyGeography] NOCHECK CONSTRAINT [FK_StateSK_PolicyGeography]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The physical location  of an insurable object defined as its country, stateprovince, region and territory.  This factor may be used to underwrite risk,  calculate premiums and enforce   geographical limits  on claim reporting' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyGeography'
GO
