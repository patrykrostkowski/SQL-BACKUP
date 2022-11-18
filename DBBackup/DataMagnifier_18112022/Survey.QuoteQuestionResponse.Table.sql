USE [DataMagnifier]
GO
/****** Object:  Table [Survey].[QuoteQuestionResponse]    Script Date: 18.11.2022 16:40:21 ******/
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
ALTER TABLE [Survey].[QuoteQuestionResponse]  WITH CHECK ADD  CONSTRAINT [FK_DomainTypeSK_QuoteQuestionResponse] FOREIGN KEY([DomainTypeSK])
REFERENCES [TypeList].[DomainType] ([DomainTypeSK])
GO
ALTER TABLE [Survey].[QuoteQuestionResponse] CHECK CONSTRAINT [FK_DomainTypeSK_QuoteQuestionResponse]
GO
ALTER TABLE [Survey].[QuoteQuestionResponse]  WITH CHECK ADD  CONSTRAINT [FK_QuestionTypeSK_QuoteQuestionResponse] FOREIGN KEY([QuestionTypeSK])
REFERENCES [TypeList].[QuestionType] ([QuestionTypeSK])
GO
ALTER TABLE [Survey].[QuoteQuestionResponse] CHECK CONSTRAINT [FK_QuestionTypeSK_QuoteQuestionResponse]
GO
ALTER TABLE [Survey].[QuoteQuestionResponse]  WITH CHECK ADD  CONSTRAINT [FK_SurveyQuestionSK_QuoteQuestionResponse] FOREIGN KEY([SurveyQuestionSK])
REFERENCES [Survey].[SurveyQuestion] ([SurveyQuestionSK])
GO
ALTER TABLE [Survey].[QuoteQuestionResponse] CHECK CONSTRAINT [FK_SurveyQuestionSK_QuoteQuestionResponse]
GO
