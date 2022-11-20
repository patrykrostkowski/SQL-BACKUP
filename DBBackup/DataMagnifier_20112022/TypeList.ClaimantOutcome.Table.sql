USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClaimantOutcome]    Script Date: 20.11.2022 14:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ClaimantOutcome](
	[ClaimantOutcomeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClaimantOutcomeCode] [varchar](20) NOT NULL,
	[ClaimantOutcomeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimantOutcome] PRIMARY KEY CLUSTERED 
(
	[ClaimantOutcomeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[ClaimantOutcome]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimantOutcome] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ClaimantOutcome] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimantOutcome]
GO
