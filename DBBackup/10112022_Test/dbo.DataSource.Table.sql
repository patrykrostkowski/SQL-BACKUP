USE [Test]
GO
/****** Object:  Table [dbo].[DataSource]    Script Date: 10.11.2022 14:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSource]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DataSource](
	[VALUE1] [char](4000) NOT NULL,
	[VALUE2] [char](4000) NOT NULL
) ON [PRIMARY]
END
GO
