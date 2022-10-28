USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[Litigation]    Script Date: 28.10.2022 11:09:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_Litigation]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_Litigation] ON [Claim].[Litigation]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[Litigation]  WITH NOCHECK ADD  CONSTRAINT [FK_AreaSK_Litigation] FOREIGN KEY([AreaSK])
REFERENCES [Typelist].[Area] ([AreaSK])
GO
ALTER TABLE [Claim].[Litigation] NOCHECK CONSTRAINT [FK_AreaSK_Litigation]
GO
ALTER TABLE [Claim].[Litigation]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimCurrencySK_Litigation] FOREIGN KEY([ClaimCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Claim].[Litigation] NOCHECK CONSTRAINT [FK_ClaimCurrencySK_Litigation]
GO
ALTER TABLE [Claim].[Litigation]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_Litigation] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[Litigation] NOCHECK CONSTRAINT [FK_ClaimSK_Litigation]
GO
ALTER TABLE [Claim].[Litigation]  WITH NOCHECK ADD  CONSTRAINT [FK_CourtTypeSK_Litigation] FOREIGN KEY([CourtTypeSK])
REFERENCES [Typelist].[CourtType] ([CourtTypeSK])
GO
ALTER TABLE [Claim].[Litigation] NOCHECK CONSTRAINT [FK_CourtTypeSK_Litigation]
GO
ALTER TABLE [Claim].[Litigation]  WITH NOCHECK ADD  CONSTRAINT [FK_LitigationStatusSK_Litigation] FOREIGN KEY([LitigationStatusSK])
REFERENCES [Typelist].[LitigationStatus] ([LitigationStatusSK])
GO
ALTER TABLE [Claim].[Litigation] NOCHECK CONSTRAINT [FK_LitigationStatusSK_Litigation]
GO
ALTER TABLE [Claim].[Litigation]  WITH NOCHECK ADD  CONSTRAINT [FK_ResolutionSK_Litigation] FOREIGN KEY([ResolutionSK])
REFERENCES [Typelist].[Resolution] ([ResolutionSK])
GO
ALTER TABLE [Claim].[Litigation] NOCHECK CONSTRAINT [FK_ResolutionSK_Litigation]
GO
ALTER TABLE [Claim].[Litigation]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_Litigation] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[Litigation] NOCHECK CONSTRAINT [FK_SourceSystemSK_Litigation]
GO
ALTER TABLE [Claim].[Litigation]  WITH NOCHECK ADD  CONSTRAINT [FK_VenueRatingSK_Litigation] FOREIGN KEY([VenueRatingSK])
REFERENCES [Typelist].[VenueRating] ([VenueRatingSK])
GO
ALTER TABLE [Claim].[Litigation] NOCHECK CONSTRAINT [FK_VenueRatingSK_Litigation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Litigation involves the representation of insurers, policyholders, and/or claimants  in disputes concerning the meaning, scope, and effect of insurance policies and its associated claim and claimants' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'Litigation'
GO
