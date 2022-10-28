USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[FreightContent]    Script Date: 28.10.2022 15:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[FreightContent](
	[FreightContnetSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[IMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_FreightContent] PRIMARY KEY CLUSTERED 
(
	[FreightContnetSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_FreightContent]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_FreightContent] ON [Policy].[FreightContent]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[FreightContent]  WITH NOCHECK ADD  CONSTRAINT [FK_IMTransportationClassSK_FreightContent] FOREIGN KEY([IMTransportationClassSK])
REFERENCES [Policy].[IMTransportationClass] ([IMTransportationClassSK])
GO
ALTER TABLE [Policy].[FreightContent] NOCHECK CONSTRAINT [FK_IMTransportationClassSK_FreightContent]
GO
ALTER TABLE [Policy].[FreightContent]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_FreightContent] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[FreightContent] NOCHECK CONSTRAINT [FK_SourceSystemSK_FreightContent]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Freight Content addresses information on intransit good' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'FreightContent'
GO
