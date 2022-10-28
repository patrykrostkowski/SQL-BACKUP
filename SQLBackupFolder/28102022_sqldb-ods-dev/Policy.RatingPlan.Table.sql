USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[RatingPlan]    Script Date: 28.10.2022 13:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[RatingPlan](
	[RatingPlanSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[RatingPlanKeyCode] [varchar](25) NULL,
	[RatingPlanKeyDesc] [varchar](100) NULL,
	[RatingBasisCode] [varchar](25) NULL,
	[RatingIntegrationPlanSK] [int] NOT NULL,
	[QuoteSK] [int] NULL,
	[PolicySK] [int] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NULL,
	[PolicyGeographySK] [int] NULL,
	[PolicyInsurableObjectSK] [int] NULL,
	[PolicyCoverageSK] [int] NULL,
	[LevelTypeSK] [int] NOT NULL,
	[ClassCodeSK] [int] NULL,
	[ClassCodeEffectiveDate] [date] NULL,
	[ClassCodeExpirationDate] [date] NULL,
	[StatCodeSK] [int] NULL,
	[StatCodeEffectiveDate] [date] NULL,
	[StatCodeExpirationDate] [date] NULL,
	[MajorClassCode] [varchar](25) NULL,
	[ClassExceptionCode] [varchar](25) NULL,
	[ExposureTypeSK] [int] NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[RatingPlanBaseAmt] [decimal](19, 4) NULL,
	[RatingPlanOriginalAmt] [decimal](19, 4) NULL,
	[RatingPlanReportingAmt] [decimal](19, 4) NULL,
	[TermPremiumBaseAmt] [decimal](19, 4) NULL,
	[MinimumPremiumBaseAmt] [decimal](19, 4) NULL,
	[EstimatedWrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[ModifiedTermPremiumBaseAmt] [decimal](19, 4) NULL,
	[AnnualExpenseBaseAmt] [decimal](19, 4) NULL,
	[MinimumPremiumOverrideBaseAmt] [decimal](19, 4) NULL,
	[OOSOffsetPremiumAmt] [decimal](19, 4) NULL,
	[OOSFuturePremAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_RatingPlan] PRIMARY KEY CLUSTERED 
(
	[RatingPlanSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_RatingPlan]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_RatingPlan] ON [Policy].[RatingPlan]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_RatingPlan] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_BaseCurrencySK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_ClassCodeSK_RatingPlan] FOREIGN KEY([ClassCodeSK])
REFERENCES [Typelist].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_ClassCodeSK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_ExposureTypeSK_RatingPlan] FOREIGN KEY([ExposureTypeSK])
REFERENCES [Typelist].[ExposureType] ([ExposureTypeSK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_ExposureTypeSK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_LevelTypeSK_RatingPlan] FOREIGN KEY([LevelTypeSK])
REFERENCES [Typelist].[LevelType] ([LevelTypeSK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_LevelTypeSK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_RatingPlan] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_RatingPlan] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_PolicyCoverageSK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyGeographySK_RatingPlan] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_PolicyGeographySK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_RatingPlan] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_PolicyInsurableObjectSK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_RatingPlan] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_PolicyLineofBusinessSK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_RatingPlan] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_PolicySK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_RatingPlan] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_PolicyTransSK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteSK_RatingPlan] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_QuoteSK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_RatingIntegrationPlanSK_RatingPlan] FOREIGN KEY([RatingIntegrationPlanSK])
REFERENCES [Policy].[RatingIntegrationPlan] ([RatingIntegrationPlanSK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_RatingIntegrationPlanSK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_RatingPlan] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_RatingPlan] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_SourceSystemSK_RatingPlan]
GO
ALTER TABLE [Policy].[RatingPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_StatCodeFK_RatingPlan] FOREIGN KEY([StatCodeSK])
REFERENCES [Typelist].[StatCode] ([StatCodeSK])
GO
ALTER TABLE [Policy].[RatingPlan] NOCHECK CONSTRAINT [FK_StatCodeFK_RatingPlan]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The policy rate factors' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'RatingPlan'
GO
