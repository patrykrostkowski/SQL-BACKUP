USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[TreatyCategory]    Script Date: 02.11.2022 14:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[TreatyCategory](
	[TreatyCategorySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[TreatyCategoryCode] [varchar](20) NOT NULL,
	[TreatyCategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TreatyCategory] PRIMARY KEY CLUSTERED 
(
	[TreatyCategorySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[TreatyCategory]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_TreatyCategory] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[TreatyCategory] CHECK CONSTRAINT [FK_SourceSystemSK_TreatyCategory]
GO
