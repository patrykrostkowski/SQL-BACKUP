USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Subline]    Script Date: 31.10.2022 11:55:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[Subline](
	[SublineSK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SublineCode] [varchar](20) NOT NULL,
	[SublineName] [varchar](50) NULL,
 CONSTRAINT [PK_Subline] PRIMARY KEY CLUSTERED 
(
	[SublineSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[Subline]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Subline] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[Subline] CHECK CONSTRAINT [FK_SourceSystemSK_Subline]
GO
