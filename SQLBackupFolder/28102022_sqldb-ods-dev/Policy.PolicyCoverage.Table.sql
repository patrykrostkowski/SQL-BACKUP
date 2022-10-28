USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyCoverage]    Script Date: 28.10.2022 15:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyCoverage](
	[PolicyCoverageSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NULL,
	[PolicyGeographySK] [int] NULL,
	[PolicyInsurableObjectSK] [int] NULL,
	[PolicySubLineSK] [int] NULL,
	[AnnualStatementLineofBusinessSK] [int] NULL,
	[CoverageSK] [int] NULL,
	[CoverageClassSK] [int] NULL,
	[CoverageGroupSK] [int] NULL,
	[CoverageTriggerSK] [int] NULL,
	[ClassCodeSK] [int] NULL,
	[StatCodeSK] [int] NULL,
	[ClassCode] [varchar](20) NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[CancellationDate] [date] NULL,
	[IsMajorCoverageInd] [tinyint] NULL,
	[CurrentTermBaseAmt] [decimal](19, 4) NULL,
	[CurrentTermOriginalAmt] [decimal](19, 4) NULL,
	[CurrentTermReportingAmt] [decimal](19, 4) NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[WrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[WrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[WrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[IsIncludedInPremiumInd] [tinyint] NULL,
	[IsMineSubsidenceInd] [tinyint] NULL,
	[AddlRetPremBaseAmt] [decimal](19, 4) NULL,
	[AddlRetPremOriginalAmt] [decimal](19, 4) NULL,
	[AddlRetPremReportingAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_PolicyCoverage] PRIMARY KEY CLUSTERED 
(
	[PolicyCoverageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyCoverage]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyCoverage] ON [Policy].[PolicyCoverage]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_AnnualStatementLineofBusinessSK_PolicyCoverage] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [Typelist].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_AnnualStatementLineofBusinessSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyCoverage] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_BaseCurrencySK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_ClassCodeSK_PolicyCoverage] FOREIGN KEY([ClassCodeSK])
REFERENCES [Typelist].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_ClassCodeSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageClassSK_PolicyCoverage] FOREIGN KEY([CoverageClassSK])
REFERENCES [Typelist].[CoverageClass] ([CoverageClassSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_CoverageClassSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageGroupSK_PolicyCoverage] FOREIGN KEY([CoverageGroupSK])
REFERENCES [Typelist].[CoverageGroup] ([CoverageGroupSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_CoverageGroupSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageSK_PolicyCoverage] FOREIGN KEY([CoverageSK])
REFERENCES [Typelist].[Coverage] ([CoverageSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_CoverageSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_PolicyCoverage] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [Typelist].[CoverageTrigger] ([CoverageTriggerSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_CoverageTriggerSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicyCoverage] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyCoverage] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_PolicyGeographySK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyCoverage] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyCoverage] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySubLineSK_PolicyCoverage] FOREIGN KEY([PolicySubLineSK])
REFERENCES [Policy].[PolicySubLine] ([PolicySubLineSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_PolicySubLineSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyCoverage] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicyCoverage] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_StateCcodeSK_PolicyCoverage] FOREIGN KEY([StatCodeSK])
REFERENCES [Typelist].[StatCode] ([StatCodeSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] NOCHECK CONSTRAINT [FK_StateCcodeSK_PolicyCoverage]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A policy risk management component detailing the circumstances under which a claim benefit will be paid. Effectively this provides protection against a particular risk. In property insurance, coverage identifies elements such as perils insured against, properties covered, locations covered, individuals insured and the limits of indemnification.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyCoverage'
GO
