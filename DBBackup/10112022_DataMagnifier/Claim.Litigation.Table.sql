USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[Litigation]    Script Date: 10.11.2022 14:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[Litigation]') AND type in (N'U'))
BEGIN
CREATE TABLE [Claim].[Litigation](
	[LitigationSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[LitigationNum] [varchar](5) NULL,
	[SummonsComplaintDesc] [varchar](1000) NULL,
	[LitigationStatusSK] [int] NOT NULL,
	[CaseNum] [varchar](50) NULL,
	[CourtNum] [varchar](128) NULL,
	[CaseDesc] [varchar](150) NULL,
	[VenueDesc] [varchar](150) NULL,
	[CourtTypeSK] [int] NULL,
	[VenueRatingSK] [int] NULL,
	[AreaSK] [int] NULL,
	[ResolutionSK] [int] NULL,
	[ClaimCurrencySK] [int] NOT NULL,
	[OpenDate] [date] NULL,
	[ReceivedDate] [date] NULL,
	[CloseDate] [date] NULL,
	[TrialArbitrationDate] [date] NULL,
	[StatuteofLimitationsDate] [date] NULL,
	[MediationDate] [date] NULL,
	[TotalLitigationAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_Litigation] PRIMARY KEY CLUSTERED 
(
	[LitigationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AreaSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation]  WITH CHECK ADD  CONSTRAINT [FK_AreaSK_Litigation] FOREIGN KEY([AreaSK])
REFERENCES [TypeList].[Area] ([AreaSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_AreaSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation] CHECK CONSTRAINT [FK_AreaSK_Litigation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCurrencySK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_Litigation] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimCurrencySK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation] CHECK CONSTRAINT [FK_ClaimCurrencySK_Litigation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_Litigation] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation] CHECK CONSTRAINT [FK_ClaimSK_Litigation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CourtTypeSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation]  WITH CHECK ADD  CONSTRAINT [FK_CourtTypeSK_Litigation] FOREIGN KEY([CourtTypeSK])
REFERENCES [TypeList].[CourtType] ([CourtTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_CourtTypeSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation] CHECK CONSTRAINT [FK_CourtTypeSK_Litigation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LitigationStatusSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation]  WITH CHECK ADD  CONSTRAINT [FK_LitigationStatusSK_Litigation] FOREIGN KEY([LitigationStatusSK])
REFERENCES [TypeList].[LitigationStatus] ([LitigationStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LitigationStatusSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation] CHECK CONSTRAINT [FK_LitigationStatusSK_Litigation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ResolutionSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation]  WITH CHECK ADD  CONSTRAINT [FK_ResolutionSK_Litigation] FOREIGN KEY([ResolutionSK])
REFERENCES [TypeList].[Resolution] ([ResolutionSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ResolutionSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation] CHECK CONSTRAINT [FK_ResolutionSK_Litigation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Litigation] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation] CHECK CONSTRAINT [FK_SourceSystemSK_Litigation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_VenueRatingSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation]  WITH CHECK ADD  CONSTRAINT [FK_VenueRatingSK_Litigation] FOREIGN KEY([VenueRatingSK])
REFERENCES [TypeList].[VenueRating] ([VenueRatingSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_VenueRatingSK_Litigation]') AND parent_object_id = OBJECT_ID(N'[Claim].[Litigation]'))
ALTER TABLE [Claim].[Litigation] CHECK CONSTRAINT [FK_VenueRatingSK_Litigation]
GO
