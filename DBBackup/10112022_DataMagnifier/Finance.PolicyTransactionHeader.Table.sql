USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[PolicyTransactionHeader]    Script Date: 10.11.2022 14:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_CurrencySK_PolicyTransactionHeader] FOREIGN KEY([CurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_CurrencySK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_CurrencySK_PolicyTransactionHeader]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_FinancialReportingPeriodSK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_FinancialReportingPeriodSK_PolicyTransactionHeader] FOREIGN KEY([FinancialReportingPeriodSK])
REFERENCES [TypeList].[FinancialReportingPeriod] ([FinancialReportingPeriodSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_FinancialReportingPeriodSK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_FinancialReportingPeriodSK_PolicyTransactionHeader]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_PolicyTransactionHeader] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_PolicySK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_PolicySK_PolicyTransactionHeader]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProductSK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_ProductSK_PolicyTransactionHeader] FOREIGN KEY([ProductSK])
REFERENCES [TypeList].[Product] ([ProductSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ProductSK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_ProductSK_PolicyTransactionHeader]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransactionHeader] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransactionHeader]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_TransactionTypeSK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_TransactionTypeSK_PolicyTransactionHeader] FOREIGN KEY([TransactionTypeSK])
REFERENCES [TypeList].[TransactionType] ([TransactionTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_TransactionTypeSK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_TransactionTypeSK_PolicyTransactionHeader]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader]  WITH CHECK ADD  CONSTRAINT [FK_WritingCompanySK_PolicyTransactionHeader] FOREIGN KEY([WritingCompanySK])
REFERENCES [Party].[WritingCompany] ([WritingCompanySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_WritingCompanySK_PolicyTransactionHeader]') AND parent_object_id = OBJECT_ID(N'[Finance].[PolicyTransactionHeader]'))
ALTER TABLE [Finance].[PolicyTransactionHeader] CHECK CONSTRAINT [FK_WritingCompanySK_PolicyTransactionHeader]
GO
