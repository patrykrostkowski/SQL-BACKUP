USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteRate]    Script Date: 28.10.2022 11:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteRate](
	[QuoteRateSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteCoverageSK] [int] NULL,
	[RateLevelSK] [int] NOT NULL,
	[RateTypeSK] [int] NOT NULL,
	[RateAmt] [decimal](19, 4) NOT NULL,
	[RateDesc] [varchar](255) NULL,
	[CoverageClassSK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteRate] PRIMARY KEY CLUSTERED 
(
	[QuoteRateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteRate]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteRate] ON [PreBind].[QuoteRate]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteRate]  WITH NOCHECK ADD  CONSTRAINT [FK_CoverageClassSK_QuoteRate] FOREIGN KEY([CoverageClassSK])
REFERENCES [Typelist].[CoverageClass] ([CoverageClassSK])
GO
ALTER TABLE [PreBind].[QuoteRate] NOCHECK CONSTRAINT [FK_CoverageClassSK_QuoteRate]
GO
ALTER TABLE [PreBind].[QuoteRate]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteRate] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteRate] NOCHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteRate]
GO
ALTER TABLE [PreBind].[QuoteRate]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteRate] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteRate] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteRate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quote Rate' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteRate'
GO
