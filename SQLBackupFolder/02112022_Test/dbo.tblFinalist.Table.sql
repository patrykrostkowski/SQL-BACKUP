USE [Test]
GO
/****** Object:  Table [dbo].[tblFinalist]    Script Date: 02.11.2022 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
