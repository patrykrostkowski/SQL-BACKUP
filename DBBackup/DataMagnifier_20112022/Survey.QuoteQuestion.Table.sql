USE [DataMagnifier]
GO
/****** Object:  Table [Survey].[QuoteQuestion]    Script Date: 20.11.2022 14:06:44 ******/
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
ALTER TABLE [Survey].[QuoteQuestion]  WITH CHECK ADD  CONSTRAINT [FK_ParentQuestionSK_QuoteQuestion] FOREIGN KEY([ParentQuestionSK])
REFERENCES [Survey].[QuoteQuestion] ([QuoteQuestionSK])
GO
ALTER TABLE [Survey].[QuoteQuestion] CHECK CONSTRAINT [FK_ParentQuestionSK_QuoteQuestion]
GO
ALTER TABLE [Survey].[QuoteQuestion]  WITH CHECK ADD  CONSTRAINT [FK_QuestionTypeSK_QuoteQuestion] FOREIGN KEY([QuestionTypeSK])
REFERENCES [TypeList].[QuestionType] ([QuestionTypeSK])
GO
ALTER TABLE [Survey].[QuoteQuestion] CHECK CONSTRAINT [FK_QuestionTypeSK_QuoteQuestion]
GO
