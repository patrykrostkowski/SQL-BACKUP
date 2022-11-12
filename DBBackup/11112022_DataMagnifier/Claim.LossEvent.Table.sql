USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEvent]    Script Date: 12.11.2022 09:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[LossEvent]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCurrencySK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_LossEvent] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCurrencySK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_ClaimCurrencySK_LossEvent]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_LossEvent] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_ClaimSK_LossEvent]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSalvageSK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSalvageSK_LossEvent] FOREIGN KEY([LossEventSalvageSK])
REFERENCES [Claim].[LossEventSalvage] ([LossEventSalvageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSalvageSK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_LossEventSalvageSK_LossEvent]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventTypeSK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_LossEventTypeSK_LossEvent] FOREIGN KEY([LossEventTypeSK])
REFERENCES [TypeList].[LossEventType] ([LossEventTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventTypeSK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_LossEventTypeSK_LossEvent]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SeveritySK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_SeveritySK_LossEvent] FOREIGN KEY([SeveritySK])
REFERENCES [TypeList].[Severity] ([SeveritySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SeveritySK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_SeveritySK_LossEvent]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEvent] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_LossEvent]') AND parent_object_id = OBJECT_ID(N'[Claim].[LossEvent]'))
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_SourceSystemSK_LossEvent]
GO
