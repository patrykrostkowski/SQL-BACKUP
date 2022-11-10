USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteCoverage]    Script Date: 10.11.2022 14:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_AnnualStatementLineofBusinessSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_AnnualStatementLineofBusinessSK_QuoteCoverage] FOREIGN KEY([AnnualStatementLineofBusinessSK])
REFERENCES [TypeList].[AnnualStatementLineofBusiness] ([AnnualStatementLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_AnnualStatementLineofBusinessSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_AnnualStatementLineofBusinessSK_QuoteCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_ClassCodeSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_ClassCodeSK_QuoteCoverage] FOREIGN KEY([ClassCodeSK])
REFERENCES [TypeList].[ClassCode] ([ClassCodeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_ClassCodeSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_ClassCodeSK_QuoteCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_CoverageSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_CoverageSK_QuoteCoverage] FOREIGN KEY([CoverageSK])
REFERENCES [TypeList].[Coverage] ([CoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_CoverageSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_CoverageSK_QuoteCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_CoverageTriggerSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_CoverageTriggerSK_QuoteCoverage] FOREIGN KEY([CoverageTriggerSK])
REFERENCES [TypeList].[CoverageTrigger] ([CoverageTriggerSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_CoverageTriggerSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_CoverageTriggerSK_QuoteCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteGeographySK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_QuoteGeographySK_QuoteCoverage] FOREIGN KEY([QuoteGeographySK])
REFERENCES [PreBind].[QuoteGeography] ([QuoteGeographySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteGeographySK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_QuoteGeographySK_QuoteCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteCoverage] FOREIGN KEY([QuoteInsurableObjectSK])
REFERENCES [PreBind].[QuoteInsurableObject] ([QuoteInsurableObjectSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteInsurableObjectSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_QuoteInsurableObjectSK_QuoteCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteLineofBusinessSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteCoverage] FOREIGN KEY([QuoteLineofBusinessSK])
REFERENCES [PreBind].[QuoteLineofBusiness] ([QuoteLineofBusinessSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteLineofBusinessSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_QuoteLineofBusinessSK_QuoteCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteCoverage] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteCoverage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteCoverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteCoverage]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteCoverage]'))
ALTER TABLE [PreBind].[QuoteCoverage] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteCoverage]
GO
