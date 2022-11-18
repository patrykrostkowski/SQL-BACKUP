USE [Test]
GO
/****** Object:  Table [dbo].[GrandPrixEvents]    Script Date: 18.11.2022 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrandPrixEvents](
	[GrandPrixId] [int] IDENTITY(1,1) NOT NULL,
	[Round] [int] NULL,
	[VenueName] [nvarchar](255) NULL,
	[Season] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GrandPrixId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
