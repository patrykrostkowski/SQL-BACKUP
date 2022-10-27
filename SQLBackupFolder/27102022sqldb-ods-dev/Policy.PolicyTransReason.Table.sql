USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyTransReason]    Script Date: 27.10.2022 12:27:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyTransReason](
	[PolicyTransReasonSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NULL,
	[ReasonSK] [int] NOT NULL,
	[ReasonInformationDesc] [varchar](256) NULL,
 CONSTRAINT [PK_PolicyTransReason] PRIMARY KEY CLUSTERED 
(
	[PolicyTransReasonSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyTransReason]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyTransReason] ON [Policy].[PolicyTransReason]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyTransReason]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyTransReason] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyTransReason] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyTransReason]
GO
ALTER TABLE [Policy].[PolicyTransReason]  WITH NOCHECK ADD  CONSTRAINT [FK_ReasonSK_PolicyTransReason] FOREIGN KEY([ReasonSK])
REFERENCES [Typelist].[Reason] ([ReasonSK])
GO
ALTER TABLE [Policy].[PolicyTransReason] NOCHECK CONSTRAINT [FK_ReasonSK_PolicyTransReason]
GO
ALTER TABLE [Policy].[PolicyTransReason]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransReason] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyTransReason] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransReason]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Notes and memos associated with a Policy Trans record.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyTransReason'
GO
