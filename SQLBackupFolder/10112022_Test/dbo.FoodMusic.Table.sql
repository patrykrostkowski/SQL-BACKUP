USE [Test]
GO
/****** Object:  Table [dbo].[FoodMusic]    Script Date: 10.11.2022 13:25:59 ******/
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
