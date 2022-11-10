USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimInjuryDiagnosis]    Script Date: 10.11.2022 14:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[ClaimInjuryDiagnosis]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventInjurySK_ClaimInjuryDiagnosis]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimInjuryDiagnosis]'))
ALTER TABLE [Claim].[ClaimInjuryDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_LossEventInjurySK_ClaimInjuryDiagnosis] FOREIGN KEY([LossEventInjurySK])
REFERENCES [Claim].[LossEventInjury] ([LossEventInjurySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_LossEventInjurySK_ClaimInjuryDiagnosis]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimInjuryDiagnosis]'))
ALTER TABLE [Claim].[ClaimInjuryDiagnosis] CHECK CONSTRAINT [FK_LossEventInjurySK_ClaimInjuryDiagnosis]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimInjuryDiagnosis]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimInjuryDiagnosis]'))
ALTER TABLE [Claim].[ClaimInjuryDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimInjuryDiagnosis] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimInjuryDiagnosis]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimInjuryDiagnosis]'))
ALTER TABLE [Claim].[ClaimInjuryDiagnosis] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimInjuryDiagnosis]
GO
