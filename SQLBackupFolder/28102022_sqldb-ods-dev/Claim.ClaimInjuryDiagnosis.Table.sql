USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[ClaimInjuryDiagnosis]    Script Date: 28.10.2022 15:04:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[ClaimInjuryDiagnosis](
	[ClaimInjuryDiagnosisSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[LossEventInjurySK] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsCompensableInd] [tinyint] NULL,
	[IsPrimaryInd] [tinyint] NULL,
	[CommentTxt] [varchar](250) NULL,
 CONSTRAINT [PK_ClaimInjuryDiagnosis] PRIMARY KEY CLUSTERED 
(
	[ClaimInjuryDiagnosisSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimInjuryDiagnosis]    Script Date: 28.10.2022 15:06:00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimInjuryDiagnosis] ON [Claim].[ClaimInjuryDiagnosis]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Claim].[ClaimInjuryDiagnosis]  WITH NOCHECK ADD  CONSTRAINT [FK_LossEventInjurySK_ClaimInjuryDiagnosis] FOREIGN KEY([LossEventInjurySK])
REFERENCES [Claim].[LossEventInjury] ([LossEventInjurySK])
GO
ALTER TABLE [Claim].[ClaimInjuryDiagnosis] NOCHECK CONSTRAINT [FK_LossEventInjurySK_ClaimInjuryDiagnosis]
GO
ALTER TABLE [Claim].[ClaimInjuryDiagnosis]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimInjuryDiagnosis] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[ClaimInjuryDiagnosis] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimInjuryDiagnosis]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Claim Injury Diagnosis' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'ClaimInjuryDiagnosis'
GO
