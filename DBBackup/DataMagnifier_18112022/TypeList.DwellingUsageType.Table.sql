USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[DwellingUsageType]    Script Date: 18.11.2022 16:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[DwellingUsageType](
	[DwellingUsageTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[DwellingUsageTypeCode] [varchar](20) NOT NULL,
	[DwellingUsageTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DwellingUsageType] PRIMARY KEY CLUSTERED 
(
	[DwellingUsageTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[DwellingUsageType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_DwellingUsageType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[DwellingUsageType] CHECK CONSTRAINT [FK_SourceSystemSK_DwellingUsageType]
GO
