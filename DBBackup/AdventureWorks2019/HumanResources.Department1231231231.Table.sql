USE [AdventureWorks2019]
GO
/****** Object:  Table [HumanResources].[Department1231231231]    Script Date: 10.11.2022 14:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Department1231231231](
	[DepartmentID123] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[GroupName] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Department_DepartmentID123] PRIMARY KEY CLUSTERED 
(
	[DepartmentID123] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
