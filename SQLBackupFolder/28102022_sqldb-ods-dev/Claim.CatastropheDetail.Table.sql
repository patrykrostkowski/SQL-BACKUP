USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[CatastropheDetail]    Script Date: 28.10.2022 12:26:10 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_CatastropheDetail]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_CatastropheDetail] ON [Claim].[CatastropheDetail]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[CatastropheDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_CatastropheSK_CatastropheDetail] FOREIGN KEY([CatastropheSK])
REFERENCES [Claim].[Catastrophe] ([CatastropheSK])
GO
ALTER TABLE [Claim].[CatastropheDetail] NOCHECK CONSTRAINT [FK_CatastropheSK_CatastropheDetail]
GO
ALTER TABLE [Claim].[CatastropheDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_LossCauseSK_CatastropheDetail] FOREIGN KEY([LossCauseSK])
REFERENCES [Typelist].[LossCause] ([LossCauseSK])
GO
ALTER TABLE [Claim].[CatastropheDetail] NOCHECK CONSTRAINT [FK_LossCauseSK_CatastropheDetail]
GO
ALTER TABLE [Claim].[CatastropheDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_LossTypeSK_CatastropheDetail] FOREIGN KEY([LossTypeSK])
REFERENCES [Typelist].[LossType] ([LossTypeSK])
GO
ALTER TABLE [Claim].[CatastropheDetail] NOCHECK CONSTRAINT [FK_LossTypeSK_CatastropheDetail]
GO
ALTER TABLE [Claim].[CatastropheDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CatastropheDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[CatastropheDetail] NOCHECK CONSTRAINT [FK_SourceSystemSK_CatastropheDetail]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the catastrophic peril, i.e. exposure to a risk, insured against, properties covered, locations covered, individuals insured and the limits of indemnification.' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'CatastropheDetail'
GO
