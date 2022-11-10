USE [Test]
GO
/****** Object:  Table [dbo].[Mentor]    Script Date: 10.11.2022 14:35:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mentor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mentor](
	[MentorId] [int] NOT NULL,
	[MentorName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MentorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
