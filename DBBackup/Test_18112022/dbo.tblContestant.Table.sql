USE [Test]
GO
/****** Object:  Table [dbo].[tblContestant]    Script Date: 18.11.2022 16:48:17 ******/
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
