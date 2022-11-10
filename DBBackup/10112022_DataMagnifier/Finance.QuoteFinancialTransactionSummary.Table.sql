USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[QuoteFinancialTransactionSummary]    Script Date: 10.11.2022 14:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]') AND type in (N'U'))
BEGIN
CREATE TABLE [Finance].[QuoteFinancialTransactionSummary](
	[QuoteFinancialTransactionSummarySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteSK] [int] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteLifecycleTypeSK] [int] NULL,
	[QuoteLifecycleTypeCode] [varchar](20) NULL,
	[UnderwritingStatusSK] [int] NULL,
	[WritingCompanySK] [int] NOT NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[QuoteLineofBusinessSK] [int] NOT NULL,
	[QuoteGeographySK] [int] NULL,
	[QuoteCoverageSK] [int] NULL,
	[TransactionLevelSK] [int] NOT NULL,
	[TransactionTypeSK] [int] NOT NULL,
	[TransactionBaseAmt] [decimal](19, 4) NOT NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[WrittenDate] [date] NULL,
 CONSTRAINT [PK_QuoteFinancialTransactionSummary] PRIMARY KEY CLUSTERED 
(
	[QuoteFinancialTransactionSummarySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SourceCode] ASC,
	[QuoteSK] ASC,
	[QuoteTransSK] ASC,
	[TransactionTypeSK] ASC,
	[TransactionLevelSK] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BaseCurrencySK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteFinancialTransactionSummary] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BaseCurrencySK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_BaseCurrencySK_QuoteFinancialTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteCoverageSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteCoverageSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteFinancialTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteGeographySK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteGeographySK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_QuoteGeographySK_QuoteFinancialTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteLifecycleTypeSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLifecycleTypeSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteLifecycleTypeSK])
REFERENCES [TypeList].[QuoteLifecycleType] ([QuoteLifecycleTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteLifecycleTypeSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_QuoteLifecycleTypeSK_QuoteFinancialTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteLineofBusinessSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteLineofBusinessSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteFinancialTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_QuoteSK_QuoteFinancialTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteTransSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteFinancialTransactionSummary] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_QuoteTransSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteFinancialTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteFinancialTransactionSummary] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteFinancialTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_TransactionTypeSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_TransactionTypeSK_QuoteFinancialTransactionSummary] FOREIGN KEY([TransactionTypeSK])
REFERENCES [TypeList].[TransactionType] ([TransactionTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_TransactionTypeSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_TransactionTypeSK_QuoteFinancialTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_UnderwritingStatusSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_UnderwritingStatusSK_QuoteFinancialTransactionSummary] FOREIGN KEY([UnderwritingStatusSK])
REFERENCES [TypeList].[UnderwritingStatus] ([UnderwritingStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_UnderwritingStatusSK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_UnderwritingStatusSK_QuoteFinancialTransactionSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_QuoteFinancialTransactionSummary] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_QuoteFinancialTransactionSummary]') AND parent_object_id = OBJECT_ID(N'[Finance].[QuoteFinancialTransactionSummary]'))
ALTER TABLE [Finance].[QuoteFinancialTransactionSummary] CHECK CONSTRAINT [FK_WritingCompanySK_QuoteFinancialTransactionSummary]
GO
