﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PhoneType]    Script Date: 02.11.2022 14:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[PhoneType](
	[PhoneTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PhoneTypeCode] [varchar](20) NOT NULL,
	[PhoneTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PhoneType] PRIMARY KEY CLUSTERED 
(
	[PhoneTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[PhoneType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PhoneType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[PhoneType] CHECK CONSTRAINT [FK_SourceSystemSK_PhoneType]
GO
