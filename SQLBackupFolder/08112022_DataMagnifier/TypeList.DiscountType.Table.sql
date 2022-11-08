USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[DiscountType]    Script Date: 08.11.2022 08:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[DiscountType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_DiscountType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[DiscountType] CHECK CONSTRAINT [FK_SourceSystemSK_DiscountType]
GO
