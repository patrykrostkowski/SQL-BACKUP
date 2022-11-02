﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[SalvageStatus]    Script Date: 02.11.2022 14:17:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[SalvageStatus](
	[SalvageStatusSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SalvageStatusCode] [varchar](20) NOT NULL,
	[SalvageStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SalvageStatus] PRIMARY KEY CLUSTERED 
(
	[SalvageStatusSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[SalvageStatus]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_SalvageStatus] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[SalvageStatus] CHECK CONSTRAINT [FK_SourceSystemSK_SalvageStatus]
GO
