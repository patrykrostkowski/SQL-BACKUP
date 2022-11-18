USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClosedOutcome]    Script Date: 18.11.2022 16:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ClosedOutcome](
	[ClosedOutcomeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClosedOutcomeCode] [varchar](20) NOT NULL,
	[ClosedOutcomeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClosedOutcome] PRIMARY KEY CLUSTERED 
(
	[ClosedOutcomeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[ClosedOutcome]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClosedOutcome] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ClosedOutcome] CHECK CONSTRAINT [FK_SourceSystemSK_ClosedOutcome]
GO
