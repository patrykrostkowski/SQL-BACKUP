﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClaimSubType]    Script Date: 10.11.2022 14:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ClaimSubType](
	[ClaimSubTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClaimSubTypeCode] [varchar](20) NOT NULL,
	[ClaimSubTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimSubType] PRIMARY KEY CLUSTERED 
(
	[ClaimSubTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[ClaimSubType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimSubType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ClaimSubType] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimSubType]
GO
