USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteDeductible]    Script Date: 28.10.2022 12:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteDeductible](
	[QuoteDeductibleSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NULL,
	[QuoteCoverageSK] [int] NULL,
	[DeductibleLevelSK] [int] NOT NULL,
	[DeductibleValue] [varchar](50) NOT NULL,
	[DeductibleTypeSK] [int] NOT NULL,
	[DeductibleDesc] [varchar](256) NULL,
 CONSTRAINT [PK_QuoteDeductible] PRIMARY KEY CLUSTERED 
(
	[QuoteDeductibleSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteDeductible]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteDeductible] ON [PreBind].[QuoteDeductible]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteDeductible] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteDeductible] NOCHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteDeductible]
GO
ALTER TABLE [PreBind].[QuoteDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteDeductible] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteDeductible] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteDeductible]
GO
ALTER TABLE [PreBind].[QuoteDeductible]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteDeductible] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteDeductible] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteDeductible]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An amount the insurer will deduct from the loss before making payment on same. The grain/level may be policy or coverage.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteDeductible'
GO
