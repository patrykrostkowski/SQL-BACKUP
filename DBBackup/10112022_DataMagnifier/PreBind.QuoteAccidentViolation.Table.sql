USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteAccidentViolation]    Script Date: 10.11.2022 14:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteAccidentViolation]') AND type in (N'U'))
BEGIN
CREATE TABLE [PreBind].[QuoteAccidentViolation](
	[QuoteAccidentViolationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteDriverSK] [int] NOT NULL,
	[AccidentViolationCode] [varchar](20) NULL,
	[AccidentViolationDate] [date] NULL,
	[DamageAmt] [decimal](18, 3) NULL,
	[SurchargePointsNum] [int] NULL,
	[AccidentViolationDesc] [varchar](255) NULL,
	[PlaceIncident] [varchar](255) NULL,
	[PaidLossDate] [date] NULL,
	[ConvictionDate] [date] NULL,
	[isBodilyInjuryInd] [tinyint] NULL,
	[IsChargeableInd] [tinyint] NULL,
	[DriverResponsiblePct] [decimal](8, 2) NULL,
 CONSTRAINT [PK_QuoteAccidentViolation] PRIMARY KEY CLUSTERED 
(
	[QuoteAccidentViolationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteDriverSK_QuoteAccidentViolation]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAccidentViolation]'))
ALTER TABLE [PreBind].[QuoteAccidentViolation]  WITH CHECK ADD  CONSTRAINT [FK_QuoteDriverSK_QuoteAccidentViolation] FOREIGN KEY([QuoteDriverSK])
REFERENCES [PreBind].[QuoteDriver] ([QuoteDriverSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteDriverSK_QuoteAccidentViolation]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAccidentViolation]'))
ALTER TABLE [PreBind].[QuoteAccidentViolation] CHECK CONSTRAINT [FK_QuoteDriverSK_QuoteAccidentViolation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteAccidentViolation]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAccidentViolation]'))
ALTER TABLE [PreBind].[QuoteAccidentViolation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteAccidentViolation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteAccidentViolation]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteAccidentViolation]'))
ALTER TABLE [PreBind].[QuoteAccidentViolation] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteAccidentViolation]
GO
