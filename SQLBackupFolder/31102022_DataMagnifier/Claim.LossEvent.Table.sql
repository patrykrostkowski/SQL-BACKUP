USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEvent]    Script Date: 31.10.2022 11:54:55 ******/
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
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_LossEvent] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_ClaimCurrencySK_LossEvent]
GO
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_LossEvent] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_ClaimSK_LossEvent]
GO
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSalvageSK_LossEvent] FOREIGN KEY([LossEventSalvageSK])
REFERENCES [Claim].[LossEventSalvage] ([LossEventSalvageSK])
GO
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_LossEventSalvageSK_LossEvent]
GO
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_LossEventTypeSK_LossEvent] FOREIGN KEY([LossEventTypeSK])
REFERENCES [TypeList].[LossEventType] ([LossEventTypeSK])
GO
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_LossEventTypeSK_LossEvent]
GO
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_SeveritySK_LossEvent] FOREIGN KEY([SeveritySK])
REFERENCES [TypeList].[Severity] ([SeveritySK])
GO
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_SeveritySK_LossEvent]
GO
ALTER TABLE [Claim].[LossEvent]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEvent] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEvent] CHECK CONSTRAINT [FK_SourceSystemSK_LossEvent]
GO
