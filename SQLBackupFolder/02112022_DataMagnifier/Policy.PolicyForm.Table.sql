USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PolicyForm]    Script Date: 02.11.2022 12:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyForm](
	[PolicyFormSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NULL,
	[ETLUpdateDateTime] [datetime] NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicySK] [int] NOT NULL,
	[PolicyFormNum] [varchar](20) NOT NULL,
	[PolicyFormDesc] [varchar](255) NULL,
	[PolicyTransSK] [int] NULL,
 CONSTRAINT [PK_PolicyForm] PRIMARY KEY CLUSTERED 
(
	[PolicyFormSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyForm]  WITH CHECK ADD  CONSTRAINT [FK_PolicySK_PolicyForm] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Policy].[PolicyForm] CHECK CONSTRAINT [FK_PolicySK_PolicyForm]
GO
ALTER TABLE [Policy].[PolicyForm]  WITH CHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyForm] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyForm] CHECK CONSTRAINT [FK_PolicyTransSK_PolicyForm]
GO
ALTER TABLE [Policy].[PolicyForm]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyForm] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyForm] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyForm]
GO
