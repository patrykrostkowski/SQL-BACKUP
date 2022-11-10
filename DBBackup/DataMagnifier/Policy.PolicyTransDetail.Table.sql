USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyTransDetail]    Script Date: 10.11.2022 13:58:51 ******/
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
ALTER TABLE [Policy].[PolicyTransDetail]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyTransDetail] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyTransDetail] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyTransDetail]
GO
ALTER TABLE [Policy].[PolicyTransDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyTransDetail] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransDetail]
GO
