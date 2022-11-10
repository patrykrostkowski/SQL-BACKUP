USE [DataMagnifier]
GO
/****** Object:  Table [Survey].[RequiredQuestionRule]    Script Date: 10.11.2022 14:47:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Survey].[RequiredQuestionRule]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_SurveyQuestionSK_RequiredQuestionRule]') AND parent_object_id = OBJECT_ID(N'[Survey].[RequiredQuestionRule]'))
ALTER TABLE [Survey].[RequiredQuestionRule]  WITH CHECK ADD  CONSTRAINT [FK_SurveyQuestionSK_RequiredQuestionRule] FOREIGN KEY([SurveyQuestionSK])
REFERENCES [Survey].[SurveyQuestion] ([SurveyQuestionSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Survey].[FK_SurveyQuestionSK_RequiredQuestionRule]') AND parent_object_id = OBJECT_ID(N'[Survey].[RequiredQuestionRule]'))
ALTER TABLE [Survey].[RequiredQuestionRule] CHECK CONSTRAINT [FK_SurveyQuestionSK_RequiredQuestionRule]
GO
