USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ProfitCenter]    Script Date: 28.10.2022 15:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ProfitCenter](
	[ProfitCenterSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ProfitCenterCode] [varchar](25) NULL,
	[ProfitCenterName] [varchar](50) NULL,
	[ProfitCenterEffectiveDate] [date] NULL,
	[ProfitCenterTerminationDate] [date] NULL,
 CONSTRAINT [PK_ProfitCenterType] PRIMARY KEY CLUSTERED 
(
	[ProfitCenterSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ProfitCenter]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1043] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ProfitCenter] NOCHECK CONSTRAINT [RefSourceSystem1043]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The appointed agency profit center identifier for financial reconciliation.
A code to identify individual profit centers, office locations, or some other organizational structure within the company.' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ProfitCenter'
GO
