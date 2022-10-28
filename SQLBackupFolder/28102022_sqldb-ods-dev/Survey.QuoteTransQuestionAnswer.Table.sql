USE [sqldb-ods-dev]
GO
/****** Object:  Table [Survey].[QuoteTransQuestionAnswer]    Script Date: 28.10.2022 11:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Survey].[QuoteTransQuestionAnswer](
	[QuoteTransSK] [int] NOT NULL,
	[PartySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PolicyTransQuestionAnswer] PRIMARY KEY CLUSTERED 
(
	[PartySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteTransQuestionAnswer]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteTransQuestionAnswer] ON [Survey].[QuoteTransQuestionAnswer]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Survey].[QuoteTransQuestionAnswer]  WITH NOCHECK ADD  CONSTRAINT [FK_PartySK_QuoteTransQuestionAnswer] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Survey].[QuoteTransQuestionAnswer] NOCHECK CONSTRAINT [FK_PartySK_QuoteTransQuestionAnswer]
GO
ALTER TABLE [Survey].[QuoteTransQuestionAnswer]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteTransQuestionAnswer] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [Survey].[QuoteTransQuestionAnswer] NOCHECK CONSTRAINT [FK_QuoteTransSK_QuoteTransQuestionAnswer]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Associates quote job type with question/answers' , @level0type=N'SCHEMA',@level0name=N'Survey', @level1type=N'TABLE',@level1name=N'QuoteTransQuestionAnswer'
GO
