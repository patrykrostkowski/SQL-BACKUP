﻿USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ReserveCategory]    Script Date: 08.11.2022 08:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ReserveCategory](
	[ReserveCategorySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ReserveCategoryCode] [varchar](20) NOT NULL,
	[ReserveCategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ReserveCategory] PRIMARY KEY CLUSTERED 
(
	[ReserveCategorySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[ReserveCategory]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ReserveCategory] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ReserveCategory] CHECK CONSTRAINT [FK_SourceSystemSK_ReserveCategory]
GO
