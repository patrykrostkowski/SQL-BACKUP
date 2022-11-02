USE [Test]
GO
/****** Object:  Table [dbo].[PlayList]    Script Date: 02.11.2022 14:07:40 ******/
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
