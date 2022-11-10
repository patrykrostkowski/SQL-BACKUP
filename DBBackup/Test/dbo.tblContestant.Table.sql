USE [Test]
GO
/****** Object:  Table [dbo].[tblContestant]    Script Date: 10.11.2022 14:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContestant](
	[Contestant] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[Mentor] [nvarchar](255) NULL
) ON [PRIMARY]
GO
