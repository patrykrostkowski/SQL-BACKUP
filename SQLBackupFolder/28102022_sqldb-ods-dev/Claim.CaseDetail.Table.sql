USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[CaseDetail]    Script Date: 28.10.2022 13:36:12 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_CaseDetail]    Script Date: 28.10.2022 13:37:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_CaseDetail] ON [Claim].[CaseDetail]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[CaseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_CaseStatusSK_CaseDetail] FOREIGN KEY([CaseStatusSK])
REFERENCES [Typelist].[CaseStatus] ([CaseStatusSK])
GO
ALTER TABLE [Claim].[CaseDetail] NOCHECK CONSTRAINT [FK_CaseStatusSK_CaseDetail]
GO
ALTER TABLE [Claim].[CaseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_CaseTypeSK_CaseDetail] FOREIGN KEY([CaseTypeSK])
REFERENCES [Typelist].[CaseType] ([CaseTypeSK])
GO
ALTER TABLE [Claim].[CaseDetail] NOCHECK CONSTRAINT [FK_CaseTypeSK_CaseDetail]
GO
ALTER TABLE [Claim].[CaseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimantSK_CaseDetail] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Claim].[CaseDetail] NOCHECK CONSTRAINT [FK_ClaimantSK_CaseDetail]
GO
ALTER TABLE [Claim].[CaseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_LitigationSK_CaseDetail] FOREIGN KEY([LitigationSK])
REFERENCES [Claim].[Litigation] ([LitigationSK])
GO
ALTER TABLE [Claim].[CaseDetail] NOCHECK CONSTRAINT [FK_LitigationSK_CaseDetail]
GO
ALTER TABLE [Claim].[CaseDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CaseDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[CaseDetail] NOCHECK CONSTRAINT [FK_SourceSystemSK_CaseDetail]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the litigation case detail associated with a claimant and insurer' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'CaseDetail'
GO
