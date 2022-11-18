USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[CaseDetail]    Script Date: 18.11.2022 16:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[CaseDetail](
	[CaseDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimantSK] [int] NULL,
	[LitigationSK] [int] NULL,
	[CaseNum] [varchar](20) NULL,
	[CaseName] [varchar](50) NULL,
	[DocketNum] [varchar](20) NULL,
	[CaseTypeSK] [int] NULL,
	[OpenDate] [date] NULL,
	[ReceiveDate] [date] NULL,
	[RequestDate] [date] NULL,
	[ClosedDate] [date] NULL,
	[NoticeDate] [date] NULL,
	[IsCaseInsuredInd] [tinyint] NULL,
	[CaseInsurer] [varchar](50) NULL,
	[IsLitigationInd] [tinyint] NULL,
	[CaseStatusSK] [int] NULL,
	[CaseAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_CaseDetail] PRIMARY KEY CLUSTERED 
(
	[CaseDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[CaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_CaseStatusSK_CaseDetail] FOREIGN KEY([CaseStatusSK])
REFERENCES [TypeList].[ClaimStatus] ([ClaimStatusSK])
GO
ALTER TABLE [Claim].[CaseDetail] CHECK CONSTRAINT [FK_CaseStatusSK_CaseDetail]
GO
ALTER TABLE [Claim].[CaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_CaseTypeSK_CaseDetail] FOREIGN KEY([CaseTypeSK])
REFERENCES [TypeList].[CaseType] ([CaseTypeSK])
GO
ALTER TABLE [Claim].[CaseDetail] CHECK CONSTRAINT [FK_CaseTypeSK_CaseDetail]
GO
ALTER TABLE [Claim].[CaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantSK_CaseDetail] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Claim].[CaseDetail] CHECK CONSTRAINT [FK_ClaimantSK_CaseDetail]
GO
ALTER TABLE [Claim].[CaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_LitigationSK_CaseDetail] FOREIGN KEY([LitigationSK])
REFERENCES [Claim].[Litigation] ([LitigationSK])
GO
ALTER TABLE [Claim].[CaseDetail] CHECK CONSTRAINT [FK_LitigationSK_CaseDetail]
GO
ALTER TABLE [Claim].[CaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CaseDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[CaseDetail] CHECK CONSTRAINT [FK_SourceSystemSK_CaseDetail]
GO
