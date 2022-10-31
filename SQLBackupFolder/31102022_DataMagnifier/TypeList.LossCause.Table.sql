﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LossCause]    Script Date: 31.10.2022 12:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[LossCause](
	[LossCauseSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LossCauseCode] [varchar](20) NOT NULL,
	[LossCauseName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LossCause] PRIMARY KEY CLUSTERED 
(
	[LossCauseSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[LossCause]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossCause] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[LossCause] CHECK CONSTRAINT [FK_SourceSystemSK_LossCause]
GO
