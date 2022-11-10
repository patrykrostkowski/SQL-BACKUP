USE [DataMagnifier]
GO
/****** Object:  Table [Survey].[QuoteQuestionResponse]    Script Date: 10.11.2022 14:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Survey].[QuoteQuestionResponse]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_DomainTypeSK_QuoteQuestionResponse]') AND parent_object_id = OBJECT_ID(N'[Survey].[QuoteQuestionResponse]'))
ALTER TABLE [Survey].[QuoteQuestionResponse]  WITH CHECK ADD  CONSTRAINT [FK_DomainTypeSK_QuoteQuestionResponse] FOREIGN KEY([DomainTypeSK])
REFERENCES [TypeList].[DomainType] ([DomainTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_DomainTypeSK_QuoteQuestionResponse]') AND parent_object_id = OBJECT_ID(N'[Survey].[QuoteQuestionResponse]'))
ALTER TABLE [Survey].[QuoteQuestionResponse] CHECK CONSTRAINT [FK_DomainTypeSK_QuoteQuestionResponse]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_QuestionTypeSK_QuoteQuestionResponse]') AND parent_object_id = OBJECT_ID(N'[Survey].[QuoteQuestionResponse]'))
ALTER TABLE [Survey].[QuoteQuestionResponse]  WITH CHECK ADD  CONSTRAINT [FK_QuestionTypeSK_QuoteQuestionResponse] FOREIGN KEY([QuestionTypeSK])
REFERENCES [TypeList].[QuestionType] ([QuestionTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_QuestionTypeSK_QuoteQuestionResponse]') AND parent_object_id = OBJECT_ID(N'[Survey].[QuoteQuestionResponse]'))
ALTER TABLE [Survey].[QuoteQuestionResponse] CHECK CONSTRAINT [FK_QuestionTypeSK_QuoteQuestionResponse]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_SurveyQuestionSK_QuoteQuestionResponse]') AND parent_object_id = OBJECT_ID(N'[Survey].[QuoteQuestionResponse]'))
ALTER TABLE [Survey].[QuoteQuestionResponse]  WITH CHECK ADD  CONSTRAINT [FK_SurveyQuestionSK_QuoteQuestionResponse] FOREIGN KEY([SurveyQuestionSK])
REFERENCES [Survey].[SurveyQuestion] ([SurveyQuestionSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_SurveyQuestionSK_QuoteQuestionResponse]') AND parent_object_id = OBJECT_ID(N'[Survey].[QuoteQuestionResponse]'))
ALTER TABLE [Survey].[QuoteQuestionResponse] CHECK CONSTRAINT [FK_SurveyQuestionSK_QuoteQuestionResponse]
GO
