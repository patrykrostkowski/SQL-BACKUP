﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PolicyQuestionGroup]    Script Date: 02.11.2022 09:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[PolicyQuestionGroup](
	[PolicyQuestionGroupSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[QuestionGroupCode] [varchar](25) NULL,
	[QuestionGroupName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PolicyQuestionGroup] PRIMARY KEY CLUSTERED 
(
	[PolicyQuestionGroupSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[PolicyQuestionGroup]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyQuestionGroup] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[PolicyQuestionGroup] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyQuestionGroup]
GO
