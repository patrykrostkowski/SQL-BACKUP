USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Profession]    Script Date: 10.11.2022 14:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[Profession]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[Profession](
	[ProfessionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ProfessionCode] [varchar](20) NOT NULL,
	[ProfessionName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Profession] PRIMARY KEY CLUSTERED 
(
	[ProfessionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Profession]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Profession]'))
ALTER TABLE [TypeList].[Profession]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Profession] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Profession]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Profession]'))
ALTER TABLE [TypeList].[Profession] CHECK CONSTRAINT [FK_SourceSystemSK_Profession]
GO
