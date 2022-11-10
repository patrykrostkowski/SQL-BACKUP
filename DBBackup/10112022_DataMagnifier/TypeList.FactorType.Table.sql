USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[FactorType]    Script Date: 10.11.2022 14:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[FactorType]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_FactorType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[FactorType]'))
ALTER TABLE [TypeList].[FactorType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_FactorType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_FactorType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[FactorType]'))
ALTER TABLE [TypeList].[FactorType] CHECK CONSTRAINT [FK_SourceSystemSK_FactorType]
GO
