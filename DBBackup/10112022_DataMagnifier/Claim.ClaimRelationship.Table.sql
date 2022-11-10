USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimRelationship]    Script Date: 10.11.2022 14:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[ClaimRelationship]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimPolicySK_ClaimRelationship]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimRelationship]'))
ALTER TABLE [Claim].[ClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_ClaimPolicySK_ClaimRelationship] FOREIGN KEY([ClaimPolicySK])
REFERENCES [Claim].[ClaimPolicy] ([ClaimPolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimPolicySK_ClaimRelationship]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimRelationship]'))
ALTER TABLE [Claim].[ClaimRelationship] CHECK CONSTRAINT [FK_ClaimPolicySK_ClaimRelationship]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_ClaimRelationship]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimRelationship]'))
ALTER TABLE [Claim].[ClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimRelationship] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_ClaimRelationship]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimRelationship]'))
ALTER TABLE [Claim].[ClaimRelationship] CHECK CONSTRAINT [FK_ClaimSK_ClaimRelationship]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSK_ClaimRelationship]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimRelationship]'))
ALTER TABLE [Claim].[ClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_LossEventSK_ClaimRelationship] FOREIGN KEY([LossEventSK])
REFERENCES [Claim].[LossEvent] ([LossEventSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventSK_ClaimRelationship]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimRelationship]'))
ALTER TABLE [Claim].[ClaimRelationship] CHECK CONSTRAINT [FK_LossEventSK_ClaimRelationship]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossOccurrenceSK_ClaimRelationship]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimRelationship]'))
ALTER TABLE [Claim].[ClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_LossOccurrenceSK_ClaimRelationship] FOREIGN KEY([LossOccurrenceSK])
REFERENCES [Claim].[LossOccurrence] ([LossOccurrenceSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossOccurrenceSK_ClaimRelationship]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimRelationship]'))
ALTER TABLE [Claim].[ClaimRelationship] CHECK CONSTRAINT [FK_LossOccurrenceSK_ClaimRelationship]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicySK_ClaimRelationship]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimRelationship]'))
ALTER TABLE [Claim].[ClaimRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_ClaimRelationship] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_PolicySK_ClaimRelationship]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimRelationship]'))
ALTER TABLE [Claim].[ClaimRelationship] CHECK CONSTRAINT [FK_PolicySK_ClaimRelationship]
GO
