USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[TreatyFinancialTransaction]    Script Date: 31.10.2022 13:29:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[TreatyFinancialTransaction](
	[TreatyFinancialTransactionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[TreatySectionSK] [int] NULL,
	[ProfitAnalysisSK] [int] NULL,
	[ClassofBusinessSK] [int] NOT NULL,
	[LineofBusinessSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[CedingCompanySK] [int] NOT NULL,
	[SegmentCode] [varchar](20) NOT NULL,
	[GLAccountCode] [varchar](20) NOT NULL,
	[BusinessTypeCode] [varchar](20) NULL,
	[RevenueCodeSK] [int] NOT NULL,
	[TransactionBaseAmt] [decimal](18, 2) NULL,
	[TransactionDate] [date] NOT NULL,
	[PostingDate] [date] NOT NULL,
 CONSTRAINT [PK_TreatyFinancialTransaction] PRIMARY KEY CLUSTERED 
(
	[TreatyFinancialTransactionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ClassofBusinessSK] ASC,
	[TransactionDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_TreatyFinancialTransaction] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction] CHECK CONSTRAINT [FK_BaseCurrencySK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_CedingCompanySK_TreatyFinancialTransaction] FOREIGN KEY([CedingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction] CHECK CONSTRAINT [FK_CedingCompanySK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ClassofBusinessSK_TreatyFinancialTransaction] FOREIGN KEY([ClassofBusinessSK])
REFERENCES [TypeList].[ClassofBusiness] ([ClassofBusinessSK])
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction] CHECK CONSTRAINT [FK_ClassofBusinessSK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_LineofBusinessSK_TreatyFinancialTransaction] FOREIGN KEY([LineofBusinessSK])
REFERENCES [TypeList].[LineofBusiness] ([LineofBusinessSK])
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction] CHECK CONSTRAINT [FK_LineofBusinessSK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_ProfitAnalysisSK_TreatyFinancialTransaction] FOREIGN KEY([ProfitAnalysisSK])
REFERENCES [TypeList].[ProfitAnalysis] ([ProfitAnalysisSK])
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction] CHECK CONSTRAINT [FK_ProfitAnalysisSK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_RevenueCodeSK_TreatyFinancialTransaction] FOREIGN KEY([RevenueCodeSK])
REFERENCES [TypeList].[RevenueCode] ([RevenueCodeSK])
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction] CHECK CONSTRAINT [FK_RevenueCodeSK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_TreatyFinancialTransaction] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction] CHECK CONSTRAINT [FK_SourceSystemSK_TreatyFinancialTransaction]
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_TreatySectionSK_TreatyFinancialTransaction] FOREIGN KEY([TreatySectionSK])
REFERENCES [Reins].[TreatySection] ([TreatySectionSK])
GO
ALTER TABLE [Finance].[TreatyFinancialTransaction] CHECK CONSTRAINT [FK_TreatySectionSK_TreatyFinancialTransaction]
GO
