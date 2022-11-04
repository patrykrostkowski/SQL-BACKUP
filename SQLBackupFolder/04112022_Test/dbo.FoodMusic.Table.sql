USE [Test]
GO
/****** Object:  Table [dbo].[FoodMusic]    Script Date: 04.11.2022 15:25:48 ******/
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
