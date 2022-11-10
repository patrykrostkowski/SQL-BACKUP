USE [Test]
GO
/****** Object:  Table [dbo].[Periods]    Script Date: 10.11.2022 14:35:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Periods]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Periods](
	[Period] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
