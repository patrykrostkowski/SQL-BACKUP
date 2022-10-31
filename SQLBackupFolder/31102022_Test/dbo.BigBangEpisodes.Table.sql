﻿USE [Test]
GO
/****** Object:  Table [dbo].[BigBangEpisodes]    Script Date: 31.10.2022 12:41:03 ******/
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
