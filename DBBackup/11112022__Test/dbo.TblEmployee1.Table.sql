USE [Test]
GO
/****** Object:  Table [dbo].[TblEmployee1]    Script Date: 12.11.2022 09:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblEmployee1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TblEmployee1](
	[empid] [int] IDENTITY(1,1) NOT NULL,
	[empname] [nvarchar](50) NOT NULL,
	[empadd] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
