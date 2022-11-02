USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteLimit]    Script Date: 02.11.2022 12:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteLimit](
	[QuoteLimitSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NULL,
	[QuoteCoverageSK] [int] NULL,
	[LimitTypeSK] [int] NULL,
	[LimitLevelDesc] [varchar](50) NULL,
	[CurrencySK] [int] NULL,
	[LimitAmt] [decimal](18, 2) NULL,
	[IsDeleteInd] [tinyint] NULL,
 CONSTRAINT [PK_QuoteLimit] PRIMARY KEY CLUSTERED 
(
	[QuoteLimitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteLimit]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteLimit] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteLimit] CHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteLimit]
GO
ALTER TABLE [PreBind].[QuoteLimit]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteLimit] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteLimit] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteLimit]
GO
ALTER TABLE [PreBind].[QuoteLimit]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteLimit] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteLimit] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteLimit]
GO
