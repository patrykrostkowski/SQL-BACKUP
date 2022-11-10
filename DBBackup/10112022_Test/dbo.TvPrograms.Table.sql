USE [Test]
GO
/****** Object:  Table [dbo].[TvPrograms]    Script Date: 10.11.2022 14:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TvPrograms]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TvPrograms](
	[ProgramId] [int] IDENTITY(1,1) NOT NULL,
	[ProgramName] [varchar](255) NULL,
	[OwlRating] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
