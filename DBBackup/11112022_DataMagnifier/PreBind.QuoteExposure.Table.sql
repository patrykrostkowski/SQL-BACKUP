USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteExposure]    Script Date: 12.11.2022 09:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteExposure]') AND type in (N'U'))
BEGIN
CREATE TABLE [PreBind].[QuoteExposure](
	[QuoteExposureSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteCoverageSK] [int] NULL,
	[ExposureTypeSK] [int] NOT NULL,
	[CurrencySK] [int] NOT NULL,
	[ExposureAmt] [decimal](19, 4) NULL,
	[ExposureDesc] [varchar](150) NULL,
 CONSTRAINT [PK_QuoteExposure] PRIMARY KEY CLUSTERED 
(
	[QuoteExposureSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteExposure]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteExposure]'))
ALTER TABLE [PreBind].[QuoteExposure]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteExposure] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteExposure]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteExposure]'))
ALTER TABLE [PreBind].[QuoteExposure] CHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteExposure]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteExposure]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteExposure]'))
ALTER TABLE [PreBind].[QuoteExposure]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteExposure] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteExposure]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteExposure]'))
ALTER TABLE [PreBind].[QuoteExposure] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteExposure]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteExposure]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteExposure]'))
ALTER TABLE [PreBind].[QuoteExposure]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteExposure] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteExposure]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteExposure]'))
ALTER TABLE [PreBind].[QuoteExposure] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteExposure]
GO
