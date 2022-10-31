﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PricingLevel]    Script Date: 31.10.2022 11:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[PricingLevel](
	[PricingLevelSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PricingLevelCode] [varchar](20) NOT NULL,
	[PricingLevelName] [varchar](50) NULL,
	[PricingLevelDesc] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PricingLevel] PRIMARY KEY CLUSTERED 
(
	[PricingLevelSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
