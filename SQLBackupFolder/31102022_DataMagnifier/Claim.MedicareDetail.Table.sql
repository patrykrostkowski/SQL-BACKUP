USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[MedicareDetail]    Script Date: 31.10.2022 12:30:52 ******/
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
ALTER TABLE [Claim].[MedicareDetail]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantSK_MedicareDetail] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Claim].[MedicareDetail] CHECK CONSTRAINT [FK_ClaimantSK_MedicareDetail]
GO
ALTER TABLE [Claim].[MedicareDetail]  WITH CHECK ADD  CONSTRAINT [FK_LitigationSK_MedicareDetail] FOREIGN KEY([LitigationSK])
REFERENCES [Claim].[Litigation] ([LitigationSK])
GO
ALTER TABLE [Claim].[MedicareDetail] CHECK CONSTRAINT [FK_LitigationSK_MedicareDetail]
GO
ALTER TABLE [Claim].[MedicareDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_MedicareDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[MedicareDetail] CHECK CONSTRAINT [FK_SourceSystemSK_MedicareDetail]
GO
