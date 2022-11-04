﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ValidationLevel]    Script Date: 04.11.2022 15:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ValidationLevel](
	[ValidationLevelSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ValidationLevelCode] [varchar](20) NOT NULL,
	[ValidationLevelName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ValidationLevel] PRIMARY KEY CLUSTERED 
(
	[ValidationLevelSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[ValidationLevel]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ValidationLevel] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ValidationLevel] CHECK CONSTRAINT [FK_SourceSystemSK_ValidationLevel]
GO
