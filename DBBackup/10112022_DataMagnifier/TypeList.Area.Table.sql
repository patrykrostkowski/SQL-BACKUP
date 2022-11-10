﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Area]    Script Date: 10.11.2022 14:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[Area]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[Area](
	[AreaSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[AreaCode] [varchar](20) NOT NULL,
	[AreaName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[AreaSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Area]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Area]'))
ALTER TABLE [TypeList].[Area]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Area] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Area]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Area]'))
ALTER TABLE [TypeList].[Area] CHECK CONSTRAINT [FK_SourceSystemSK_Area]
GO
