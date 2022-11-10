USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ReserveCategory]    Script Date: 10.11.2022 14:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[ReserveCategory]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ReserveCategory]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ReserveCategory]'))
ALTER TABLE [TypeList].[ReserveCategory]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ReserveCategory] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ReserveCategory]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ReserveCategory]'))
ALTER TABLE [TypeList].[ReserveCategory] CHECK CONSTRAINT [FK_SourceSystemSK_ReserveCategory]
GO
