USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[FaultRating]    Script Date: 28.10.2022 15:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[FaultRating](
	[FaultRatingSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[FaultRatingCode] [varchar](20) NOT NULL,
	[FaultRatingName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FaultRating] PRIMARY KEY CLUSTERED 
(
	[FaultRatingSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_FaultRating]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_FaultRating] ON [Typelist].[FaultRating]
(
	[SourceSystemSK] ASC,
	[FaultRatingCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[FaultRating]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_FaultRating] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[FaultRating] NOCHECK CONSTRAINT [FK_SourceSystemSK_FaultRating]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples physical damage , no fault, insured at fault' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'FaultRating'
GO
