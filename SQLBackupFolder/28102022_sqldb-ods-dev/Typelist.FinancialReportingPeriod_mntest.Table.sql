USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[FinancialReportingPeriod_mntest]    Script Date: 28.10.2022 13:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[FinancialReportingPeriod_mntest](
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
 CONSTRAINT [PK_FinancialReportingPeriod_mntest] PRIMARY KEY CLUSTERED 
(
	[FinancialReportingPeriodSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
