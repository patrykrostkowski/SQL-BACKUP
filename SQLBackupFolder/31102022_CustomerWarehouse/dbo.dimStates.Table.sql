﻿USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[dimStates]    Script Date: 31.10.2022 12:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimStates](
	[StatesID] [int] NOT NULL,
	[StatesName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dimStates] PRIMARY KEY CLUSTERED 
(
	[StatesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
