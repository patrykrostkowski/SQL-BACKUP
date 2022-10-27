USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[MedicalCase]    Script Date: 27.10.2022 12:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[MedicalCase](
	[MedicalCaseSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimantSK] [int] NULL,
	[CaseNum] [varchar](255) NULL,
	[CaseDesc] [varchar](200) NULL,
	[LossOccurrenceDate] [date] NULL,
	[OpenDate] [date] NULL,
	[CloseDate] [date] NULL,
	[IsPreExistingConditionInd] [tinyint] NULL,
	[StatusCode] [varchar](255) NULL,
	[StatusDesc] [varchar](255) NULL,
	[IndemnitySavingsAmt] [decimal](19, 4) NULL,
	[MedicalSavingsAmt] [decimal](19, 4) NULL,
	[OtherSavingsAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_MedicalCase] PRIMARY KEY CLUSTERED 
(
	[MedicalCaseSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_MedicalCase]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_MedicalCase] ON [Claim].[MedicalCase]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[MedicalCase]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimantSK_MedicalCase] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Claim].[MedicalCase] NOCHECK CONSTRAINT [FK_ClaimantSK_MedicalCase]
GO
ALTER TABLE [Claim].[MedicalCase]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_MedicalCase] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[MedicalCase] NOCHECK CONSTRAINT [FK_SourceSystemSK_MedicalCase]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies one or many medical cases associated with a claimant' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'MedicalCase'
GO
