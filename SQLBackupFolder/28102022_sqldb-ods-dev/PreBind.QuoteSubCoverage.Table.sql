USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteSubCoverage]    Script Date: 28.10.2022 12:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteSubCoverage](
	[QuoteSubCoverageSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteCoverageSK] [int] NOT NULL,
	[SubCoverageSK] [int] NOT NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[WrittenPremiumBaseAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK)QuoteSubCoverage] PRIMARY KEY CLUSTERED 
(
	[QuoteSubCoverageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteSubCoverage]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteSubCoverage] ON [PreBind].[QuoteSubCoverage]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteSubCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteSubCoverage] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteSubCoverage] NOCHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteSubCoverage]
GO
ALTER TABLE [PreBind].[QuoteSubCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteSubCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteSubCoverage] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteSubCoverage]
GO
ALTER TABLE [PreBind].[QuoteSubCoverage]  WITH NOCHECK ADD  CONSTRAINT [FK_SubCoverageSK_QuoteSubCoverage] FOREIGN KEY([SubCoverageSK])
REFERENCES [Typelist].[SubCoverage] ([SubCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteSubCoverage] NOCHECK CONSTRAINT [FK_SubCoverageSK_QuoteSubCoverage]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A quote risk management sub-component of a coverage.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteSubCoverage'
GO
