USE [Test]
GO
/****** Object:  Table [dbo].[PlayList]    Script Date: 10.11.2022 14:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayList](
	[Artist] [nvarchar](255) NULL,
	[Song] [nvarchar](255) NULL,
	[TargetMarket] [nvarchar](255) NULL,
	[MojeGowna] [nvarchar](255) NULL
) ON [PRIMARY]
GO
