USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteCyberSummary]    Script Date: 31.10.2022 11:54:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteCyberSummary](
	[QuoteCyberSummarySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[IsLogicallyDeleted] [tinyint] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NULL,
	[CyberGrantSK] [int] NOT NULL,
	[LevelSK] [int] NOT NULL,
	[CyberSummaryTypeSK] [int] NOT NULL,
	[CurrencySK] [int] NOT NULL,
	[CyberSummaryValue] [decimal](28, 6) NOT NULL,
 CONSTRAINT [PK_QuoteCyberSummary] PRIMARY KEY CLUSTERED 
(
	[QuoteCyberSummarySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteCyberSummary]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteCyberSummary] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteCyberSummary] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteCyberSummary]
GO
ALTER TABLE [PreBind].[QuoteCyberSummary]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteCyberSummary] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteCyberSummary] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteCyberSummary]
GO
