USE [sqldb-ods-dev]
GO
/****** Object:  Table [Survey].[QuoteQuestion]    Script Date: 28.10.2022 15:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Survey].[QuoteQuestion](
	[QuoteQuestionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ParentQuestionSK] [int] NULL,
	[QuestionTypeSK] [int] NOT NULL,
	[QuestionText] [varchar](255) NOT NULL,
	[EffectiveDate] [date] NOT NULL,
	[ExpirationDate] [date] NULL,
	[IsActiveInd] [tinyint] NULL,
	[CreatedByPartySK] [int] NOT NULL,
	[ModifiedByPartySK] [int] NULL,
 CONSTRAINT [PK_QuoteQuestion] PRIMARY KEY CLUSTERED 
(
	[QuoteQuestionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteQuestion]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteQuestion] ON [Survey].[QuoteQuestion]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Survey].[QuoteQuestion]  WITH NOCHECK ADD  CONSTRAINT [FK_ParentQuestionSK_QuoteQuestion] FOREIGN KEY([ParentQuestionSK])
REFERENCES [Survey].[QuoteQuestion] ([QuoteQuestionSK])
GO
ALTER TABLE [Survey].[QuoteQuestion] NOCHECK CONSTRAINT [FK_ParentQuestionSK_QuoteQuestion]
GO
ALTER TABLE [Survey].[QuoteQuestion]  WITH NOCHECK ADD  CONSTRAINT [FK_QuestionTypeSK_QuoteQuestion] FOREIGN KEY([QuestionTypeSK])
REFERENCES [Typelist].[QuestionType] ([QuestionTypeSK])
GO
ALTER TABLE [Survey].[QuoteQuestion] NOCHECK CONSTRAINT [FK_QuestionTypeSK_QuoteQuestion]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'List of survey questions' , @level0type=N'SCHEMA',@level0name=N'Survey', @level1type=N'TABLE',@level1name=N'QuoteQuestion'
GO
