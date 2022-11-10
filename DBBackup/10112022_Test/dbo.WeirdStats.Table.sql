USE [Test]
GO
/****** Object:  Table [dbo].[WeirdStats]    Script Date: 10.11.2022 14:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WeirdStats]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WeirdStats](
	[StoreName] [nvarchar](255) NULL,
	[Statistic] [nvarchar](10) NULL,
	[NumberPurchases] [int] NULL,
	[Amount] [decimal](12, 2) NULL
) ON [PRIMARY]
END
GO
