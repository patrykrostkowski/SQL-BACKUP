USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Obligor]    Script Date: 02.11.2022 14:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[Obligor](
	[ObligorSK] [int] IDENTITY(2,1) NOT NULL,
	[PartySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PrincipalStatusSK] [image] NOT NULL,
	[ObligorNum] [varchar](50) NOT NULL,
	[ObligorName] [varchar](100) NOT NULL,
	[BondFormNum] [varchar](50) NOT NULL,
	[BondFormName] [varchar](100) NOT NULL,
	[ObligationEffectiveDate] [date] NOT NULL,
	[ObligationStateSK] [int] NOT NULL,
	[ObligorStatusSK] [int] NOT NULL,
	[WritingCompanySK] [int] NOT NULL,
	[RenewableTypeSK] [int] NULL,
	[CancellationProvisionSK] [int] NULL,
	[NextRenewalDaysNum] [int] NULL,
	[IsCancellationInd] [tinyint] NULL,
	[IsRenewableInd] [tinyint] NULL,
	[IsContinuousInd] [tinyint] NULL,
	[IsContinuousLetterSentInd] [tinyint] NULL,
	[BPIDName] [varchar](50) NULL,
	[StandardIndustryCodeSK] [int] NULL,
	[NAICCode] [varchar](25) NULL,
	[IsFederalInd] [tinyint] NULL,
 CONSTRAINT [PK_Obligor] PRIMARY KEY NONCLUSTERED 
(
	[ObligorSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Party].[Obligor]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Obligor] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Obligor] CHECK CONSTRAINT [FK_PartySK_Obligor]
GO
ALTER TABLE [Party].[Obligor]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Obligor] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[Obligor] CHECK CONSTRAINT [FK_SourceSystemSK_Obligor]
GO
