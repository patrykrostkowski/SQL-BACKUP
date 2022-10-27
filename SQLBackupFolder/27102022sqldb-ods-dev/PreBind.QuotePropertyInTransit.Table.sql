USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuotePropertyInTransit]    Script Date: 27.10.2022 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuotePropertyInTransit](
	[QuotePropertyInTransitSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteIMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_QuotePropertyInTransit] PRIMARY KEY CLUSTERED 
(
	[QuotePropertyInTransitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuotePropertyInTransit]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuotePropertyInTransit] ON [PreBind].[QuotePropertyInTransit]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuotePropertyInTransit]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteIMTransportationClassSK_QuotePropertyInTransit] FOREIGN KEY([QuoteIMTransportationClassSK])
REFERENCES [PreBind].[QuoteIMTransportationClass] ([QuoteIMTransportationClassSK])
GO
ALTER TABLE [PreBind].[QuotePropertyInTransit] NOCHECK CONSTRAINT [FK_QuoteIMTransportationClassSK_QuotePropertyInTransit]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Property in Transit, also called Goods in Transit, pertains to the insurance for goods being shipped, for which the seller is 
usually responsible.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuotePropertyInTransit'
GO
