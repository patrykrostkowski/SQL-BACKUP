USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[SalvageDetailType]    Script Date: 28.10.2022 13:37:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[SalvageDetailType](
	[SalvageDetailTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SalvageDetailTypeCode] [varchar](20) NOT NULL,
	[SalvageDetailTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK316] PRIMARY KEY CLUSTERED 
(
	[SalvageDetailTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[SalvageDetailType]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1073] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[SalvageDetailType] NOCHECK CONSTRAINT [RefSourceSystem1073]
GO
