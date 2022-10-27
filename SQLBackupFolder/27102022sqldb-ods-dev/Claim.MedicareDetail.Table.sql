USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[MedicareDetail]    Script Date: 27.10.2022 12:26:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[MedicareDetail](
	[MedicareDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimantSK] [int] NULL,
	[LitigationSK] [int] NULL,
	[MedicareHealthInsuranceClaimNum] [varchar](20) NULL,
	[IsAcceptanceOfResponsibilityInd] [tinyint] NULL,
	[IsLitigationInd] [tinyint] NULL,
	[AcceptanceOfResponsibilityDate] [date] NULL,
	[DocumentControlNum] [varchar](20) NULL,
	[TotalPaymentObligationDate] [date] NULL,
 CONSTRAINT [PK_MedicareDetail] PRIMARY KEY CLUSTERED 
(
	[MedicareDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_MedicareDetail]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_MedicareDetail] ON [Claim].[MedicareDetail]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[MedicareDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimantSK_MedicareDetail] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Claim].[MedicareDetail] NOCHECK CONSTRAINT [FK_ClaimantSK_MedicareDetail]
GO
ALTER TABLE [Claim].[MedicareDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_LitigationSK_MedicareDetail] FOREIGN KEY([LitigationSK])
REFERENCES [Claim].[Litigation] ([LitigationSK])
GO
ALTER TABLE [Claim].[MedicareDetail] NOCHECK CONSTRAINT [FK_LitigationSK_MedicareDetail]
GO
ALTER TABLE [Claim].[MedicareDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_MedicareDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[MedicareDetail] NOCHECK CONSTRAINT [FK_SourceSystemSK_MedicareDetail]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies medicare detail associated with a claimant' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'MedicareDetail'
GO
