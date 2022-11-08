USE [DataMagnifier]
GO
/****** Object:  Table [Survey].[QuoteQuestionAnswer]    Script Date: 08.11.2022 08:47:55 ******/
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
ALTER TABLE [Survey].[QuoteQuestionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_DomainTypeSK_QuoteQuestionAnswer] FOREIGN KEY([DomainTypeSK])
REFERENCES [TypeList].[DomainType] ([DomainTypeSK])
GO
ALTER TABLE [Survey].[QuoteQuestionAnswer] CHECK CONSTRAINT [FK_DomainTypeSK_QuoteQuestionAnswer]
GO
