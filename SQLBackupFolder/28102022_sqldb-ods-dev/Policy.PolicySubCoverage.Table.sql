USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicySubCoverage]    Script Date: 28.10.2022 15:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicySubCoverage](
	[PolicySubCoverageSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyCoverageSK] [int] NOT NULL,
	[SubCoverageSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[WrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[WrittenPremiumOriginalAmt] [decimal](19, 4) NULL,
	[WrittenPremiumReportingAmt] [decimal](19, 4) NULL,
	[AddlRetPremBaseAmt] [decimal](19, 4) NULL,
	[AddlRetPremOriginalAmt] [decimal](19, 4) NULL,
	[AddlRetPremReportingAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_PolicySubCoverage] PRIMARY KEY CLUSTERED 
(
	[PolicySubCoverageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicySubCoverage]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicySubCoverage] ON [Policy].[PolicySubCoverage]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicySubCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicySubCoverage] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicySubCoverage] NOCHECK CONSTRAINT [FK_BaseCurrencySK_PolicySubCoverage]
GO
ALTER TABLE [Policy].[PolicySubCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicySubCoverage] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicySubCoverage] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_PolicySubCoverage]
GO
ALTER TABLE [Policy].[PolicySubCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicySubCoverage] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Policy].[PolicySubCoverage] NOCHECK CONSTRAINT [FK_PolicyCoverageSK_PolicySubCoverage]
GO
ALTER TABLE [Policy].[PolicySubCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicySubCoverage] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Policy].[PolicySubCoverage] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_PolicySubCoverage]
GO
ALTER TABLE [Policy].[PolicySubCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicySubCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicySubCoverage] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicySubCoverage]
GO
ALTER TABLE [Policy].[PolicySubCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_SubCoverageSK_PolicySubCoverage] FOREIGN KEY([SubCoverageSK])
REFERENCES [Typelist].[SubCoverage] ([SubCoverageSK])
GO
ALTER TABLE [Policy].[PolicySubCoverage] NOCHECK CONSTRAINT [FK_SubCoverageSK_PolicySubCoverage]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A policy risk management sub-component of a coverage.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicySubCoverage'
GO
