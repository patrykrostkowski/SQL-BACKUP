USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[AccidentViolation]    Script Date: 28.10.2022 12:26:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[AccidentViolation](
	[AccidentViolationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[DriverSK] [int] NULL,
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
 CONSTRAINT [PK_AccidentViolation] PRIMARY KEY CLUSTERED 
(
	[AccidentViolationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_AccidentViolation]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_AccidentViolation] ON [Policy].[AccidentViolation]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[AccidentViolation]  WITH NOCHECK ADD  CONSTRAINT [FK_DriverSK_AccidentViolation] FOREIGN KEY([DriverSK])
REFERENCES [Policy].[Driver] ([DriverSK])
GO
ALTER TABLE [Policy].[AccidentViolation] NOCHECK CONSTRAINT [FK_DriverSK_AccidentViolation]
GO
ALTER TABLE [Policy].[AccidentViolation]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_AccidentViolation] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[AccidentViolation] NOCHECK CONSTRAINT [FK_SourceSystemSK_AccidentViolation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Represents a driving event or incident referenced as part of underwriting process.  Examples driving violation, accident…' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'AccidentViolation'
GO
