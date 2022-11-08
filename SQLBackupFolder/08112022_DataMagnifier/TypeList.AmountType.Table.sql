USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[AmountType]    Script Date: 08.11.2022 08:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[AmountType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_AmountType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[AmountType] CHECK CONSTRAINT [FK_SourceSystemSK_AmountType]
GO
