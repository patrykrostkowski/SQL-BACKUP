USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteRatingPlan]    Script Date: 02.11.2022 13:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteRatingPlan] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_BaseCurrencySK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_ClassCodeSK_QuoteRatingPlan] FOREIGN KEY([ClassCodeSK])
REFERENCES [TypeList].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_ClassCodeSK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_ExposureTypeSK_QuoteRatingPlan] FOREIGN KEY([ExposureTypeSK])
REFERENCES [TypeList].[ExposureType] ([ExposureTypeSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_ExposureTypeSK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_LevelTypeSK_QuoteRatingPlan] FOREIGN KEY([LevelTypeSK])
REFERENCES [TypeList].[LevelType] ([LevelTypeSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_LevelTypeSK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_QuoteRatingPlan] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_OriginalCurrencySK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_QuoteRatingPlan] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_PolicySK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteRatingPlan] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteRatingPlan] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteGeographySK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteRatingPlan] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteRatingPlan] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteRatingIntegrationPlanSK_QuoteRatingPlan] FOREIGN KEY([QuoteRatingIntegrationPlanSK])
REFERENCES [PreBind].[QuoteRatingIntegrationPlan] ([QuoteRatingIntegrationPlanSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteRatingIntegrationPlanSK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSK_QuoteRatingPlan] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteSK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteRatingPlan] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_QuoteRatingPlan] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_ReportingCurrencySK_QuoteRatingPlan]
GO
ALTER TABLE [PreBind].[QuoteRatingPlan]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteRatingPlan] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteRatingPlan] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteRatingPlan]
GO
