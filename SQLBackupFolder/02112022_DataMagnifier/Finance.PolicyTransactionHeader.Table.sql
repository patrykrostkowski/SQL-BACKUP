USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[PolicyTransactionHeader]    Script Date: 02.11.2022 13:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[PolicyTransactionHeader](
	[PolicyTransactionTransHeaderSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[WritingCompanySK] [int] NOT NULL,
	[FinancialReportingPeriodSK] [int] NOT NULL,
	[EntryDate] [date] NOT NULL,
	[TransactionDate] [date] NOT NULL,
	[SettlementDate] [date] NULL,
	[LastAllocationDate] [date] NULL,
	[CurrencySK] [int] NOT NULL,
	[ProductSK] [int] NULL,
	[PostedAmt] [decimal](18, 2) NOT NULL,
	[TransactionTypeSK] [int] NOT NULL,
	[EarnStartDate] [date] NULL,
	[EarnEndDate] [date] NULL,
 CONSTRAINT [PK_PolicyTransactionHeader] PRIMARY KEY CLUSTERED 
(
	[PolicyTransactionTransHeaderSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyTransactionHeader] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_CurrencySK_PolicyTransactionHeader]
GO
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_FinancialReportingPeriodSK_PolicyTransactionHeader] FOREIGN KEY([FinancialReportingPeriodSK])
REFERENCES [TypeList].[FinancialReportingPeriod] ([FinancialReportingPeriodSK])
GO
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_FinancialReportingPeriodSK_PolicyTransactionHeader]
GO
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_PolicyTransactionHeader] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_PolicySK_PolicyTransactionHeader]
GO
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_ProductSK_PolicyTransactionHeader] FOREIGN KEY([ProductSK])
REFERENCES [TypeList].[Product] ([ProductSK])
GO
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_ProductSK_PolicyTransactionHeader]
GO
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransactionHeader] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransactionHeader]
GO
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_TransactionTypeSK_PolicyTransactionHeader] FOREIGN KEY([TransactionTypeSK])
REFERENCES [TypeList].[TransactionType] ([TransactionTypeSK])
GO
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_TransactionTypeSK_PolicyTransactionHeader]
GO
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_PolicyTransactionHeader] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_WritingCompanySK_PolicyTransactionHeader]
GO
