﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[CostType]    Script Date: 18.11.2022 16:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[CostType](
	[CostTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CostTypeCode] [varchar](20) NOT NULL,
	[CostTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CostType] PRIMARY KEY CLUSTERED 
(
	[CostTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[CostType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CostType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[CostType] CHECK CONSTRAINT [FK_SourceSystemSK_CostType]
GO
