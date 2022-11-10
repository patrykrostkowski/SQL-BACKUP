USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[PolicyTransactionDetail]    Script Date: 10.11.2022 14:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[PolicyTransactionDetail](
	[PolicyTransactionDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransactionTransHeaderSK] [int] NOT NULL,
	[CurrencySK] [int] NOT NULL,
	[RevenueCodeSK] [int] NOT NULL,
	[PolicyCoverageSK] [int] NULL,
	[PolicySubCoverageSK] [int] NULL,
	[TransactionAmt] [decimal](18, 2) NOT NULL,
	[ShareofWholePct] [decimal](8, 4) NULL,
	[ProfitAnalysisSK] [int] NULL,
	[DepartmentSK] [int] NULL,
	[IndustryGroupSK] [int] NULL,
 CONSTRAINT [PK_PolicyTransactionDetail] PRIMARY KEY CLUSTERED 
(
	[PolicyTransactionDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyTransactionDetail] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_CurrencySK_PolicyTransactionDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyCoverageSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyTransactionDetail] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyCoverageSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyTransactionDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySubCoverageSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicySubCoverageSK_PolicyTransactionDetail] FOREIGN KEY([PolicySubCoverageSK])
REFERENCES [Policy].[PolicySubCoverage] ([PolicySubCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySubCoverageSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_PolicySubCoverageSK_PolicyTransactionDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyTransactionTransHeaderSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransactionTransHeaderSK_PolicyTransactionDetail] FOREIGN KEY([PolicyTransactionTransHeaderSK])
REFERENCES [Finance].[PolicyTransactionHeader] ([PolicyTransactionTransHeaderSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicyTransactionTransHeaderSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_PolicyTransactionTransHeaderSK_PolicyTransactionDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProfitAnalysisSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_PolicyTransactionDetail] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProfitAnalysisSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_ProfitAnalysisSK_PolicyTransactionDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_RevenueCodeSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_RevenueCodeSK_PolicyTransactionDetail] FOREIGN KEY([RevenueCodeSK])
REFERENCES [TypeList].[RevenueCode] ([RevenueCodeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_RevenueCodeSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_RevenueCodeSK_PolicyTransactionDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransactionDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_PolicyTransactionDetail]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionDetail]'))
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransactionDetail]
GO
