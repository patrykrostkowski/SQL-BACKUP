USE [DataMagnifier]
GO
/****** Object:  Table [Survey].[SurveyQuestion]    Script Date: 04.11.2022 15:25:40 ******/
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
ALTER TABLE [Survey].[SurveyQuestion]  WITH CHECK ADD  CONSTRAINT [FK_PolicyQuestionGroupSK_SurveyQuestion] FOREIGN KEY([PolicyQuestionGroupSK])
REFERENCES [TypeList].[PolicyQuestionGroup] ([PolicyQuestionGroupSK])
GO
ALTER TABLE [Survey].[SurveyQuestion] CHECK CONSTRAINT [FK_PolicyQuestionGroupSK_SurveyQuestion]
GO
ALTER TABLE [Survey].[SurveyQuestion]  WITH CHECK ADD  CONSTRAINT [FK_PolicySurveySK_SurveyQuestion] FOREIGN KEY([PolicySurveySK])
REFERENCES [Survey].[PolicySurvey] ([PolicySurveySK])
GO
ALTER TABLE [Survey].[SurveyQuestion] CHECK CONSTRAINT [FK_PolicySurveySK_SurveyQuestion]
GO
ALTER TABLE [Survey].[SurveyQuestion]  WITH CHECK ADD  CONSTRAINT [FK_QuoteQuestionGroupSK_SurveyQuestion] FOREIGN KEY([QuoteQuestionGroupSK])
REFERENCES [Survey].[QuoteQuestionGroup] ([QuoteQuestionGroupSK])
GO
ALTER TABLE [Survey].[SurveyQuestion] CHECK CONSTRAINT [FK_QuoteQuestionGroupSK_SurveyQuestion]
GO
ALTER TABLE [Survey].[SurveyQuestion]  WITH CHECK ADD  CONSTRAINT [FK_QuoteQuestionSK_SurveyQuestion] FOREIGN KEY([QuoteQuestionSK])
REFERENCES [Survey].[QuoteQuestion] ([QuoteQuestionSK])
GO
ALTER TABLE [Survey].[SurveyQuestion] CHECK CONSTRAINT [FK_QuoteQuestionSK_SurveyQuestion]
GO
