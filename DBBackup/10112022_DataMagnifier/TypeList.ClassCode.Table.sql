USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClassCode]    Script Date: 10.11.2022 14:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[ClassCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[ClassCode](
	[ClassCodeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClassCode] [varchar](20) NOT NULL,
	[ClassCodeName] [varchar](50) NULL,
	[ClassCodeDesc] [varchar](255) NOT NULL,
	[IsISOCodeInd] [tinyint] NULL,
 CONSTRAINT [PK_ClassCode] PRIMARY KEY CLUSTERED 
(
	[ClassCodeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ClassCode]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ClassCode]'))
ALTER TABLE [TypeList].[ClassCode]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClassCode] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ClassCode]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ClassCode]'))
ALTER TABLE [TypeList].[ClassCode] CHECK CONSTRAINT [FK_SourceSystemSK_ClassCode]
GO
