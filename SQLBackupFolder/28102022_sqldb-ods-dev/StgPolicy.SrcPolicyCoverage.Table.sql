USE [sqldb-ods-dev]
GO
/****** Object:  Table [StgPolicy].[SrcPolicyCoverage]    Script Date: 28.10.2022 15:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StgPolicy].[SrcPolicyCoverage](
	[SourceSystemCode] [nvarchar](255) NULL,
	[SourceCode] [nvarchar](255) NULL,
	[ProcessDateTime] [datetime] NULL,
	[PolicyTransSourceCode] [nvarchar](255) NULL,
	[LineOfBusinessSourceCode] [nvarchar](255) NULL,
	[GeographySourceCode] [nvarchar](255) NULL,
	[InsurableObjectSourceCode] [nvarchar](255) NULL,
	[SubLineCode] [nvarchar](255) NULL,
	[AnnualStatementLineofBusinessCode] [nvarchar](255) NULL,
	[CoverageCode] [nvarchar](255) NULL,
	[CoverageClassCode] [nvarchar](255) NULL,
	[CoverageGroupCode] [nvarchar](255) NULL,
	[CoverageTriggerCode] [nvarchar](255) NULL,
	[Classcode] [nvarchar](255) NULL,
	[EffectiveDate] [nvarchar](255) NULL,
	[ExpirationDate] [nvarchar](255) NULL,
	[CancellationDate] [nvarchar](255) NULL,
	[IsMajorCoverageInd] [nvarchar](255) NULL,
	[CurrentTermBaseAmt] [nvarchar](255) NULL,
	[CurrentTermOriginalAmt] [nvarchar](255) NULL,
	[CurrentTermReportingAmt] [nvarchar](255) NULL,
	[BaseCurrencyCode] [nvarchar](255) NULL,
	[OriginalCurrencyCode] [nvarchar](255) NULL,
	[ReportingCurrencyCode] [nvarchar](255) NULL,
	[WrittenPremiumBaseAmt] [nvarchar](255) NULL,
	[WrittenPremiumOriginalAmt] [nvarchar](255) NULL,
	[WrittenPremiumReportingAmt] [nvarchar](255) NULL,
	[IsIncludedInPremiumInd] [nvarchar](255) NULL,
	[IsMineSubsidenceInd] [nvarchar](255) NULL,
	[AddlRetPremBaseAmt] [nvarchar](255) NULL,
	[AddlRetPremOriginalAmt] [nvarchar](255) NULL,
	[AddlRetPremReportingAmt] [nvarchar](255) NULL,
	[IsValidInd] [tinyint] NULL
) ON [PRIMARY]
GO
