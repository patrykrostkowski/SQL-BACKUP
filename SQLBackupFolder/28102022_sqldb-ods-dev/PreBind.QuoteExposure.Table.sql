USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteExposure]    Script Date: 28.10.2022 13:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteExposure](
	[QuoteExposureSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteCoverageSK] [int] NULL,
	[ExposureTypeSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[BaseExposureAmt] [decimal](19, 4) NULL,
	[ExposureDesc] [varchar](150) NULL,
 CONSTRAINT [PK_QuoteExposure] PRIMARY KEY CLUSTERED 
(
	[QuoteExposureSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteExposure]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteExposure] ON [PreBind].[QuoteExposure]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_Currency_QuoteExposure] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [PreBind].[QuoteExposure] NOCHECK CONSTRAINT [FK_Currency_QuoteExposure]
GO
ALTER TABLE [PreBind].[QuoteExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteExposure] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteExposure] NOCHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteExposure]
GO
ALTER TABLE [PreBind].[QuoteExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteExposure] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteExposure] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteExposure]
GO
ALTER TABLE [PreBind].[QuoteExposure]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteExposure] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteExposure] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteExposure]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quote Exposure' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteExposure'
GO
