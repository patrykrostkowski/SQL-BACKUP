USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[Subrogation]    Script Date: 31.10.2022 12:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[Subrogation](
	[SubrogationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[ClaimantSK] [int] NULL,
	[SubrogationNum] [varchar](20) NULL,
	[SubrogationTypeSK] [int] NULL,
	[CaseName] [varchar](50) NULL,
	[SubrogationStatusSK] [int] NULL,
	[SubrogationClosedOutcomeSK] [int] NULL,
	[OpenDate] [date] NULL,
	[NoticeDate] [date] NULL,
	[ReceiveDate] [date] NULL,
	[RequestDate] [date] NULL,
	[ClosedDate] [date] NULL,
	[IsLitigationInd] [tinyint] NULL,
	[LitigationSK] [int] NULL,
	[IsExternalOwnedInd] [tinyint] NULL,
	[IsEscalateSubrogationInd] [tinyint] NOT NULL,
	[SubrogationCloseCommentTxt] [varchar](255) NULL,
	[SubrogationReferralCommentTxt] [varchar](255) NULL,
	[SubrogationAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_Subrogation] PRIMARY KEY CLUSTERED 
(
	[SubrogationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[Subrogation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantSK_Subrogation] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Claim].[Subrogation] CHECK CONSTRAINT [FK_ClaimantSK_Subrogation]
GO
ALTER TABLE [Claim].[Subrogation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_Subrogation] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[Subrogation] CHECK CONSTRAINT [FK_ClaimSK_Subrogation]
GO
ALTER TABLE [Claim].[Subrogation]  WITH CHECK ADD  CONSTRAINT [FK_LitigationSK_Subrogation] FOREIGN KEY([LitigationSK])
REFERENCES [Claim].[Litigation] ([LitigationSK])
GO
ALTER TABLE [Claim].[Subrogation] CHECK CONSTRAINT [FK_LitigationSK_Subrogation]
GO
ALTER TABLE [Claim].[Subrogation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Subrogation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[Subrogation] CHECK CONSTRAINT [FK_SourceSystemSK_Subrogation]
GO
ALTER TABLE [Claim].[Subrogation]  WITH CHECK ADD  CONSTRAINT [FK_SubrogationClosedOutcomeSK_Subrogation] FOREIGN KEY([SubrogationClosedOutcomeSK])
REFERENCES [TypeList].[SubrogationClosedOutcome] ([SubrogationClosedOutcomeSK])
GO
ALTER TABLE [Claim].[Subrogation] CHECK CONSTRAINT [FK_SubrogationClosedOutcomeSK_Subrogation]
GO
