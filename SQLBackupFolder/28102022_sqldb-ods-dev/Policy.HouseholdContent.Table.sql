USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[HouseholdContent]    Script Date: 28.10.2022 12:26:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[HouseholdContent](
	[HouseholdContentSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[IMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_HouseholdContent] PRIMARY KEY CLUSTERED 
(
	[HouseholdContentSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_HouseholdContent]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_HouseholdContent] ON [Policy].[HouseholdContent]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[HouseholdContent]  WITH NOCHECK ADD  CONSTRAINT [FK_IMTransportationClassSK_HouseholdContent] FOREIGN KEY([IMTransportationClassSK])
REFERENCES [Policy].[IMTransportationClass] ([IMTransportationClassSK])
GO
ALTER TABLE [Policy].[HouseholdContent] NOCHECK CONSTRAINT [FK_IMTransportationClassSK_HouseholdContent]
GO
ALTER TABLE [Policy].[HouseholdContent]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_HouseholdContent] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[HouseholdContent] NOCHECK CONSTRAINT [FK_SourceSystemSK_HouseholdContent]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Household Content is a categorization and description of all Insurable Objects - personal property -  within a residence, 
which details all items covered and indemnified in the event an insurance claim must be filed.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'HouseholdContent'
GO
