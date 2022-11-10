USE [Test]
GO
/****** Object:  Table [dbo].[tblSeries]    Script Date: 10.11.2022 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblSeries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblSeries](
	[SeriesId] [int] IDENTITY(1,1) NOT NULL,
	[SeriesNumber] [int] NULL,
	[Winner] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SeriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
