USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[Subrogation]    Script Date: 10.11.2022 14:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[Subrogation]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantSK_Subrogation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Subrogation]'))
ALTER TABLE [Claim].[Subrogation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantSK_Subrogation] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimantSK_Subrogation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Subrogation]'))
ALTER TABLE [Claim].[Subrogation] CHECK CONSTRAINT [FK_ClaimantSK_Subrogation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_Subrogation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Subrogation]'))
ALTER TABLE [Claim].[Subrogation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_Subrogation] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_Subrogation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Subrogation]'))
ALTER TABLE [Claim].[Subrogation] CHECK CONSTRAINT [FK_ClaimSK_Subrogation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LitigationSK_Subrogation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Subrogation]'))
ALTER TABLE [Claim].[Subrogation]  WITH CHECK ADD  CONSTRAINT [FK_LitigationSK_Subrogation] FOREIGN KEY([LitigationSK])
REFERENCES [Claim].[Litigation] ([LitigationSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LitigationSK_Subrogation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Subrogation]'))
ALTER TABLE [Claim].[Subrogation] CHECK CONSTRAINT [FK_LitigationSK_Subrogation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_Subrogation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Subrogation]'))
ALTER TABLE [Claim].[Subrogation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Subrogation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_Subrogation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Subrogation]'))
ALTER TABLE [Claim].[Subrogation] CHECK CONSTRAINT [FK_SourceSystemSK_Subrogation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SubrogationClosedOutcomeSK_Subrogation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Subrogation]'))
ALTER TABLE [Claim].[Subrogation]  WITH CHECK ADD  CONSTRAINT [FK_SubrogationClosedOutcomeSK_Subrogation] FOREIGN KEY([SubrogationClosedOutcomeSK])
REFERENCES [TypeList].[SubrogationClosedOutcome] ([SubrogationClosedOutcomeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SubrogationClosedOutcomeSK_Subrogation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Subrogation]'))
ALTER TABLE [Claim].[Subrogation] CHECK CONSTRAINT [FK_SubrogationClosedOutcomeSK_Subrogation]
GO
