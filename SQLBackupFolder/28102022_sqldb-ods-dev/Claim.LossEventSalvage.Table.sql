USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[LossEventSalvage]    Script Date: 28.10.2022 12:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[LossEventSalvage](
	[LossEventSalvageSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[SalvageDetailTypeSK] [int] NULL,
	[SoldDate] [date] NULL,
	[AssignedToSalvageDate] [date] NULL,
	[RecoveredDate] [date] NULL,
	[IsOwnerRetainedInd] [tinyint] NULL,
	[IsTotalLossInd] [tinyint] NULL,
	[IsSalvageWaivedInd] [tinyint] NOT NULL,
	[SaleAmt] [decimal](19, 4) NULL,
	[TitleFeeAmt] [decimal](19, 4) NULL,
	[TowingFeeAmt] [decimal](19, 4) NULL,
	[CommissionAmt] [decimal](19, 4) NULL,
	[StorageFeeAmt] [decimal](19, 4) NULL,
	[PrepFeeAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_LossEventSalvage] PRIMARY KEY CLUSTERED 
(
	[LossEventSalvageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LossEventSalvage]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LossEventSalvage] ON [Claim].[LossEventSalvage]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[LossEventSalvage]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventSalvage] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventSalvage] NOCHECK CONSTRAINT [FK_SourceSystemSK_LossEventSalvage]
GO
ALTER TABLE [Claim].[LossEventSalvage]  WITH NOCHECK ADD  CONSTRAINT [RefSalvageDetailType1051] FOREIGN KEY([SalvageDetailTypeSK])
REFERENCES [Typelist].[SalvageDetailType] ([SalvageDetailTypeSK])
GO
ALTER TABLE [Claim].[LossEventSalvage] NOCHECK CONSTRAINT [RefSalvageDetailType1051]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specifics of a salvage related loss event' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'LossEventSalvage'
GO
