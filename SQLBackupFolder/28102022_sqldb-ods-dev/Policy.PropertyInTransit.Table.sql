USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PropertyInTransit]    Script Date: 28.10.2022 13:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PropertyInTransit](
	[PropertyInTransitSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[IMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_PropertyInTransit] PRIMARY KEY CLUSTERED 
(
	[PropertyInTransitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PropertyInTransit]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PropertyInTransit] ON [Policy].[PropertyInTransit]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PropertyInTransit]  WITH NOCHECK ADD  CONSTRAINT [FK_IMTransportationClassSK_PropertyInTransit] FOREIGN KEY([IMTransportationClassSK])
REFERENCES [Policy].[IMTransportationClass] ([IMTransportationClassSK])
GO
ALTER TABLE [Policy].[PropertyInTransit] NOCHECK CONSTRAINT [FK_IMTransportationClassSK_PropertyInTransit]
GO
ALTER TABLE [Policy].[PropertyInTransit]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PropertyInTransit] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PropertyInTransit] NOCHECK CONSTRAINT [FK_SourceSystemSK_PropertyInTransit]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Property in Transit, also called Goods in Transit, pertains to the insurance for goods being shipped, for which the seller is 
usually responsible.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PropertyInTransit'
GO
