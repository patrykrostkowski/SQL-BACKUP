USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[QuestionType]    Script Date: 12.11.2022 09:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[QuestionType]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_QuestionType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[QuestionType]'))
ALTER TABLE [TypeList].[QuestionType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuestionType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_QuestionType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[QuestionType]'))
ALTER TABLE [TypeList].[QuestionType] CHECK CONSTRAINT [FK_SourceSystemSK_QuestionType]
GO
