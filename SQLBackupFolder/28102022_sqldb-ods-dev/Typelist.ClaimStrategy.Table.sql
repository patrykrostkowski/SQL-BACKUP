USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ClaimStrategy]    Script Date: 28.10.2022 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ClaimStrategy](
	[ClaimStrategySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClaimStrategyCode] [varchar](20) NOT NULL,
	[ClaimStrategyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimStrategy] PRIMARY KEY CLUSTERED 
(
	[ClaimStrategySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimStrategy]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimStrategy] ON [Typelist].[ClaimStrategy]
(
	[SourceSystemSK] ASC,
	[ClaimStrategyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ClaimStrategy]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimStrategy] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ClaimStrategy] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimStrategy]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples investigate, fast track,' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ClaimStrategy'
GO
