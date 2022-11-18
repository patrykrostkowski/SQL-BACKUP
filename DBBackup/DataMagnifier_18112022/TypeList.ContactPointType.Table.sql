USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ContactPointType]    Script Date: 18.11.2022 16:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ContactPointType](
	[ContactPointTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ContactPointTypeCode] [varchar](20) NOT NULL,
	[ContactPointTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_ContactPointType] PRIMARY KEY CLUSTERED 
(
	[ContactPointTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[ContactPointType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPointType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ContactPointType] CHECK CONSTRAINT [FK_SourceSystemSK_ContactPointType]
GO
