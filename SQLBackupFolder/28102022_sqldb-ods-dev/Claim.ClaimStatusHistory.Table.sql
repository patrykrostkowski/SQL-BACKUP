USE [sqldb-ods-dev]
GO
/****** Object:  Table [Claim].[ClaimStatusHistory]    Script Date: 28.10.2022 13:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[ClaimStatusHistory](
	[ClaimStatusHistorySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[SequenceNum] [int] NOT NULL,
	[ClaimNum] [varchar](40) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[IsRowCurrentInd] [tinyint] NOT NULL,
	[ClaimStatusSK] [int] NOT NULL,
	[ClaimHandlerName] [varchar](256) NULL,
	[OpenDate] [date] NULL,
	[CloseDate] [date] NULL,
	[CloseReasonDesc] [varchar](256) NULL,
	[ReOpenDate] [date] NULL,
	[ReOpenReasonDesc] [varchar](256) NULL,
	[RecentActivityDate] [date] NULL,
 CONSTRAINT [PK_ClaimStatusHistory] PRIMARY KEY CLUSTERED 
(
	[ClaimStatusHistorySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[ClaimStatusHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimStatusHistory] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Claim].[ClaimStatusHistory] NOCHECK CONSTRAINT [FK_ClaimSK_ClaimStatusHistory]
GO
ALTER TABLE [Claim].[ClaimStatusHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimStatusSK_ClaimStatusHistory] FOREIGN KEY([ClaimStatusSK])
REFERENCES [Typelist].[ClaimStatus] ([ClaimStatusSK])
GO
ALTER TABLE [Claim].[ClaimStatusHistory] NOCHECK CONSTRAINT [FK_ClaimStatusSK_ClaimStatusHistory]
GO
ALTER TABLE [Claim].[ClaimStatusHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimStatusHistory] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[ClaimStatusHistory] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimStatusHistory]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A claim status history throughout the claim life cycle' , @level0type=N'SCHEMA',@level0name=N'Claim', @level1type=N'TABLE',@level1name=N'ClaimStatusHistory'
GO
