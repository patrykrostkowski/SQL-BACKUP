USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[dimCountry]    Script Date: 15.11.2022 17:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimCountry](
	[CountryID] [int] NOT NULL,
	[CountryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dimCountry] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
