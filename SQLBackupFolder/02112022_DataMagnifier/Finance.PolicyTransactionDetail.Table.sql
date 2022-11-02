USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[PolicyTransactionDetail]    Script Date: 02.11.2022 14:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyTransactionDetail] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_CurrencySK_PolicyTransactionDetail]
GO
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_PolicyTransactionDetail] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_PolicyCoverageSK_PolicyTransactionDetail]
GO
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicySubCoverageSK_PolicyTransactionDetail] FOREIGN KEY([PolicySubCoverageSK])
REFERENCES [Policy].[PolicySubCoverage] ([PolicySubCoverageSK])
GO
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_PolicySubCoverageSK_PolicyTransactionDetail]
GO
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransactionTransHeaderSK_PolicyTransactionDetail] FOREIGN KEY([PolicyTransactionTransHeaderSK])
REFERENCES [Finance].[PolicyTransactionHeader] ([PolicyTransactionTransHeaderSK])
GO
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_PolicyTransactionTransHeaderSK_PolicyTransactionDetail]
GO
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_PolicyTransactionDetail] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_ProfitAnalysisSK_PolicyTransactionDetail]
GO
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_RevenueCodeSK_PolicyTransactionDetail] FOREIGN KEY([RevenueCodeSK])
REFERENCES [TypeList].[RevenueCode] ([RevenueCodeSK])
GO
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_RevenueCodeSK_PolicyTransactionDetail]
GO
ALTER TABLE [Finance].[PolicyTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransactionDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[PolicyTransactionDetail] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransactionDetail]
GO
