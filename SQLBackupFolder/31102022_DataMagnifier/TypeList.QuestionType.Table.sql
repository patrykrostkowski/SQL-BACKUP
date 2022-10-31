USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[QuestionType]    Script Date: 31.10.2022 12:30:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[QuestionType](
	[QuestionTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[QuestionTypeName] [varchar](50) NOT NULL,
	[QuestionTypeDesc] [varchar](100) NULL,
 CONSTRAINT [PK_QuestionType] PRIMARY KEY CLUSTERED 
(
	[QuestionTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[QuestionType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuestionType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[QuestionType] CHECK CONSTRAINT [FK_SourceSystemSK_QuestionType]
GO
