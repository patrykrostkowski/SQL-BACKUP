USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[FinancialReportingPeriod]    Script Date: 02.11.2022 14:17:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[FinancialReportingPeriod](
	[FinancialReportingPeriodSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[FinancialReportingPeriodNum] [varchar](10) NOT NULL,
	[FinancialReportingYearNum] [varchar](10) NOT NULL,
	[FinancialReportingQuarterNum] [varchar](10) NOT NULL,
	[FinancialReportingPeriodDate] [date] NOT NULL,
	[FinancialReportingPeriodLabelMMDDYYYYAbrv] [varchar](25) NULL,
	[FinancialReportingPeriodrYearQuarterLabelYYYYQAbrv] [varchar](25) NULL,
	[FinancialReportingPeriodYearQuarterName] [varchar](25) NULL,
	[FinancialReportingPeriodYearMonthLabelYYYYMMAbrv] [varchar](25) NULL,
	[FinancialReportingPeriodYearMonthName] [varchar](25) NULL,
 CONSTRAINT [PK_FinancialReportingPeriod] PRIMARY KEY CLUSTERED 
(
	[FinancialReportingPeriodSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[FinancialReportingPeriod]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_FinancialReportingPeriod] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[FinancialReportingPeriod] CHECK CONSTRAINT [FK_SourceSystemSK_FinancialReportingPeriod]
GO
