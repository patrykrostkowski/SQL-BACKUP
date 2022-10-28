USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[PricingLevel]    Script Date: 28.10.2022 15:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[PricingLevel](
	[PricingLevelSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PricingLevelCode] [varchar](20) NOT NULL,
	[PricingLevelName] [varchar](50) NULL,
	[PricingLevelDesc] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PricingLevel] PRIMARY KEY CLUSTERED 
(
	[PricingLevelSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PricingLevel]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PricingLevel] ON [Typelist].[PricingLevel]
(
	[PricingLevelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[PricingLevel]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1071] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[PricingLevel] NOCHECK CONSTRAINT [RefSourceSystem1071]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pricing Level' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'PricingLevel'
GO
