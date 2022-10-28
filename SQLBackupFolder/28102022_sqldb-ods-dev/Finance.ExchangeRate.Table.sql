USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[ExchangeRate]    Script Date: 28.10.2022 12:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[ExchangeRate](
	[ExchangeRateSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[FromCurrencySK] [int] NOT NULL,
	[ToCurrencySK] [int] NOT NULL,
	[ExchangePeriodMonthYear] [varchar](10) NULL,
	[ValidFromDate] [date] NULL,
	[ValidToDate] [date] NULL,
	[WritingCompanySK] [int] NULL,
	[ExchangeRateClassCode] [varchar](20) NULL,
	[FXRate] [decimal](15, 8) NULL,
	[InvertedFXRate] [decimal](15, 8) NULL,
 CONSTRAINT [PK_ExchangeRate] PRIMARY KEY CLUSTERED 
(
	[ExchangeRateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ExchangeRate]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ExchangeRate] ON [Finance].[ExchangeRate]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Finance].[ExchangeRate]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ExchangeRate] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[ExchangeRate] NOCHECK CONSTRAINT [FK_SourceSystemSK_ExchangeRate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Exchange Rate used to calcuate the value of one currency for the purpose of conversion to another.' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'ExchangeRate'
GO
