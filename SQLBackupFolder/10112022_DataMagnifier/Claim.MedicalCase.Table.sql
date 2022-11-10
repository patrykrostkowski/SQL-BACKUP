USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[MedicalCase]    Script Date: 10.11.2022 13:21:32 ******/
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
ALTER TABLE [Claim].[MedicalCase]  WITH CHECK ADD  CONSTRAINT [FK_ClaimantSK_MedicalCase] FOREIGN KEY([ClaimantSK])
REFERENCES [Claim].[Claimant] ([ClaimantSK])
GO
ALTER TABLE [Claim].[MedicalCase] CHECK CONSTRAINT [FK_ClaimantSK_MedicalCase]
GO
ALTER TABLE [Claim].[MedicalCase]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_MedicalCase] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[MedicalCase] CHECK CONSTRAINT [FK_SourceSystemSK_MedicalCase]
GO
