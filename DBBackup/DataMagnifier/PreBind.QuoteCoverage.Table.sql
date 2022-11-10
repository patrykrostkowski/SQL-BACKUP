USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteCoverage]    Script Date: 10.11.2022 13:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuoteCoverage](
	[QuoteCoverageSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteLineofBusinessSK] [int] NOT NULL,
	[QuoteGeographySK] [int] NULL,
	[AnnualStatementLineofBusinessSK] [int] NULL,
	[QuoteInsurableObjectSK] [int] NULL,
	[CoverageSK] [int] NOT NULL,
	[CoverageTriggerSK] [int] NULL,
	[ClassCodeSK] [int] NULL,
	[IsMajorCoverageInd] [int] NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[CancellationDate] [date] NULL,
	[CurrentTermBaseAmt] [decimal](19, 4) NULL,
	[BaseCurrencySK] [int] NULL,
	[WrittenPremiumBaseAmt] [decimal](19, 4) NULL,
	[IsIncludedInPremiumInd] [tinyint] NULL,
 CONSTRAINT [PK_QuoteCoverage] PRIMARY KEY CLUSTERED 
(
	[QuoteCoverageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_AnnualStatementLineofBusinessSK_QuoteCoverage] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [TypeList].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_AnnualStatementLineofBusinessSK_QuoteCoverage]
GO
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_ClassCodeSK_QuoteCoverage] FOREIGN KEY([ClassCodeSK])
REFERENCES [TypeList].[ClassCode] ([ClassCodeSK])
GO
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_ClassCodeSK_QuoteCoverage]
GO
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_CoverageSK_QuoteCoverage] FOREIGN KEY([CoverageSK])
REFERENCES [TypeList].[Coverage] ([CoverageSK])
GO
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_CoverageSK_QuoteCoverage]
GO
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_QuoteCoverage] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [TypeList].[CoverageTrigger] ([CoverageTriggerSK])
GO
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_CoverageTriggerSK_QuoteCoverage]
GO
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteCoverage] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_QuoteGeographySK_QuoteCoverage]
GO
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteCoverage] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteCoverage]
GO
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteCoverage] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteCoverage]
GO
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteCoverage] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteCoverage]
GO
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteCoverage]
GO
