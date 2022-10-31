USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimInjuryDiagnosis]    Script Date: 31.10.2022 12:30:52 ******/
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
ALTER TABLE [Claim].[ClaimInjuryDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_LossEventInjurySK_ClaimInjuryDiagnosis] FOREIGN KEY([LossEventInjurySK])
REFERENCES [Claim].[LossEventInjury] ([LossEventInjurySK])
GO
ALTER TABLE [Claim].[ClaimInjuryDiagnosis] CHECK CONSTRAINT [FK_LossEventInjurySK_ClaimInjuryDiagnosis]
GO
ALTER TABLE [Claim].[ClaimInjuryDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimInjuryDiagnosis] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[ClaimInjuryDiagnosis] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimInjuryDiagnosis]
GO
