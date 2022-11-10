USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[AmountType]    Script Date: 10.11.2022 14:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[AmountType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[AmountType](
	[AmountTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[AmountTypeCode] [varchar](20) NOT NULL,
	[AmountTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AmountType] PRIMARY KEY CLUSTERED 
(
	[AmountTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_AmountType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[AmountType]'))
ALTER TABLE [TypeList].[AmountType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_AmountType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_AmountType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[AmountType]'))
ALTER TABLE [TypeList].[AmountType] CHECK CONSTRAINT [FK_SourceSystemSK_AmountType]
GO
