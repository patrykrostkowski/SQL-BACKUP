USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[DomainType]    Script Date: 10.11.2022 14:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[DomainType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[DomainType](
	[DomainTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[DomainTypeCode] [varchar](25) NULL,
	[DomainTypeName] [varchar](50) NOT NULL,
	[DomainTypeFormat] [varchar](20) NULL,
 CONSTRAINT [PK_DomainType] PRIMARY KEY CLUSTERED 
(
	[DomainTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_DomainType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[DomainType]'))
ALTER TABLE [TypeList].[DomainType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_DomainType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_DomainType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[DomainType]'))
ALTER TABLE [TypeList].[DomainType] CHECK CONSTRAINT [FK_SourceSystemSK_DomainType]
GO
