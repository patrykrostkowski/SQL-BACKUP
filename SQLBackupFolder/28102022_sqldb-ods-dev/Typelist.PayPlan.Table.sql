USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[PayPlan]    Script Date: 28.10.2022 12:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[PayPlan](
	[PayPlanSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PayPlanCode] [varchar](20) NOT NULL,
	[PayPlanName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PayPlan] PRIMARY KEY CLUSTERED 
(
	[PayPlanSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PayPlan]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PayPlan] ON [Typelist].[PayPlan]
(
	[SourceSystemSK] ASC,
	[PayPlanCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[PayPlan]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_PayPlan] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[PayPlan] NOCHECK CONSTRAINT [FK_SourceSystemSK_PayPlan]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples quarterly, monthly, annual' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'PayPlan'
GO
