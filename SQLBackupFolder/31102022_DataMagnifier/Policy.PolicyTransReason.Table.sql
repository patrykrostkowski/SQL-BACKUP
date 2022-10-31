USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyTransReason]    Script Date: 31.10.2022 12:06:58 ******/
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
ALTER TABLE [Policy].[PolicyTransReason]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyTransReason] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyTransReason] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyTransReason]
GO
ALTER TABLE [Policy].[PolicyTransReason]  WITH CHECK ADD  CONSTRAINT [FK_ReasonSK_PolicyTransReason] FOREIGN KEY([ReasonSK])
REFERENCES [TypeList].[Reason] ([ReasonSK])
GO
ALTER TABLE [Policy].[PolicyTransReason] CHECK CONSTRAINT [FK_ReasonSK_PolicyTransReason]
GO
ALTER TABLE [Policy].[PolicyTransReason]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransReason] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyTransReason] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransReason]
GO
