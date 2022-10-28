USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[RiskRating]    Script Date: 28.10.2022 15:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[RiskRating](
	[RiskRatingSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[RiskRatingCode] [varchar](20) NOT NULL,
	[RiskRatingName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RiskRating] PRIMARY KEY CLUSTERED 
(
	[RiskRatingSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_RiskRating]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_RiskRating] ON [Typelist].[RiskRating]
(
	[RiskRatingCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[RiskRating]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1075] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[RiskRating] NOCHECK CONSTRAINT [RefSourceSystem1075]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples cancellation, policy change, renewal rewrite, issued' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'RiskRating'
GO
