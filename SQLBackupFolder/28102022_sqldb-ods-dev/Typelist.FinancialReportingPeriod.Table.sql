USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[FinancialReportingPeriod]    Script Date: 28.10.2022 15:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[FinancialReportingPeriod](
	[FinancialReportingPeriodSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[FinancialReportingPeriodNum] [varchar](10) NOT NULL,
	[FinancialReportingYearNum] [varchar](10) NOT NULL,
	[FinancialReportingQuarterNum] [varchar](10) NOT NULL,
	[FinancialReportingPeriodBeginDate] [date] NULL,
	[FinancialReportingPeriodEndDate] [date] NULL,
	[FinancialReportingPeriodLabelMMDDYYYYAbrv] [varchar](25) NULL,
	[FinancialReportingPeriodrYearQuarterLabelYYYYQAbrv] [varchar](25) NULL,
	[FinancialReportingPeriodYearQuarterName] [varchar](25) NULL,
	[FinancialReportingPeriodYearMonthLabelYYYYMMAbrv] [varchar](25) NULL,
	[FinancialReportingPeriodYearMonthName] [varchar](25) NULL,
	[IsMonthEndInd] [tinyint] NULL,
	[FinancialReportingPeriodDate] [date] NULL,
 CONSTRAINT [PK_FinancialReportingPeriod] PRIMARY KEY CLUSTERED 
(
	[FinancialReportingPeriodSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_FinancialReportingPeriod]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_FinancialReportingPeriod] ON [Typelist].[FinancialReportingPeriod]
(
	[SourceSystemSK] ASC,
	[FinancialReportingPeriodNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[FinancialReportingPeriod]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_FinancialReportingPeriod] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[FinancialReportingPeriod] NOCHECK CONSTRAINT [FK_SourceSystemSK_FinancialReportingPeriod]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The financial reporting period provides for daily and monthly values.  For daily, using financialreportingperioddate, represents the accumulation of coverage, line of business,geography and transaction result located in the PremiumHeader  For monthly , using IsMonthEndInd = 1), represents summarized financial results for an Insurers financial accounting period located in EarningsDetail
' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'FinancialReportingPeriod'
GO
