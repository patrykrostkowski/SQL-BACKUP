USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteTransReason]    Script Date: 28.10.2022 13:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteTransReason](
	[QuoteTransReasonSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteSK] [int] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[ReasonSK] [int] NOT NULL,
	[ReasonInformationDesc] [varchar](256) NULL,
 CONSTRAINT [PK_QuoteTransReason] PRIMARY KEY CLUSTERED 
(
	[QuoteTransReasonSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteTransReason]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteTransReason] ON [PreBind].[QuoteTransReason]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteTransReason]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteSK_QuoteTransReason] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
ALTER TABLE [PreBind].[QuoteTransReason] NOCHECK CONSTRAINT [FK_QuoteSK_QuoteTransReason]
GO
ALTER TABLE [PreBind].[QuoteTransReason]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteTransReason] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteTransReason] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteTransReason]
GO
ALTER TABLE [PreBind].[QuoteTransReason]  WITH NOCHECK ADD  CONSTRAINT [FK_ReasonSK_QuoteTransReason] FOREIGN KEY([ReasonSK])
REFERENCES [Typelist].[Reason] ([ReasonSK])
GO
ALTER TABLE [PreBind].[QuoteTransReason] NOCHECK CONSTRAINT [FK_ReasonSK_QuoteTransReason]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Notes and memos associated with a Quote workfow transactions' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteTransReason'
GO
