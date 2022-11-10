USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[DiscountType]    Script Date: 10.11.2022 14:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[DiscountType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[DiscountType](
	[DiscountTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[DiscountTypeCode] [varchar](20) NOT NULL,
	[DiscountTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DiscountType] PRIMARY KEY CLUSTERED 
(
	[DiscountTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_DiscountType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[DiscountType]'))
ALTER TABLE [TypeList].[DiscountType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_DiscountType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_DiscountType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[DiscountType]'))
ALTER TABLE [TypeList].[DiscountType] CHECK CONSTRAINT [FK_SourceSystemSK_DiscountType]
GO
