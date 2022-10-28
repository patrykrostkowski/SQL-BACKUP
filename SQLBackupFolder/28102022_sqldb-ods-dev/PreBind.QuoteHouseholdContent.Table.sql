USE [sqldb-ods-dev]
GO
/****** Object:  Table [PreBind].[QuoteHouseholdContent]    Script Date: 28.10.2022 15:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteHouseholdContent](
	[QuoteHouseholdContentSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteIMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteHouseholdContent] PRIMARY KEY CLUSTERED 
(
	[QuoteHouseholdContentSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_QuoteHouseholdContent]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_QuoteHouseholdContent] ON [PreBind].[QuoteHouseholdContent]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteHouseholdContent]  WITH NOCHECK ADD  CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteHouseholdContent] FOREIGN KEY([QuoteIMTransportationClassSK])
REFERENCES [PreBind].[QuoteIMTransportationClass] ([QuoteIMTransportationClassSK])
GO
ALTER TABLE [PreBind].[QuoteHouseholdContent] NOCHECK CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteHouseholdContent]
GO
ALTER TABLE [PreBind].[QuoteHouseholdContent]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem946] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteHouseholdContent] NOCHECK CONSTRAINT [RefSourceSystem946]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Household Content is a categorization and description of all Insurable Objects - personal property -  within a residence, 
which details all items covered and indemnified in the event an insurance claim must be filed.' , @level0type=N'SCHEMA',@level0name=N'PreBind', @level1type=N'TABLE',@level1name=N'QuoteHouseholdContent'
GO
