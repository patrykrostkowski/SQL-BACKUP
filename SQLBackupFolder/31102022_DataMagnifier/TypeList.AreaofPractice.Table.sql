USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[AreaofPractice]    Script Date: 31.10.2022 11:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[AreaofPractice](
	[AreaofPracticeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[AreaofPracticeCode] [varchar](20) NOT NULL,
	[AreaofPracticeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AreaofPractice] PRIMARY KEY CLUSTERED 
(
	[AreaofPracticeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[AreaofPractice]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_AreaofPractice] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[AreaofPractice] CHECK CONSTRAINT [FK_SourceSystemSK_AreaofPractice]
GO
