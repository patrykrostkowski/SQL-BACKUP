USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteCyberSummary]    Script Date: 10.11.2022 14:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteCyberSummary]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteCyberSummary]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCyberSummary]'))
ALTER TABLE [PreBind].[QuoteCyberSummary]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteCyberSummary] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteCyberSummary]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCyberSummary]'))
ALTER TABLE [PreBind].[QuoteCyberSummary] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteCyberSummary]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteCyberSummary]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCyberSummary]'))
ALTER TABLE [PreBind].[QuoteCyberSummary]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteCyberSummary] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteCyberSummary]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCyberSummary]'))
ALTER TABLE [PreBind].[QuoteCyberSummary] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteCyberSummary]
GO
