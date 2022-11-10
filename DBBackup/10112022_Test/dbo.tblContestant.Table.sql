USE [Test]
GO
/****** Object:  Table [dbo].[tblContestant]    Script Date: 10.11.2022 14:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblContestant]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblContestant](
	[Contestant] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[Mentor] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
