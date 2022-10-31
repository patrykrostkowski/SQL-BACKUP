USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LossType]    Script Date: 31.10.2022 11:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[LossType](
	[LossTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LossTypeCode] [varchar](20) NOT NULL,
	[LossTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LossType] PRIMARY KEY CLUSTERED 
(
	[LossTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[LossType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[LossType] CHECK CONSTRAINT [FK_SourceSystemSK_LossType]
GO
