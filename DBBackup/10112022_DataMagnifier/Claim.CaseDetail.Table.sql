USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[CaseDetail]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[CaseDetail]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CaseStatusSK_CaseDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[CaseDetail]'))
ALTER TABLE [Claim].[CaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_CaseStatusSK_CaseDetail] FOREIGN KEY([CaseStatusSK])
REFERENCES [TypeList].[ClaimStatus] ([ClaimStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CaseStatusSK_CaseDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[CaseDetail]'))
ALTER TABLE [Claim].[CaseDetail] CHECK CONSTRAINT [FK_CaseStatusSK_CaseDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CaseTypeSK_CaseDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[CaseDetail]'))
ALTER TABLE [Claim].[CaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_CaseTypeSK_CaseDetail] FOREIGN KEY([CaseTypeSK])
REFERENCES [TypeList].[CaseType] ([CaseTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CaseTypeSK_CaseDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[CaseDetail]'))
ALTER TABLE [Claim].[CaseDetail] CHECK CONSTRAINT [FK_CaseTypeSK_CaseDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantSK_CaseDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[CaseDetail]'))
ALTER TABLE [Claim].[CaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantSK_CaseDetail] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantSK_CaseDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[CaseDetail]'))
ALTER TABLE [Claim].[CaseDetail] CHECK CONSTRAINT [FK_ClaimantSK_CaseDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LitigationSK_CaseDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[CaseDetail]'))
ALTER TABLE [Claim].[CaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_LitigationSK_CaseDetail] FOREIGN KEY([LitigationSK])
REFERENCES [Claim].[Litigation] ([LitigationSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LitigationSK_CaseDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[CaseDetail]'))
ALTER TABLE [Claim].[CaseDetail] CHECK CONSTRAINT [FK_LitigationSK_CaseDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_CaseDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[CaseDetail]'))
ALTER TABLE [Claim].[CaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CaseDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_CaseDetail]') AND parent_object_id = OBJECT_ID(N'[Claim].[CaseDetail]'))
ALTER TABLE [Claim].[CaseDetail] CHECK CONSTRAINT [FK_SourceSystemSK_CaseDetail]
GO
