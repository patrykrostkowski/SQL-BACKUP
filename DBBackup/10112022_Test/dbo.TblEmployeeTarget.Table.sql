USE [Test]
GO
/****** Object:  Table [dbo].[TblEmployeeTarget]    Script Date: 10.11.2022 14:47:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TblEmployeeTarget]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TblEmployeeTarget](
	[empid] [int] IDENTITY(1,1) NOT NULL,
	[empname] [varchar](50) NULL,
	[empadd] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
