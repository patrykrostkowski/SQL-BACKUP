USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyForm]    Script Date: 28.10.2022 11:10:00 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicyForm]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicyForm] ON [Policy].[PolicyForm]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PolicyForm]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicySK_PolicyForm] FOREIGN KEY([PolicySK])
REFERENCES [Policy].[Policy] ([PolicySK])
GO
ALTER TABLE [Policy].[PolicyForm] NOCHECK CONSTRAINT [FK_PolicySK_PolicyForm]
GO
ALTER TABLE [Policy].[PolicyForm]  WITH NOCHECK ADD  CONSTRAINT [FK_PolicyTransSK_PolicyForm] FOREIGN KEY([PolicyTransSK])
REFERENCES [Policy].[PolicyTrans] ([PolicyTransSK])
GO
ALTER TABLE [Policy].[PolicyForm] NOCHECK CONSTRAINT [FK_PolicyTransSK_PolicyForm]
GO
ALTER TABLE [Policy].[PolicyForm]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyForm] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PolicyForm] NOCHECK CONSTRAINT [FK_SourceSystemSK_PolicyForm]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The policy forms that are the legal documents of a  policy declaration.  Policy forms  are  mostly industry standard, developed by insurance advisory organization such as ACORD,  ISO, AAIS and NCCI.' , @level0type=N'SCHEMA',@level0name=N'Policy', @level1type=N'TABLE',@level1name=N'PolicyForm'
GO
