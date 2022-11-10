USE [Test]
GO
/****** Object:  Table [dbo].[FoodMusic]    Script Date: 10.11.2022 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FoodMusic]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FoodMusic](
	[Position] [int] NULL,
	[Artist] [nvarchar](255) NULL,
	[SongTitle] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
