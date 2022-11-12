USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[dimProduct]    Script Date: 12.11.2022 10:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimProduct]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dimProduct](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dimProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
