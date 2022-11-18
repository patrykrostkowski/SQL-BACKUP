USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PremiumType]    Script Date: 18.11.2022 16:41:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[PremiumType](
	[PremiumTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PremiumTypeCode] [varchar](20) NOT NULL,
	[PremiumTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PremiumType] PRIMARY KEY CLUSTERED 
(
	[PremiumTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[PremiumType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PremiumType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[PremiumType] CHECK CONSTRAINT [FK_SourceSystemSK_PremiumType]
GO
