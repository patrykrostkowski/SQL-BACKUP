USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteCyberDetail]    Script Date: 27.10.2022 12:27:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteCyberDetail](
	[QuoteCyberDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteCyberSummarySK] [int] NOT NULL,
	[IsLogicallyDeleted] [tinyint] NOT NULL,
	[CyberCoverageSK] [int] NOT NULL,
	[LevelSK] [int] NOT NULL,
	[CyberDetailTypeSK] [int] NOT NULL,
	[CurrencySK] [int] NOT NULL,
	[CyberDetailValue] [decimal](28, 6) NOT NULL,
 CONSTRAINT [PK_QuoteCyberDetail] PRIMARY KEY CLUSTERED 
(
	[QuoteCyberDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteCyberDetail]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteCyberDetail] ON [PreBind].[QuoteCyberDetail]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteCyberDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteCyberSummarySK_QuoteCyberDetail] FOREIGN KEY([QuoteCyberSummarySK])
REFERENCES [PreBind].[QuoteCyberSummary] ([QuoteCyberSummarySK])
GO
ALTER TABLE [PreBind].[QuoteCyberDetail] NOCHECK CONSTRAINT [FK_QuoteCyberSummarySK_QuoteCyberDetail]
GO
ALTER TABLE [PreBind].[QuoteCyberDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteCyberDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteCyberDetail] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteCyberDetail]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quote Cyber Detail related to items from cyber summary' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteCyberDetail'
GO
