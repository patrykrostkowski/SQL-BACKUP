USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[SprinklerType]    Script Date: 28.10.2022 13:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[SprinklerType](
	[SprinklerTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SprinklerTypeCode] [varchar](20) NOT NULL,
	[SprinklerTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SprinklerType] PRIMARY KEY CLUSTERED 
(
	[SprinklerTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[SprinklerType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_SprinklerType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[SprinklerType] NOCHECK CONSTRAINT [FK_SourceSystemSK_SprinklerType]
GO
