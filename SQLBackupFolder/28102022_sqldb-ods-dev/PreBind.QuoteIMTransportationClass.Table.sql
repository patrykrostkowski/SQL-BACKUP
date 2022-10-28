USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteIMTransportationClass]    Script Date: 28.10.2022 11:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteIMTransportationClass](
	[QuoteIMTransportationClassSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteInsurableObjectSK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteIMTransportationClass] PRIMARY KEY CLUSTERED 
(
	[QuoteIMTransportationClassSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteIMTransportationClass]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteIMTransportationClass] ON [PreBind].[QuoteIMTransportationClass]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteIMTransportationClass]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteIMTransportationClass] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteIMTransportationClass] NOCHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteIMTransportationClass]
GO
ALTER TABLE [PreBind].[QuoteIMTransportationClass]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem945] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteIMTransportationClass] NOCHECK CONSTRAINT [RefSourceSystem945]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Transportation Class is a subtype of Insurable Object that describes the kinds of Transportation being insured.  
Transportation is a type of  Inland Marine  insurance.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteIMTransportationClass'
GO
