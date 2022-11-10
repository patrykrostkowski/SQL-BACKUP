USE [Test]
GO
/****** Object:  Table [dbo].[PlayList]    Script Date: 10.11.2022 14:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlayList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PlayList](
	[Artist] [nvarchar](255) NULL,
	[Song] [nvarchar](255) NULL,
	[TargetMarket] [nvarchar](255) NULL,
	[MojeGowna] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
