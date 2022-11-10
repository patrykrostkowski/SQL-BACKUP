USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[RatingPlan]    Script Date: 10.11.2022 14:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[RatingPlan]') AND type in (N'U'))
BEGIN
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
	[RatingPlanDesc] [varchar](100) NULL,
	[RatingBasisCode] [varchar](25) NULL,
	[RatingIntegrationPlanSK] [int] NULL,
	[QuoteSK] [int] NULL,
	[PolicySK] [int] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NULL,
	[PolicyGeographySK] [int] NULL,
	[PolicyInsurableObjectSK] [int] NULL,
	[PolicyCoverageSK] [int] NULL,
	[LevelTypeSK] [int] NOT NULL,
	[ClassCodeSK] [int] NOT NULL,
	[ClassCode] [varchar](4) NOT NULL,
	[ClassCodeDesc] [varchar](50) NULL,
	[MajorClassCode] [varchar](25) NULL,
	[ClassExceptionCode] [varchar](25) NULL,
	[ClassCodeEffectiveDate] [date] NULL,
	[ClassCodeExpirationDate] [date] NULL,
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_RatingPlan] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_BaseCurrencySK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ClassCodeSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_ClassCodeSK_RatingPlan] FOREIGN KEY([ClassCodeSK])
REFERENCES [TypeList].[ClassCode] ([ClassCodeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ClassCodeSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_ClassCodeSK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ExposureTypeSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_ExposureTypeSK_RatingPlan] FOREIGN KEY([ExposureTypeSK])
REFERENCES [TypeList].[ExposureType] ([ExposureTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ExposureTypeSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_ExposureTypeSK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_LevelTypeSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_LevelTypeSK_RatingPlan] FOREIGN KEY([LevelTypeSK])
REFERENCES [TypeList].[LevelType] ([LevelTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_LevelTypeSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_LevelTypeSK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_RatingPlan] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_OriginalCurrencySK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_RatingPlan] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_PolicyCoverageSK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_RatingPlan] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyGeographySK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_PolicyGeographySK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_RatingPlan] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyInsurableObjectSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_RatingPlan] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyLineofBusinessSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicySK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_RatingPlan] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicySK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_PolicySK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_RatingPlan] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_PolicyTransSK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_QuoteSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSK_RatingPlan] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_QuoteSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_QuoteSK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_RatingIntegrationPlanSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_RatingIntegrationPlanSK_RatingPlan] FOREIGN KEY([RatingIntegrationPlanSK])
REFERENCES [Policy].[RatingIntegrationPlan] ([RatingIntegrationPlanSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_RatingIntegrationPlanSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_RatingIntegrationPlanSK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_RatingPlan] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_ReportingCurrencySK_RatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_RatingPlan] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_RatingPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlan]'))
ALTER TABLE [Policy].[RatingPlan] CHECK CONSTRAINT [FK_SourceSystemSK_RatingPlan]
GO
