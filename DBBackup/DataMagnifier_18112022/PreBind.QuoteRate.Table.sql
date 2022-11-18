USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteRate]    Script Date: 18.11.2022 16:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteRate](
	[QuoteRateSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteCoverageSK] [int] NULL,
	[RateLevelSK] [int] NOT NULL,
	[RateTypeSK] [int] NOT NULL,
	[RateAmt] [decimal](19, 4) NOT NULL,
	[RateDesc] [varchar](255) NULL,
	[CoverageClassSK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteRate] PRIMARY KEY CLUSTERED 
(
	[QuoteRateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteRate]  WITH CHECK ADD  CONSTRAINT [FK_CoverageClassSK_QuoteRate] FOREIGN KEY([CoverageClassSK])
REFERENCES [TypeList].[CoverageClass] ([CoverageClassSK])
GO
ALTER TABLE [PreBind].[QuoteRate] CHECK CONSTRAINT [FK_CoverageClassSK_QuoteRate]
GO
ALTER TABLE [PreBind].[QuoteRate]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteRate] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
ALTER TABLE [PreBind].[QuoteRate] CHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteRate]
GO
ALTER TABLE [PreBind].[QuoteRate]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteRate] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteRate] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteRate]
GO
