USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteRatingIntegrationPlan]    Script Date: 12.11.2022 09:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteRatingIntegrationPlan]') AND type in (N'U'))
BEGIN
CREATE TABLE [PreBind].[QuoteRatingIntegrationPlan](
	[QuoteRatingIntegrationPlanSK] [int] IDENTITY(2,1) NOT NULL,
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
 CONSTRAINT [PK_QuoteRatingIntegrationPlan] PRIMARY KEY CLUSTERED 
(
	[QuoteRatingIntegrationPlanSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
