USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteCyberDetail]    Script Date: 10.11.2022 14:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteCyberDetail]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCyberSummarySK_QuoteCyberDetail]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCyberDetail]'))
ALTER TABLE [PreBind].[QuoteCyberDetail]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCyberSummarySK_QuoteCyberDetail] FOREIGN KEY([QuoteCyberSummarySK])
REFERENCES [PreBind].[QuoteCyberSummary] ([QuoteCyberSummarySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCyberSummarySK_QuoteCyberDetail]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCyberDetail]'))
ALTER TABLE [PreBind].[QuoteCyberDetail] CHECK CONSTRAINT [FK_QuoteCyberSummarySK_QuoteCyberDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteCyberDetail]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCyberDetail]'))
ALTER TABLE [PreBind].[QuoteCyberDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteCyberDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteCyberDetail]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCyberDetail]'))
ALTER TABLE [PreBind].[QuoteCyberDetail] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteCyberDetail]
GO
