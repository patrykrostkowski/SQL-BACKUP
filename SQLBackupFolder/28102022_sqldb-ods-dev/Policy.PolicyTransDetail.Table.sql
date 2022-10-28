﻿USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyTransDetail]    Script Date: 28.10.2022 15:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyTransDetail](
	[PolicyTransDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[IsTradeAssocInd] [tinyint] NULL,
	[IndustryClassCode] [varchar](20) NULL,
	[IsMultilineDiscountInd] [tinyint] NULL,
	[IsDriverMonitoringInfoInd] [tinyint] NULL,
	[IsManualAuditInd] [tinyint] NULL,
	[MarketSegmentCode] [varchar](20) NULL,
	[IsTPAUsedInd] [tinyint] NULL,
	[NumEmployee] [int] NULL,
	[IsBrokerageInd] [tinyint] NULL,
	[IsUnionInd] [tinyint] NULL,
	[IsQuoteEZPayInd] [tinyint] NULL,
 CONSTRAINT [PK_PolicyTransDetail] PRIMARY KEY CLUSTERED 
(
	[PolicyTransDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyTransDetail]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyTransDetail] ON [Policy].[PolicyTransDetail]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyTransDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyTransDetail] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyTransDetail] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyTransDetail]
GO
ALTER TABLE [Policy].[PolicyTransDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyTransDetail] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransDetail]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Miscellaneous detail associated with a Policy Trans activity.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyTransDetail'
GO
