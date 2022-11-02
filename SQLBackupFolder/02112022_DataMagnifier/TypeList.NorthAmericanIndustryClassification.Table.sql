﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[NorthAmericanIndustryClassification]    Script Date: 02.11.2022 13:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[NorthAmericanIndustryClassification](
	[NorthAmericanIndustryClassificationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[NorthAmericanIndustryClassificationCode] [varchar](20) NOT NULL,
	[NorthAmericanIndustryClassificationName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NorthAmericanIndustryClassification] PRIMARY KEY CLUSTERED 
(
	[NorthAmericanIndustryClassificationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[NorthAmericanIndustryClassification]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_NorthAmericanIndustryClassification] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[NorthAmericanIndustryClassification] CHECK CONSTRAINT [FK_SourceSystemSK_NorthAmericanIndustryClassification]
GO
