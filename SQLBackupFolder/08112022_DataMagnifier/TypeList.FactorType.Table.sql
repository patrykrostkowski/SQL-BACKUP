USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[FactorType]    Script Date: 08.11.2022 08:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[FactorType](
	[FactorTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[FactorTypeCode] [varchar](20) NOT NULL,
	[FactorTypeName] [varchar](50) NULL,
	[FactorTypeDesc] [varchar](255) NOT NULL,
 CONSTRAINT [PK_FactorType] PRIMARY KEY CLUSTERED 
(
	[FactorTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[FactorType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_FactorType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[FactorType] CHECK CONSTRAINT [FK_SourceSystemSK_FactorType]
GO
