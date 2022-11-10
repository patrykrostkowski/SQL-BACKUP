USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[ClaimStatusHistory]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Claim].[ClaimStatusHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [Claim].[ClaimStatusHistory](
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClaimStatusHistorySK] [int] NOT NULL,
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_ClaimStatusHistory]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimStatusHistory]'))
ALTER TABLE [Claim].[ClaimStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimStatusHistory] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimSK_ClaimStatusHistory]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimStatusHistory]'))
ALTER TABLE [Claim].[ClaimStatusHistory] CHECK CONSTRAINT [FK_ClaimSK_ClaimStatusHistory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimStatusSK_ClaimStatusHistory]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimStatusHistory]'))
ALTER TABLE [Claim].[ClaimStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_ClaimStatusSK_ClaimStatusHistory] FOREIGN KEY([ClaimStatusSK])
REFERENCES [TypeList].[ClaimStatus] ([ClaimStatusSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_ClaimStatusSK_ClaimStatusHistory]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimStatusHistory]'))
ALTER TABLE [Claim].[ClaimStatusHistory] CHECK CONSTRAINT [FK_ClaimStatusSK_ClaimStatusHistory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimStatusHistory]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimStatusHistory]'))
ALTER TABLE [Claim].[ClaimStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimStatusHistory] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Claim].[FK_SourceSystemSK_ClaimStatusHistory]') AND parent_object_id = OBJECT_ID(N'[Claim].[ClaimStatusHistory]'))
ALTER TABLE [Claim].[ClaimStatusHistory] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimStatusHistory]
GO
