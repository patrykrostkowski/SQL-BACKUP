USE [Test]
GO
/****** Object:  Table [dbo].[WeirdStats]    Script Date: 10.11.2022 13:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeirdStats](
	[StoreName] [nvarchar](255) NULL,
	[Statistic] [nvarchar](10) NULL,
	[NumberPurchases] [int] NULL,
	[Amount] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
