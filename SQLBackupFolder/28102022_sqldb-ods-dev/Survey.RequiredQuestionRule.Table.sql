USE [sqldb-ods-dev]
GO
/****** Object:  Table [Survey].[RequiredQuestionRule]    Script Date: 28.10.2022 15:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Survey].[RequiredQuestionRule](
	[RequiredQuestionRuleID] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[SurveyQuestionSK] [int] NULL,
	[EffectiveDate] [date] NOT NULL,
	[ExpirationDate] [date] NULL,
	[CreatedByPartySK] [int] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedByPartySK] [int] NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_RequiredQuestionRule] PRIMARY KEY CLUSTERED 
(
	[RequiredQuestionRuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_RequiredQuestionRule]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_RequiredQuestionRule] ON [Survey].[RequiredQuestionRule]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Survey].[RequiredQuestionRule]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyQuestionSK_RequiredQuestionRule] FOREIGN KEY([SurveyQuestionSK])
REFERENCES [Survey].[SurveyQuestion] ([SurveyQuestionSK])
GO
ALTER TABLE [Survey].[RequiredQuestionRule] NOCHECK CONSTRAINT [FK_SurveyQuestionSK_RequiredQuestionRule]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prefined survey question rules' , @level0type=N'SCHEMA',@level0name=N'Survey', @level1type=N'TABLE',@level1name=N'RequiredQuestionRule'
GO
