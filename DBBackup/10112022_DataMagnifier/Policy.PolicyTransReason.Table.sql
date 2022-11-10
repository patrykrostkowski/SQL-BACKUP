USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyTransReason]    Script Date: 10.11.2022 14:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PolicyTransReason]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyTransReason]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyTransReason]'))
ALTER TABLE [Policy].[PolicyTransReason]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyTransReason] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PolicyTransSK_PolicyTransReason]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyTransReason]'))
ALTER TABLE [Policy].[PolicyTransReason] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyTransReason]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReasonSK_PolicyTransReason]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyTransReason]'))
ALTER TABLE [Policy].[PolicyTransReason]  WITH CHECK ADD  CONSTRAINT [FK_ReasonSK_PolicyTransReason] FOREIGN KEY([ReasonSK])
REFERENCES [TypeList].[Reason] ([ReasonSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_ReasonSK_PolicyTransReason]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyTransReason]'))
ALTER TABLE [Policy].[PolicyTransReason] CHECK CONSTRAINT [FK_ReasonSK_PolicyTransReason]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyTransReason]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyTransReason]'))
ALTER TABLE [Policy].[PolicyTransReason]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransReason] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PolicyTransReason]') AND parent_object_id = OBJECT_ID(N'[Policy].[PolicyTransReason]'))
ALTER TABLE [Policy].[PolicyTransReason] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransReason]
GO
