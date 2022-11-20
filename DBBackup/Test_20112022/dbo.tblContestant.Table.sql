USE [Test]
GO
/****** Object:  Table [dbo].[tblContestant]    Script Date: 20.11.2022 14:54:37 ******/
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
