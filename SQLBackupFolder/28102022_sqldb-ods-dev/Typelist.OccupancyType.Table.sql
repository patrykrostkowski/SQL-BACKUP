USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[OccupancyType]    Script Date: 28.10.2022 13:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[OccupancyType](
	[OccupancyTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[OccupancyTypeCode] [varchar](20) NOT NULL,
	[OccupancyTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OccupancyType] PRIMARY KEY CLUSTERED 
(
	[OccupancyTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[OccupancyType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_OccupancyType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[OccupancyType] NOCHECK CONSTRAINT [FK_SourceSystemSK_OccupancyType]
GO
