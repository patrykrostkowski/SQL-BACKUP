USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[FinancialSourceTransactionType]    Script Date: 28.10.2022 13:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[FinancialSourceTransactionType](
	[FinancialSourceTransactionTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[FinancialSourceTransactionTypeCode] [varchar](20) NOT NULL,
	[FinancialSourceTransactionTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[FinancialSourceTransactionTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_TransactionType]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_TransactionType] ON [Typelist].[FinancialSourceTransactionType]
(
	[SourceSystemSK] ASC,
	[FinancialSourceTransactionTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[FinancialSourceTransactionType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_TransactionType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[FinancialSourceTransactionType] NOCHECK CONSTRAINT [FK_SourceSystemSK_TransactionType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Examples non-verfieid,  verified, other.   Non-verified will source from one or many policy administration applications.  Non-verified financials may be less accurate than audited ones.
Verified will source from the insurers General Ledger A verified financial transaction has been audited for accuracy by an independent accountant, 
attesting that the financial statement and its transactions are correct.' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'FinancialSourceTransactionType'
GO
