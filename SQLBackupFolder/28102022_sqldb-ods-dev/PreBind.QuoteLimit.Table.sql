USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteLimit]    Script Date: 28.10.2022 15:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteLimit](
	[QuoteLimitSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NULL,
	[QuoteCoverageSK] [int] NULL,
	[LimitTypeSK] [int] NULL,
	[LimitLevelDesc] [varchar](50) NULL,
	[CurrencySK] [int] NULL,
	[LimitAmt] [decimal](18, 2) NULL,
	[IsDeleteInd] [tinyint] NULL,
 CONSTRAINT [PK_QuoteLimit] PRIMARY KEY CLUSTERED 
(
	[QuoteLimitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteLimit]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteLimit] ON [PreBind].[QuoteLimit]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteLimit] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteLimit] NOCHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteLimit]
GO
ALTER TABLE [PreBind].[QuoteLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteLimit] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteLimit] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteLimit]
GO
ALTER TABLE [PreBind].[QuoteLimit]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteLimit] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteLimit] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteLimit]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A limit level may be  a policy and/or coverage     A policy limit may be Maximum Loss that represents the maximum amount of claims to be paid regardless of number of claims.   A coverage limit is the maximum amount to be paid on a authorized coverage on a single incident or claim   A vehicle coverage  such as  liability,  collision and comprehensive will each have separate limits.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteLimit'
GO
