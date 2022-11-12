USE [Test]
GO
/****** Object:  Table [dbo].[tblFinalist]    Script Date: 12.11.2022 09:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblFinalist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblFinalist](
	[FinalistId] [int] IDENTITY(1,1) NOT NULL,
	[FinalistName] [nvarchar](50) NULL,
	[FinishingPosition] [int] NULL,
	[SeriesNumber] [int] NULL,
	[CategoryId] [int] NULL,
	[ImportNote] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FinalistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
