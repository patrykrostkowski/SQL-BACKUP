USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[RatingIntegrationPlan]    Script Date: 28.10.2022 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[RatingIntegrationPlan](
	[RatingIntegrationPlanSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[RatingIntegrationPlanDesc] [varchar](100) NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[RatingIntegrationPlanBaseAmt] [decimal](19, 4) NOT NULL,
	[RatingIntegrationPlanOriginalAmt] [decimal](19, 4) NULL,
	[RatingIntegrationPlanReportingAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_RatingIntegrationPlan] PRIMARY KEY CLUSTERED 
(
	[RatingIntegrationPlanSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_RatingIntegrationPlan]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_RatingIntegrationPlan] ON [Policy].[RatingIntegrationPlan]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[RatingIntegrationPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_RatingIntegrationPlan] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[RatingIntegrationPlan] NOCHECK CONSTRAINT [FK_BaseCurrencySK_RatingIntegrationPlan]
GO
ALTER TABLE [Policy].[RatingIntegrationPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_RatingIntegrationPlan] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[RatingIntegrationPlan] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_RatingIntegrationPlan]
GO
ALTER TABLE [Policy].[RatingIntegrationPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_RatingIntegrationPlan] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[RatingIntegrationPlan] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_RatingIntegrationPlan]
GO
ALTER TABLE [Policy].[RatingIntegrationPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_RatingIntegrationPlan] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[RatingIntegrationPlan] NOCHECK CONSTRAINT [FK_SourceSystemSK_RatingIntegrationPlan]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Theintegration of multiple rating plans' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'RatingIntegrationPlan'
GO
