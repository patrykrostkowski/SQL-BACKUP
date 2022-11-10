USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[FlaggedType]    Script Date: 10.11.2022 14:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[FlaggedType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[FlaggedType](
	[FlaggedTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[FlaggedTypeCode] [varchar](20) NOT NULL,
	[FlaggedTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FlaggedType] PRIMARY KEY CLUSTERED 
(
	[FlaggedTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_FlaggedType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[FlaggedType]'))
ALTER TABLE [TypeList].[FlaggedType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_FlaggedType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_FlaggedType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[FlaggedType]'))
ALTER TABLE [TypeList].[FlaggedType] CHECK CONSTRAINT [FK_SourceSystemSK_FlaggedType]
GO
