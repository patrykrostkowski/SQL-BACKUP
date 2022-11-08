USE [Test]
GO
/****** Object:  Table [dbo].[BigBangEpisodes]    Script Date: 08.11.2022 08:48:03 ******/
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
