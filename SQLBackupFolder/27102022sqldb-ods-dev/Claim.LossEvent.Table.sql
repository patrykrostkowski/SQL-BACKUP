USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[LossEvent]    Script Date: 27.10.2022 12:26:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[LossEvent](
	[LossEventSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NULL,
	[LossEventTypeSK] [int] NOT NULL,
	[LossEventDesc] [varchar](250) NULL,
	[SeveritySK] [int] NULL,
	[LossEventSalvageSK] [int] NULL,
	[ClaimCurrencySK] [int] NOT NULL,
	[IsSalvageOwnerRetainedInd] [tinyint] NULL,
	[IsSalvageWaivedInd] [tinyint] NULL,
	[LossEstimateAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_LossEvent] PRIMARY KEY CLUSTERED 
(
	[LossEventSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossEvent]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossEvent] ON [Claim].[LossEvent]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEvent]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_LossEvent] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Claim].[LossEvent] NOCHECK CONSTRAINT [FK_ClaimCurrencySK_LossEvent]
GO
ALTER TABLE [Claim].[LossEvent]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_LossEvent] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[LossEvent] NOCHECK CONSTRAINT [FK_ClaimSK_LossEvent]
GO
ALTER TABLE [Claim].[LossEvent]  WITH NOCHECK ADD  CONSTRAINT [FK_LossEventSalvageSK_LossEvent] FOREIGN KEY([LossEventSalvageSK])
REFERENCES [Claim].[LossEventSalvage] ([LossEventSalvageSK])
GO
ALTER TABLE [Claim].[LossEvent] NOCHECK CONSTRAINT [FK_LossEventSalvageSK_LossEvent]
GO
ALTER TABLE [Claim].[LossEvent]  WITH NOCHECK ADD  CONSTRAINT [FK_LossEventTypeSK_LossEvent] FOREIGN KEY([LossEventTypeSK])
REFERENCES [Typelist].[LossEventType] ([LossEventTypeSK])
GO
ALTER TABLE [Claim].[LossEvent] NOCHECK CONSTRAINT [FK_LossEventTypeSK_LossEvent]
GO
ALTER TABLE [Claim].[LossEvent]  WITH NOCHECK ADD  CONSTRAINT [FK_SeveritySK_LossEvent] FOREIGN KEY([SeveritySK])
REFERENCES [Typelist].[Severity] ([SeveritySK])
GO
ALTER TABLE [Claim].[LossEvent] NOCHECK CONSTRAINT [FK_SeveritySK_LossEvent]
GO
ALTER TABLE [Claim].[LossEvent]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEvent] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEvent] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossEvent]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An event (aka incident) is the base of one or several claims.  The event is qualified by a date, a location, a type, a potential cause, eventual circumstances.' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'LossEvent'
GO
