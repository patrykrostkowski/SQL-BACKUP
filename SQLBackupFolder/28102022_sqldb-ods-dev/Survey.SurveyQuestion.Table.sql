USE [sqldb-ods-dev]
GO
/****** Object:  Table [Survey].[SurveyQuestion]    Script Date: 28.10.2022 12:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Survey].[SurveyQuestion](
	[SurveyQuestionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicySurveySK] [int] NOT NULL,
	[QuoteQuestionSK] [int] NOT NULL,
	[PolicyQuestionGroupSK] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[EffectiveDate] [date] NOT NULL,
	[ExpirationDate] [date] NULL,
	[IsActiveInd] [tinyint] NULL,
	[QuoteQuestionGroupSK] [int] NULL,
 CONSTRAINT [PK_SurveyQuestion] PRIMARY KEY CLUSTERED 
(
	[SurveyQuestionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_SurveyQuestion]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_SurveyQuestion] ON [Survey].[SurveyQuestion]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Survey].[SurveyQuestion]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyQuestionGroupSK_SurveyQuestion] FOREIGN KEY([PolicyQuestionGroupSK])
REFERENCES [Typelist].[PolicyQuestionGroup] ([PolicyQuestionGroupSK])
GO
ALTER TABLE [Survey].[SurveyQuestion] NOCHECK CONSTRAINT [FK_PolicyQuestionGroupSK_SurveyQuestion]
GO
ALTER TABLE [Survey].[SurveyQuestion]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySurveySK_SurveyQuestion] FOREIGN KEY([PolicySurveySK])
REFERENCES [Survey].[PolicySurvey] ([PolicySurveySK])
GO
ALTER TABLE [Survey].[SurveyQuestion] NOCHECK CONSTRAINT [FK_PolicySurveySK_SurveyQuestion]
GO
ALTER TABLE [Survey].[SurveyQuestion]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteQuestionGroupSK_SurveyQuestion] FOREIGN KEY([QuoteQuestionGroupSK])
REFERENCES [Survey].[QuoteQuestionGroup] ([QuoteQuestionGroupSK])
GO
ALTER TABLE [Survey].[SurveyQuestion] NOCHECK CONSTRAINT [FK_QuoteQuestionGroupSK_SurveyQuestion]
GO
ALTER TABLE [Survey].[SurveyQuestion]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteQuestionSK_SurveyQuestion] FOREIGN KEY([QuoteQuestionSK])
REFERENCES [Survey].[QuoteQuestion] ([QuoteQuestionSK])
GO
ALTER TABLE [Survey].[SurveyQuestion] NOCHECK CONSTRAINT [FK_QuoteQuestionSK_SurveyQuestion]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Association of questions/groups for a survey' , @level0type=N'SCHEMA',@level0name=N'Survey', @level1type=N'TABLE',@level1name=N'SurveyQuestion'
GO
