USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[AccidentViolation]    Script Date: 02.11.2022 14:57:41 ******/
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
ALTER TABLE [Policy].[AccidentViolation]  WITH CHECK ADD  CONSTRAINT [FK_DriverSK_AccidentViolation] FOREIGN KEY([DriverSK])
REFERENCES [Policy].[Driver] ([DriverSK])
GO
ALTER TABLE [Policy].[AccidentViolation] CHECK CONSTRAINT [FK_DriverSK_AccidentViolation]
GO
ALTER TABLE [Policy].[AccidentViolation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_AccidentViolation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[AccidentViolation] CHECK CONSTRAINT [FK_SourceSystemSK_AccidentViolation]
GO
