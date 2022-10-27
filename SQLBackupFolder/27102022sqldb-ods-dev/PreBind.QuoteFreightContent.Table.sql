USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteFreightContent]    Script Date: 27.10.2022 12:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteFreightContent](
	[QuoteContnetSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteIMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteFreightContent] PRIMARY KEY CLUSTERED 
(
	[QuoteContnetSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteFreightContent]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteFreightContent] ON [PreBind].[QuoteFreightContent]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteFreightContent]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteFreightContent] FOREIGN KEY([QuoteIMTransportationClassSK])
REFERENCES [PreBind].[QuoteIMTransportationClass] ([QuoteIMTransportationClassSK])
GO
ALTER TABLE [PreBind].[QuoteFreightContent] NOCHECK CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteFreightContent]
GO
ALTER TABLE [PreBind].[QuoteFreightContent]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteFreightContent] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteFreightContent] NOCHECK CONSTRAINT [FK_SourceSystemSK_QuoteFreightContent]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Freight Content addresses information on intransit good' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteFreightContent'
GO
