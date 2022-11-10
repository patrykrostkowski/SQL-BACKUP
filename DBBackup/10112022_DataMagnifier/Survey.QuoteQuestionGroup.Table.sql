USE [DataMagnifier]
GO
/****** Object:  Table [Survey].[QuoteQuestionGroup]    Script Date: 10.11.2022 14:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Survey].[QuoteQuestionGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [Survey].[QuoteQuestionGroup](
	[QuoteQuestionGroupSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuestionGroupName] [varchar](50) NOT NULL,
	[QuestionGroupDesc] [varchar](100) NULL,
	[CreatedByPartySK] [int] NOT NULL,
	[ModifiedByPartySK] [int] NULL,
 CONSTRAINT [PK_QuoteQuestionGroup] PRIMARY KEY CLUSTERED 
(
	[QuoteQuestionGroupSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
