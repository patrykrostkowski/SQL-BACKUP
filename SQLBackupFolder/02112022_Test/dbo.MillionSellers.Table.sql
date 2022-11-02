USE [Test]
GO
/****** Object:  Table [dbo].[MillionSellers]    Script Date: 02.11.2022 09:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MillionSellers](
	[Artist] [varchar](255) NULL,
	[Sales] [decimal](10, 2) NULL,
	[Title] [varchar](255) NULL,
	[SongYear] [int] NULL
) ON [PRIMARY]
GO
