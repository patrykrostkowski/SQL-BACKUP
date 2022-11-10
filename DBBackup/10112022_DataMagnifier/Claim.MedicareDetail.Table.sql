USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[MedicareDetail]    Script Date: 10.11.2022 14:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[MedicareDetail]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantSK_MedicareDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[MedicareDetail]'))
ALTER TABLE [Claim].[MedicareDetail]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantSK_MedicareDetail] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantSK_MedicareDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[MedicareDetail]'))
ALTER TABLE [Claim].[MedicareDetail] CHECK CONSTRAINT [FK_ClaimantSK_MedicareDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LitigationSK_MedicareDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[MedicareDetail]'))
ALTER TABLE [Claim].[MedicareDetail]  WITH CHECK ADD  CONSTRAINT [FK_LitigationSK_MedicareDetail] FOREIGN KEY([LitigationSK])
REFERENCES [Claim].[Litigation] ([LitigationSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LitigationSK_MedicareDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[MedicareDetail]'))
ALTER TABLE [Claim].[MedicareDetail] CHECK CONSTRAINT [FK_LitigationSK_MedicareDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_MedicareDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[MedicareDetail]'))
ALTER TABLE [Claim].[MedicareDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_MedicareDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_MedicareDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[MedicareDetail]'))
ALTER TABLE [Claim].[MedicareDetail] CHECK CONSTRAINT [FK_SourceSystemSK_MedicareDetail]
GO
