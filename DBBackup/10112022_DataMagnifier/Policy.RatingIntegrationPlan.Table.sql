USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[RatingIntegrationPlan]    Script Date: 10.11.2022 14:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[RatingIntegrationPlan]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[RatingIntegrationPlan](
	[RatingIntegrationPlanSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[RatingIntegrationPlanDesc] [varchar](100) NOT NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[RatingIntegrationPlanBaseAmt] [decimal](19, 4) NOT NULL,
	[RatingIntegrationPlanOriginalAmt] [decimal](19, 4) NULL,
	[RatingIntegrationPlanReportingAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_RatingIntegrationPlan] PRIMARY KEY CLUSTERED 
(
	[RatingIntegrationPlanSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_RatingIntegrationPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingIntegrationPlan]'))
ALTER TABLE [Policy].[RatingIntegrationPlan]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_RatingIntegrationPlan] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_RatingIntegrationPlan]') AND parent_object_id = OBJECT_ID(N'[Policy].[RatingIntegrationPlan]'))
ALTER TABLE [Policy].[RatingIntegrationPlan] CHECK CONSTRAINT [FK_SourceSystemSK_RatingIntegrationPlan]
GO
