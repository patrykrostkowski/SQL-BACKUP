USE [Test]
GO
/****** Object:  Table [dbo].[BigBangEpisodes]    Script Date: 04.11.2022 15:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BigBangEpisodes](
	[SeasonNumber] [int] NULL,
	[EpisodeNumber] [int] NULL,
	[DateBroadcast] [date] NULL,
	[Title] [varchar](255) NULL
) ON [PRIMARY]
GO
