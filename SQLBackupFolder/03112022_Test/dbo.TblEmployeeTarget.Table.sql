USE [Test]
GO
/****** Object:  Table [dbo].[TblEmployeeTarget]    Script Date: 08.11.2022 08:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblEmployeeTarget](
	[empid] [int] IDENTITY(1,1) NOT NULL,
	[empname] [varchar](50) NULL,
	[empadd] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
