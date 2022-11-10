USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteRatingPlan]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]') AND type in (N'U'))
BEGIN
CREATE TABLE [PreBind].[QuoteRatingPlan](
	[QuoteRatingPlanSK] [int] IDENTITY(2,1) NOT NULL,
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
	[RatingBasisCode] [varchar](25) NULL,
	[RatingPlanDesc] [varchar](100) NULL,
	[QuoteRatingIntegrationPlanSK] [int] NULL,
	[QuoteSK] [int] NOT NULL,
	[PolicySK] [int] NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteLineofBusinessSK] [int] NULL,
	[QuoteGeographySK] [int] NULL,
	[QuoteInsurableObjectSK] [int] NULL,
	[QuoteCoverageSK] [int] NULL,
	[LevelTypeSK] [int] NOT NULL,
	[RatingPlanBaseAmt] [decimal](19, 4) NULL,
	[ClassCodeSK] [int] NOT NULL,
	[ClassCode] [varchar](4) NOT NULL,
	[ClassCodeDesc] [varchar](50) NULL,
	[MajorClassCode] [varchar](25) NULL,
	[ClassExceptionCode] [varchar](25) NULL,
	[ClassCodeEffectiveDate] [date] NULL,
	[ClassCodeExpirationDate] [date] NULL,
	[ExposureTypeSK] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
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
 CONSTRAINT [PK_QuoteRatingPlan] PRIMARY KEY CLUSTERED 
(
	[QuoteRatingPlanSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteRatingPlan] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_BaseCurrencySK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_ClassCodeSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_ClassCodeSK_QuoteRatingPlan] FOREIGN KEY([ClassCodeSK])
REFERENCES [TypeList].[ClassCode] ([ClassCodeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_ClassCodeSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_ClassCodeSK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_ExposureTypeSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_ExposureTypeSK_QuoteRatingPlan] FOREIGN KEY([ExposureTypeSK])
REFERENCES [TypeList].[ExposureType] ([ExposureTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_ExposureTypeSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_ExposureTypeSK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_LevelTypeSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_LevelTypeSK_QuoteRatingPlan] FOREIGN KEY([LevelTypeSK])
REFERENCES [TypeList].[LevelType] ([LevelTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_LevelTypeSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_LevelTypeSK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_OriginalCurrencySK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_QuoteRatingPlan] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_OriginalCurrencySK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_OriginalCurrencySK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_PolicySK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_QuoteRatingPlan] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_PolicySK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_PolicySK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteRatingPlan] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteGeographySK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteRatingPlan] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteGeographySK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteGeographySK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteRatingPlan] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteLineofBusinessSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteRatingPlan] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteLineofBusinessSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteRatingIntegrationPlanSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteRatingIntegrationPlanSK_QuoteRatingPlan] FOREIGN KEY([QuoteRatingIntegrationPlanSK])
REFERENCES [PreBind].[QuoteRatingIntegrationPlan] ([QuoteRatingIntegrationPlanSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteRatingIntegrationPlanSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteRatingIntegrationPlanSK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSK_QuoteRatingPlan] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteSK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteRatingPlan] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_ReportingCurrencySK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_QuoteRatingPlan] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_ReportingCurrencySK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_ReportingCurrencySK_QuoteRatingPlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteRatingPlan] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteRatingPlan]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteRatingPlan]'))
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteRatingPlan]
GO
