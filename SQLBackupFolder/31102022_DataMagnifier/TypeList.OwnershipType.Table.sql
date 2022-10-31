﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[OwnershipType]    Script Date: 31.10.2022 12:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[OwnershipType](
	[OwnershipTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[OwnershipTypeCode] [varchar](20) NOT NULL,
	[OwnershipTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OwnershipType] PRIMARY KEY CLUSTERED 
(
	[OwnershipTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[OwnershipType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_OwnershipType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[OwnershipType] CHECK CONSTRAINT [FK_SourceSystemSK_OwnershipType]
GO
