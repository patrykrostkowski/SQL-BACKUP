﻿USE [Test]
GO
/****** Object:  Table [dbo].[UKBuiltUpAreas]    Script Date: 10.11.2022 14:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UKBuiltUpAreas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UKBuiltUpAreas](
	[Rank] [int] NULL,
	[AreaName] [varchar](255) NULL,
	[Population] [bigint] NULL
) ON [PRIMARY]
END
GO
