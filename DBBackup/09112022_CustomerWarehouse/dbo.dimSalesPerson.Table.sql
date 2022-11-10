USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[dimSalesPerson]    Script Date: 10.11.2022 14:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimSalesPerson]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dimSalesPerson](
	[SalesPersonID] [int] NOT NULL,
	[SalesPersonName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dimSalesPerson] PRIMARY KEY CLUSTERED 
(
	[SalesPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
