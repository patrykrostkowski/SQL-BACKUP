USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[CatastropheDetail]    Script Date: 02.11.2022 14:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[CatastropheDetail](
	[CatastropheDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[CatastropheSK] [int] NOT NULL,
	[LossCauseSK] [int] NOT NULL,
	[LossTypeSK] [int] NOT NULL,
 CONSTRAINT [PK_CatastropheDetail] PRIMARY KEY CLUSTERED 
(
	[CatastropheDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[CatastropheDetail]  WITH CHECK ADD  CONSTRAINT [FK_CatastropheSK_CatastropheDetail] FOREIGN KEY([CatastropheSK])
REFERENCES [Claim].[Catastrophe] ([CatastropheSK])
GO
ALTER TABLE [Claim].[CatastropheDetail] CHECK CONSTRAINT [FK_CatastropheSK_CatastropheDetail]
GO
ALTER TABLE [Claim].[CatastropheDetail]  WITH CHECK ADD  CONSTRAINT [FK_LossCauseSK_CatastropheDetail] FOREIGN KEY([LossCauseSK])
REFERENCES [TypeList].[LossCause] ([LossCauseSK])
GO
ALTER TABLE [Claim].[CatastropheDetail] CHECK CONSTRAINT [FK_LossCauseSK_CatastropheDetail]
GO
ALTER TABLE [Claim].[CatastropheDetail]  WITH CHECK ADD  CONSTRAINT [FK_LossTypeSK_CatastropheDetail] FOREIGN KEY([LossTypeSK])
REFERENCES [TypeList].[LossType] ([LossTypeSK])
GO
ALTER TABLE [Claim].[CatastropheDetail] CHECK CONSTRAINT [FK_LossTypeSK_CatastropheDetail]
GO
ALTER TABLE [Claim].[CatastropheDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CatastropheDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[CatastropheDetail] CHECK CONSTRAINT [FK_SourceSystemSK_CatastropheDetail]
GO
