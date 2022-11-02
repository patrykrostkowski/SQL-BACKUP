USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[SubrogationClosedOutcome]    Script Date: 02.11.2022 14:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[SubrogationClosedOutcome](
	[SubrogationClosedOutcomeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SubrogationClosedOutcomeCode] [varchar](20) NOT NULL,
	[SubrogationClosedOutcomeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SubrogationClosedOutcome] PRIMARY KEY CLUSTERED 
(
	[SubrogationClosedOutcomeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[SubrogationClosedOutcome]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_SubrogationClosedOutcome] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[SubrogationClosedOutcome] CHECK CONSTRAINT [FK_SourceSystemSK_SubrogationClosedOutcome]
GO
