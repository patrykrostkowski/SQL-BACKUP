USE [sqldb-ods-dev]
GO
/****** Object:  Table [Survey].[QuoteQuestionAnswer]    Script Date: 28.10.2022 12:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Survey].[QuoteQuestionAnswer](
	[QuoteQuestionAnswerSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[DomainTypeSK] [int] NULL,
	[QuestionAnswerText] [varchar](255) NULL,
	[QuestionAnswerNumber] [int] NULL,
	[QuestionAnswerAmount] [decimal](18, 9) NULL,
	[QuestionAnswerDate] [datetime] NULL,
	[CreatedByPartySK] [int] NOT NULL,
	[ModifiedByPartySK] [int] NULL,
 CONSTRAINT [PK_QuoteQuestionAnswer] PRIMARY KEY CLUSTERED 
(
	[QuoteQuestionAnswerSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteQuestionAnswer]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteQuestionAnswer] ON [Survey].[QuoteQuestionAnswer]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Survey].[QuoteQuestionAnswer]  WITH NOCHECK ADD  CONSTRAINT [FK_DomainTypeSK_QuoteQuestionAnswer] FOREIGN KEY([DomainTypeSK])
REFERENCES [Typelist].[DomainType] ([DomainTypeSK])
GO
ALTER TABLE [Survey].[QuoteQuestionAnswer] NOCHECK CONSTRAINT [FK_DomainTypeSK_QuoteQuestionAnswer]
GO
ALTER TABLE [Survey].[QuoteQuestionAnswer]  WITH NOCHECK ADD  CONSTRAINT [RefQuoteTrans942] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [Survey].[QuoteQuestionAnswer] NOCHECK CONSTRAINT [RefQuoteTrans942]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'List of survey questions and possible answers' , @level0type=N'SCHEMA',@level0name=N'Survey', @level1type=N'TABLE',@level1name=N'QuoteQuestionAnswer'
GO
