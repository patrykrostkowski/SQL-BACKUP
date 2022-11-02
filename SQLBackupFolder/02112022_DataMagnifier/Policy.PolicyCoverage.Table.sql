USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyCoverage]    Script Date: 02.11.2022 13:09:44 ******/
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
	[CoverageSK] [int] NOT NULL,
	[CoverageClassSK] [int] NULL,
	[CoverageGroupSK] [int] NULL,
	[CoverageTriggerSK] [int] NULL,
	[ClassCodeSK] [int] NULL,
	[Classcode] [varchar](20) NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[CancellationDate] [date] NULL,
	[IsMajorCoverageInd] [int] NULL,
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
 CONSTRAINT [PK_PolicyCoverage] PRIMARY KEY CLUSTERED 
(
	[PolicyCoverageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_AnnualStatementLineofBusinessSK_PolicyCoverage] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [TypeList].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_AnnualStatementLineofBusinessSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicyCoverage] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_BaseCurrencySK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_ClassCodeSK_PolicyCoverage] FOREIGN KEY([ClassCodeSK])
REFERENCES [TypeList].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_ClassCodeSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_CoverageClassSK_PolicyCoverage] FOREIGN KEY([CoverageClassSK])
REFERENCES [TypeList].[CoverageClass] ([CoverageClassSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_CoverageClassSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_CoverageGroupSK_PolicyCoverage] FOREIGN KEY([CoverageGroupSK])
REFERENCES [TypeList].[CoverageGroup] ([CoverageGroupSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_CoverageGroupSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_CoverageSK_PolicyCoverage] FOREIGN KEY([CoverageSK])
REFERENCES [TypeList].[Coverage] ([CoverageSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_CoverageSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_PolicyCoverage] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [TypeList].[CoverageTrigger] ([CoverageTriggerSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_CoverageTriggerSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicyCoverage] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_OriginalCurrencySK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_PolicyGeographySK_PolicyCoverage] FOREIGN KEY([PolicyGeographySK])
REFERENCES [Policy].[PolicyGeography] ([PolicyGeographySK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_PolicyGeographySK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyCoverage] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyCoverage] FOREIGN KEY([PolicyLineofBusinessSK])
REFERENCES [Policy].[PolicyLineofBusiness] ([PolicyLineofBusinessSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_PolicyLineofBusinessSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_PolicySubLineSK_PolicyCoverage] FOREIGN KEY([PolicySubLineSK])
REFERENCES [Policy].[PolicySubLine] ([PolicySubLineSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_PolicySubLineSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyCoverage] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicyCoverage] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_ReportingCurrencySK_PolicyCoverage]
GO
ALTER TABLE [Policy].[PolicyCoverage]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyCoverage] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyCoverage]
GO
