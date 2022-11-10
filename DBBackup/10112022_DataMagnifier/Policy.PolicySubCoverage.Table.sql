USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicySubCoverage]    Script Date: 10.11.2022 14:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]') AND type in (N'U'))
BEGIN
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
 CONSTRAINT [PK_PolicySubCoverage] PRIMARY KEY CLUSTERED 
(
	[PolicySubCoverageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_PolicySubCoverage] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_BaseCurrencySK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage] CHECK CONSTRAINT [FK_BaseCurrencySK_PolicySubCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_PolicySubCoverage] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_OriginalCurrencySK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage] CHECK CONSTRAINT [FK_OriginalCurrencySK_PolicySubCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicySubCoverage] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicySubCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_PolicySubCoverage] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReportingCurrencySK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage] CHECK CONSTRAINT [FK_ReportingCurrencySK_PolicySubCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicySubCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage] CHECK CONSTRAINT [FK_SourceSystemSK_PolicySubCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SubCoverageSK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage]  WITH CHECK ADD  CONSTRAINT [FK_SubCoverageSK_PolicySubCoverage] FOREIGN KEY([SubCoverageSK])
REFERENCES [TypeList].[SubCoverage] ([SubCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SubCoverageSK_PolicySubCoverage]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicySubCoverage]'))
ALTER TABLE [Policy].[PolicySubCoverage] CHECK CONSTRAINT [FK_SubCoverageSK_PolicySubCoverage]
GO
