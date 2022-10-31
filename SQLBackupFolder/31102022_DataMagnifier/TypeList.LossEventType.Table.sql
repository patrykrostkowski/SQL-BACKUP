﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LossEventType]    Script Date: 31.10.2022 12:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[LossEventType](
	[LossEventTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LossEventTypeCode] [varchar](20) NOT NULL,
	[LossEventTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LossEventType] PRIMARY KEY CLUSTERED 
(
	[LossEventTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[LossEventType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[LossEventType] CHECK CONSTRAINT [FK_SourceSystemSK_LossEventType]
GO
