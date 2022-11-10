USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimRelationship]    Script Date: 10.11.2022 13:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[ClaimRelationship](
	[ClaimRelationshipSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[ClaimSK] [int] NOT NULL,
	[SequenceNum] [int] NULL,
	[ClaimPolicySK] [int] NOT NULL,
	[PolicySK] [int] NULL,
	[LossEventSK] [int] NULL,
	[LossOccurrenceSK] [int] NULL,
	[ActivityDate] [date] NULL,
	[IsCurrentInd] [tinyint] NULL,
 CONSTRAINT [PK_ClaimRelationship] PRIMARY KEY CLUSTERED 
(
	[ClaimRelationshipSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[ClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_ClaimPolicySK_ClaimRelationship] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
ALTER TABLE [Claim].[ClaimRelationship] CHECK CONSTRAINT [FK_ClaimPolicySK_ClaimRelationship]
GO
ALTER TABLE [Claim].[ClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimRelationship] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[ClaimRelationship] CHECK CONSTRAINT [FK_ClaimSK_ClaimRelationship]
GO
ALTER TABLE [Claim].[ClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_ClaimRelationship] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
ALTER TABLE [Claim].[ClaimRelationship] CHECK CONSTRAINT [FK_LossEventSK_ClaimRelationship]
GO
ALTER TABLE [Claim].[ClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_LossOccurrenceSK_ClaimRelationship] FOREIGN KEY([LossOccurrenceSK])
REFERENCES [Claim].[LossOccurrence] ([LossOccurrenceSK])
GO
ALTER TABLE [Claim].[ClaimRelationship] CHECK CONSTRAINT [FK_LossOccurrenceSK_ClaimRelationship]
GO
ALTER TABLE [Claim].[ClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_ClaimRelationship] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Claim].[ClaimRelationship] CHECK CONSTRAINT [FK_PolicySK_ClaimRelationship]
GO
