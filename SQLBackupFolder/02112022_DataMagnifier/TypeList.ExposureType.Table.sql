USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ExposureType]    Script Date: 02.11.2022 14:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ExposureType](
	[ExposureTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ExposureTypeCode] [varchar](20) NOT NULL,
	[ExposureTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ExposureType] PRIMARY KEY CLUSTERED 
(
	[ExposureTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[ExposureType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ExposureType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ExposureType] CHECK CONSTRAINT [FK_SourceSystemSK_ExposureType]
GO
