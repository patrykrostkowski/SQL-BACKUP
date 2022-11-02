USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteCyberDetail]    Script Date: 02.11.2022 12:55:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteCyberDetail](
	[QuoteCyberDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteCyberSummarySK] [int] NOT NULL,
	[IsLogicallyDeleted] [tinyint] NOT NULL,
	[CyberCoverageSK] [int] NOT NULL,
	[LevelSK] [int] NOT NULL,
	[CyberDetailTypeSK] [int] NOT NULL,
	[CurrencySK] [int] NOT NULL,
	[CyberDetailValue] [decimal](28, 6) NOT NULL,
 CONSTRAINT [PK_QuoteCyberDetail] PRIMARY KEY CLUSTERED 
(
	[QuoteCyberDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteCyberDetail]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCyberSummarySK_QuoteCyberDetail] FOREIGN KEY([QuoteCyberSummarySK])
REFERENCES [PreBind].[QuoteCyberSummary] ([QuoteCyberSummarySK])
GO
ALTER TABLE [PreBind].[QuoteCyberDetail] CHECK CONSTRAINT [FK_QuoteCyberSummarySK_QuoteCyberDetail]
GO
ALTER TABLE [PreBind].[QuoteCyberDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteCyberDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteCyberDetail] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteCyberDetail]
GO
