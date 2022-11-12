USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteLossHistory]    Script Date: 12.11.2022 09:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteLossHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [PreBind].[QuoteLossHistory](
	[QuoteLossHistorySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[Sourcecode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteSK] [int] NOT NULL,
	[QuoteTransSK] [int] NOT NULL,
	[QuoteCoverageSK] [int] NULL,
	[QuoteNum] [varchar](20) NULL,
	[PolicyNum] [varchar](100) NULL,
	[ClaimNum] [varchar](50) NULL,
	[AddressLine1] [varchar](50) NULL,
	[AddressLine2] [varchar](50) NULL,
	[AddressLine3] [varchar](50) NULL,
	[AddressLine4] [varchar](50) NULL,
	[CityName] [varchar](50) NULL,
	[StateName] [varchar](50) NULL,
	[PostalCode] [varchar](20) NULL,
	[LossReportingFromDate] [date] NULL,
	[LossReportingToDate] [date] NULL,
	[ReopenReasonDesc] [varchar](100) NULL,
	[CoverageName] [varchar](50) NULL,
	[CauseofLossName] [varchar](50) NULL,
	[CarsDamagedNum] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[NetPaidBaseAmt] [decimal](19, 4) NULL,
	[AdjustedPaidBaseAmt] [decimal](19, 4) NULL,
	[DeductibleAppliedBaseAmt] [decimal](19, 4) NULL,
	[NetIncurredLossBaseAmt] [decimal](19, 4) NULL,
	[EndorsementCode] [varchar](20) NULL,
	[LossLevelCode] [varchar](20) NULL,
	[EndorsementSessionNum] [varchar](20) NULL,
	[EndorsementEffectiveDate] [date] NULL,
 CONSTRAINT [PK_QuoteLossHistory] PRIMARY KEY CLUSTERED 
(
	[QuoteLossHistorySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuoteLossHistory]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLossHistory]'))
ALTER TABLE [PreBind].[QuoteLossHistory]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_QuoteLossHistory] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_BaseCurrencySK_QuoteLossHistory]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLossHistory]'))
ALTER TABLE [PreBind].[QuoteLossHistory] CHECK CONSTRAINT [FK_BaseCurrencySK_QuoteLossHistory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteLossHistory]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLossHistory]'))
ALTER TABLE [PreBind].[QuoteLossHistory]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteLossHistory] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteLossHistory]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLossHistory]'))
ALTER TABLE [PreBind].[QuoteLossHistory] CHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteLossHistory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteSK_QuoteLossHistory]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLossHistory]'))
ALTER TABLE [PreBind].[QuoteLossHistory]  WITH CHECK ADD  CONSTRAINT [FK_QuoteSK_QuoteLossHistory] FOREIGN KEY([QuoteSK])
REFERENCES [PreBind].[Quote] ([QuoteSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteSK_QuoteLossHistory]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLossHistory]'))
ALTER TABLE [PreBind].[QuoteLossHistory] CHECK CONSTRAINT [FK_QuoteSK_QuoteLossHistory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteLossHistory]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLossHistory]'))
ALTER TABLE [PreBind].[QuoteLossHistory]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteLossHistory] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteLossHistory]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLossHistory]'))
ALTER TABLE [PreBind].[QuoteLossHistory] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteLossHistory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteLossHistory]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLossHistory]'))
ALTER TABLE [PreBind].[QuoteLossHistory]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteLossHistory] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteLossHistory]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteLossHistory]'))
ALTER TABLE [PreBind].[QuoteLossHistory] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteLossHistory]
GO
