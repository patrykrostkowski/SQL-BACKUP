USE [sqldb-ods-dev]
GO
/****** Object:  Table [Survey].[QuoteQuestionResponse]    Script Date: 28.10.2022 15:05:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Survey].[QuoteQuestionResponse](
	[QuoteQuestionResponseSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[SurveyQuestionSK] [int] NOT NULL,
	[QuestionTypeSK] [int] NULL,
	[ResponseTypeID] [int] NOT NULL,
	[DomainTypeSK] [int] NULL,
	[ResponseText] [varchar](255) NOT NULL,
	[IsBlankResponseInd] [tinyint] NOT NULL,
	[DisplayOrder] [int] NULL,
	[EffectiveDate] [date] NOT NULL,
	[ExpirationDate] [date] NULL,
	[IsActiveInd] [tinyint] NULL,
	[CreatedByPartySK] [int] NOT NULL,
	[ModifiedByPartySK] [int] NULL,
 CONSTRAINT [PK_QuoteQuestionResponse] PRIMARY KEY CLUSTERED 
(
	[QuoteQuestionResponseSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SurveyQuestionSK] ASC,
	[ResponseText] ASC,
	[IsBlankResponseInd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteQuestionResponse]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteQuestionResponse] ON [Survey].[QuoteQuestionResponse]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Survey].[QuoteQuestionResponse]  WITH NOCHECK ADD  CONSTRAINT [FK_DomainTypeSK_QuoteQuestionResponse] FOREIGN KEY([DomainTypeSK])
REFERENCES [Typelist].[DomainType] ([DomainTypeSK])
GO
ALTER TABLE [Survey].[QuoteQuestionResponse] NOCHECK CONSTRAINT [FK_DomainTypeSK_QuoteQuestionResponse]
GO
ALTER TABLE [Survey].[QuoteQuestionResponse]  WITH NOCHECK ADD  CONSTRAINT [FK_QuestionTypeSK_QuoteQuestionResponse] FOREIGN KEY([QuestionTypeSK])
REFERENCES [Typelist].[QuestionType] ([QuestionTypeSK])
GO
ALTER TABLE [Survey].[QuoteQuestionResponse] NOCHECK CONSTRAINT [FK_QuestionTypeSK_QuoteQuestionResponse]
GO
ALTER TABLE [Survey].[QuoteQuestionResponse]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyQuestionSK_QuoteQuestionResponse] FOREIGN KEY([SurveyQuestionSK])
REFERENCES [Survey].[SurveyQuestion] ([SurveyQuestionSK])
GO
ALTER TABLE [Survey].[QuoteQuestionResponse] NOCHECK CONSTRAINT [FK_SurveyQuestionSK_QuoteQuestionResponse]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Question/answer responses' , @level0type=N'SCHEMA',@level0name=N'Survey', @level1type=N'TABLE',@level1name=N'QuoteQuestionResponse'
GO
