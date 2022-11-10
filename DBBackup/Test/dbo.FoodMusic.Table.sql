USE [Test]
GO
/****** Object:  Table [dbo].[FoodMusic]    Script Date: 10.11.2022 14:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodMusic](
	[Position] [int] NULL,
	[Artist] [nvarchar](255) NULL,
	[SongTitle] [nvarchar](255) NULL
) ON [PRIMARY]
GO
