USE [Test]
GO
/****** Object:  Table [dbo].[GrandPrixEvents]    Script Date: 10.11.2022 14:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GrandPrixEvents]') AND type in (N'U'))
BEGIN
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
END
GO
