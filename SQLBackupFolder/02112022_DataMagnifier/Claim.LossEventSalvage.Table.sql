USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[LossEventSalvage]    Script Date: 02.11.2022 14:11:19 ******/
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
	[SalvageDetailTypeSK] [int] NOT NULL,
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
ALTER TABLE [Claim].[LossEventSalvage]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossEventSalvage] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[LossEventSalvage] CHECK CONSTRAINT [FK_SourceSystemSK_LossEventSalvage]
GO
