USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[RatingPlanStatCode]    Script Date: 12.11.2022 09:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[RatingPlanStatCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[RatingPlanStatCode](
	[RatingPlanStatCodeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyCoverageSK] [int] NULL,
	[StatCode] [varchar](4) NULL,
	[StatCodeDesc] [varchar](50) NULL,
	[TermPremAmt] [decimal](19, 4) NULL,
	[ModifiedTermPremiumAmt] [decimal](19, 4) NULL,
	[EstWrittenPremiumAmt] [decimal](19, 4) NULL,
	[OOSOffsetPremiumAmt] [decimal](19, 4) NULL,
	[OOSFuturePremiumAmt] [decimal](19, 4) NULL,
	[RateFct] [decimal](8, 4) NULL,
	[FlatChargeAmt] [decimal](8, 4) NULL,
	[IsIncludedInPremiumInd] [tinyint] NULL,
 CONSTRAINT [PK_RatingPlanStatCode] PRIMARY KEY CLUSTERED 
(
	[RatingPlanStatCodeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_RatingPlanStatCode]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlanStatCode]'))
ALTER TABLE [Policy].[RatingPlanStatCode]  WITH CHECK ADD  CONSTRAINT [FK_PolicyCoverageSK_RatingPlanStatCode] FOREIGN KEY([PolicyCoverageSK])
REFERENCES [Policy].[PolicyCoverage] ([PolicyCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyCoverageSK_RatingPlanStatCode]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingPlanStatCode]'))
ALTER TABLE [Policy].[RatingPlanStatCode] CHECK CONSTRAINT [FK_PolicyCoverageSK_RatingPlanStatCode]
GO
