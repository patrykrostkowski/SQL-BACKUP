USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[BusinessType]    Script Date: 02.11.2022 09:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[BusinessType](
	[BusinessTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[BusinessTypeCode] [varchar](20) NOT NULL,
	[BusinessTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BusinessType] PRIMARY KEY CLUSTERED 
(
	[BusinessTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[BusinessType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_BusinessType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[BusinessType] CHECK CONSTRAINT [FK_SourceSystemSK_BusinessType]
GO
