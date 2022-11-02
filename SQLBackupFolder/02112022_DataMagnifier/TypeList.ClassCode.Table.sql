USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClassCode]    Script Date: 02.11.2022 09:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ClassCode](
	[ClassCodeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClassCode] [varchar](20) NOT NULL,
	[ClassCodeName] [varchar](50) NULL,
	[ClassCodeDesc] [varchar](255) NOT NULL,
	[IsISOCodeInd] [tinyint] NULL,
 CONSTRAINT [PK_ClassCode] PRIMARY KEY CLUSTERED 
(
	[ClassCodeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[ClassCode]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClassCode] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ClassCode] CHECK CONSTRAINT [FK_SourceSystemSK_ClassCode]
GO
