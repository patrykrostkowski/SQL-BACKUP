USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[FinancialTransactionType]    Script Date: 28.10.2022 12:27:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[FinancialTransactionType](
	[FinancialTransactionTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[FinancialTransactionTypeCode] [varchar](25) NOT NULL,
	[FinancialTransactionTypeName] [varchar](50) NOT NULL,
	[FinancialTransactionTypeDesc] [varchar](100) NULL,
 CONSTRAINT [PK_RevenueCode] PRIMARY KEY CLUSTERED 
(
	[FinancialTransactionTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_RevenueCode]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_RevenueCode] ON [Typelist].[FinancialTransactionType]
(
	[SourceSystemSK] ASC,
	[FinancialTransactionTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[FinancialTransactionType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_RevenueCode] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[FinancialTransactionType] NOCHECK CONSTRAINT [FK_SourceSystemSK_RevenueCode]
GO
