USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[CaseStatus]    Script Date: 27.10.2022 12:27:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[CaseStatus](
	[CaseStatusSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CaseStatusCode] [varchar](20) NOT NULL,
	[CaseStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CaseStatus] PRIMARY KEY CLUSTERED 
(
	[CaseStatusSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[CaseStatus]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CaseStatus] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[CaseStatus] NOCHECK CONSTRAINT [FK_SourceSystemSK_CaseStatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples, assigned, unassigned, pending' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'CaseStatus'
GO
