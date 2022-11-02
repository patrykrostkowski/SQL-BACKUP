USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[ExchangeRate]    Script Date: 02.11.2022 14:07:31 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SourceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Finance].[ExchangeRate]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ExchangeRate] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[ExchangeRate] CHECK CONSTRAINT [FK_SourceSystemSK_ExchangeRate]
GO
