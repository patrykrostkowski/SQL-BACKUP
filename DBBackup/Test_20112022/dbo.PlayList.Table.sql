﻿USE [Test]
GO
/****** Object:  Table [dbo].[PlayList]    Script Date: 20.11.2022 19:02:35 ******/
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
